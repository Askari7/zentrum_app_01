import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/MAterialEvent.dart';
import 'package:zentrum_app_01/components/additionalInformation.dart';
import 'package:zentrum_app_01/components/countComponent.dart';
import 'package:zentrum_app_01/models/Question.dart';

class CommunityEvent extends StatefulWidget {
  const CommunityEvent({super.key});

  @override
  State<CommunityEvent> createState() => _CommunityEventState();
}

class _CommunityEventState extends State<CommunityEvent> {
  List<Question> questions = [
    Question(
      head: "Community Event",
      text:
          'Was there injury to a community member(not a Vale employee / contractor / subcontractor)?',
      options: ['No', 'Yes'],
      shouldShow: (answers) =>true,
          
      customComponent: (answers) {
        if ((answers[
                'Was there injury to a community member(not a Vale employee / contractor / subcontractor)?'] ==
            'Yes')) {
          return CountComponent(); // Replace with your custom component
        }
        return SizedBox.shrink(); // Returns an empty widget if not rendered
      },
    ),
    Question(
      text: 'COULD this event have led to a fatality of a community member?',
      options: ['No', 'Yes'],
      shouldShow: (answers) =>
          answers['Was there injury to a community member(not a Vale employee / contractor / subcontractor)?'] ==
              'No' ||
          answers['Was there injury to a community member(not a Vale employee / contractor / subcontractor)?'] ==
              'Yes',
    ),
  ];

  Map<String, String> answers = {};

  void updateAnswer(String question, String answer) {
    print("$answers answers");
    setState(() {
      answers[question] = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: const Text(
      'Event Details',
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.yellow[700],
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      color: Colors.white,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MaterialEvent()),
        );
      },
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.save),
        color: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CommunityEvent()),
          );
        },
      ),
      IconButton(
        icon: const Icon(Icons.arrow_forward),
        color: Colors.white,
        onPressed: () {
          // Navigate to Additional Information page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdditionalInformationPage()),
          );
        },
      ),
    ],
  ),
      body: Container(
    decoration: BoxDecoration(color: Colors.white),
    child: SizedBox(
       height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
      child: ListView(
        children: [
          ...questions.where((q) => q.shouldShow(answers)).map((question) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (question.head != null)
                    Container(
                      width: double.infinity, // Full width
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // Background color
                        borderRadius: BorderRadius.circular(8.0), // Optional: rounded corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              question.head!,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black, // Arrow color
                            ),
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            question.text,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: question.options.map((option) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          onPressed: () => updateAnswer(question.text, option),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            side: BorderSide(
                              color: answers[question.text] == option
                                  ? Colors.blue
                                  : Colors.grey[300]!,
                              width: 2.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding:
                                EdgeInsets.symmetric(vertical: 8.0, horizontal: 62.0),
                          ),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      );
                    }).toList(),

                  ),
                        // Display custom component if defined
                        if (question.customComponent != null)
                          question.customComponent!(answers),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  
                ],
              ),
            );
            
          }).toList(),
        if (answers['COULD this event have led to a fatality of a community member?']=="Yes"||
        answers['COULD this event have led to a fatality of a community member?']=="No")
          Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                        'Keep going!',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        
                        ),
                        trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdditionalInformationPage()),
                );
              },
            ),
                        subtitle: Text("50 %"),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearProgressIndicator(
                          value: 0.5, // 50% progress
                          backgroundColor: Colors.grey[300],
                          color: Colors.green,
                          minHeight: 8.0,
                        ),
                      ),
                    ],
                  ),
                ),
        ],
        
      ),
    ),
  
),
    );
  
  }
}
