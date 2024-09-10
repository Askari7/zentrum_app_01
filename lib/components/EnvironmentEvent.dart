import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/MAterialEvent.dart';
import 'package:zentrum_app_01/components/PersonalEvent.dart';
import 'package:zentrum_app_01/models/Question.dart';

class EnvironmentEvent extends StatefulWidget {
  const EnvironmentEvent({super.key});

  @override
  State<EnvironmentEvent> createState() => _EnvironmentEventState();
}

class _EnvironmentEventState extends State<EnvironmentEvent> {
  List<Question> questions = [


    Question(
      head: "Environmental Event",
      text:
          'Did the event impact the environment(soil, surface water, air, biodiversity)?',
      options: ['No', 'Yes'],
      shouldShow: (answers) =>true

    ),

    Question(
      text:
          'Does this event have POTENTIAL to impact the environment(soil, surface water, air, biodiversity)?',
      options: ['No', 'Yes'],
      shouldShow: (answers) =>
          answers[
              'Did the event impact the environment(soil, surface water, air, biodiversity)?'] ==
          'No',
    ),
        Question(
       text: 'Is there POTENTIAL for the environmental impact to require actions BEYOUND those immediately implemented or require external support?',
       options: ['No', 'Yes'],
       shouldShow: (answers) => answers['Does this event have POTENTIAL to impact the environment(soil, surface water, air, biodiversity)?'] == 'Yes',
     ),

        Question(
      text:
          'Was the environmental impact controlled using ONLY immediate actions and internal resources?',
      options: ['No', 'Yes'],
      shouldShow: (answers) =>
          answers[
              'Did the event impact the environment(soil, surface water, air, biodiversity)?'] ==
          'Yes',
    ),


    Question(
      text:
          'Is there POTENTIAL for the environmental impact to require actions BEYOUND those immediately implemented or require external support?',
      options: ['No', 'Yes'],
      shouldShow: (answers) =>
          answers[
              'Was the environmental impact controlled using ONLY immediate actions and internal resources?'] ==
          'Yes',
    ),

        Question(
      text:
          'COULD the environmental impact affect beyound the immediate vicinity of the event?',
      options: ['No', 'Yes'],
      shouldShow: (answers) =>
          answers[
              'Is there POTENTIAL for the environmental impact to require actions BEYOUND those immediately implemented or require external support?'] ==
          'Yes',
    ),


    Question(
      text: 'COULD the environmental impact affect areas protected by law?',
      options: ['No', 'Yes'],
      shouldShow: (answers) =>
          answers[
              'COULD the environmental impact affect beyound the immediate vicinity of the event?'] ==
          'Yes',
    ),

    Question(
      text: 'COULD this event have led to a fatality or a life changed?',
      options: ['No', 'Yes'],
      shouldShow: (answers) =>
          answers[
              'COULD this event have injured or lead to health impacts to a Vale employee or contractor?'] ==
          'Yes',
    ),

    Question(
        head: "Environmental Event",
        text:
            'Did the event impact the environment(soil, surface water, air, biodiversity)?',
        options: ['No', 'Yes'],
        shouldShow: (answers) =>
            answers[
                'COULD this event have led to a fatality or a life changed?'] ==
            'Yes'),
    Question(
        head: "Environmental Event",
        text:
            'Did the event impact the environment(soil, surface water, air, biodiversity)?',
        options: ['No', 'Yes'],
        shouldShow: (answers) =>
            answers[
                'COULD this event have led to a fatality or a life changed?'] ==
            'No'),
  ];

  Map<String, String> answers = {};

  void updateAnswer(String question, String answer) {
    print("$answers answers");
    setState(() {
      answers[question] = answer;
    });
checkAndNavigateToEnvironmentEvent();
  }
  void checkAndNavigateToEnvironmentEvent() {

  // Check the answer to a particular question
  if ((answers.containsKey('Does this event have POTENTIAL to impact the environment(soil, surface water, air, biodiversity)?') &&
      answers['Does this event have POTENTIAL to impact the environment(soil, surface water, air, biodiversity)?']=="No")||

      (answers.containsKey('Is there POTENTIAL for the environmental impact to require actions BEYOUND those immediately implemented or require external support?') &&
      answers['Is there POTENTIAL for the environmental impact to require actions BEYOUND those immediately implemented or require external support?']=="No")||
      

      (answers.containsKey('COULD the environmental impact affect areas protected by law?') &&
      answers['COULD the environmental impact affect areas protected by law']=="No"||answers['COULD the environmental impact affect areas protected by law?']=="Yes")||

      (answers.containsKey('COULD the environmental impact affect beyound the immediate vicinity of the event?') &&
      answers['COULD the environmental impact affect beyound the immediate vicinity of the event?']=="No")

      ) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MaterialEvent()),
      );
    });
  }
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
          MaterialPageRoute(builder: (context) => PersonalEvent()),
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
            MaterialPageRoute(builder: (context) => EnvironmentEvent()),
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
            MaterialPageRoute(builder: (context) => MaterialEvent()),
          );
        },
      ),
    ],
  ),      body: Container(
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
        ],
      ),
    ),
  
)
    );

  }
}
