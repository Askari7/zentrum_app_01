import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/CommunityEvent.dart';
import 'package:zentrum_app_01/components/EnvironmentEvent.dart';
import 'package:zentrum_app_01/models/Question.dart';

class MaterialEvent extends StatefulWidget {
  const MaterialEvent({super.key});

  @override
  State<MaterialEvent> createState() => _MaterialEventState();
}

class _MaterialEventState extends State<MaterialEvent> {
  List<Question> questions = [
    Question(
      head: "Material Event",
      text: 'Was there material damage?',
      options: ['No', 'Yes'],
      shouldShow: (answers) => true,
    ),
    Question(
      text: 'Operational equipment or assets were directly involved in the event?',
      options: ['No', 'Yes'],
      shouldShow: (answers) => answers['Was there material damage?'] == 'Yes',
    ),
    Question(
      text: 'Operational equipment or assets were directly involved in the event?',
      options: ['No', 'Yes'],
      shouldShow: (answers) => answers['Was there material damage?'] == 'No',
    ),
    Question(
      text: 'Are you a CPIA coordinator or a member of the CPIA registration group? (Attention: if you are not answer NO)',
      options: ['No', 'Yes'],
      shouldShow: (answers) => answers['Operational equipment or assets were directly involved in the event?'] == 'No',
    ),
    Question(
      text: 'Is this Operational Process Safety Event (P Event)?',
      options: ['No', 'Yes'],
      shouldShow: (answers) => answers['Operational equipment or assets were directly involved in the event?'] == 'Yes',
    ),
    Question(
      text: 'Are you a CPIA coordinator or a member of the CPIA registration group? (Attention: if you are not answer NO)',
      options: ['No', 'Yes'],
      shouldShow: (answers) => answers['Is this Operational Process Safety Event (P Event)?'] == 'No',
    ),
    Question(
      text: 'Are you a CPIA coordinator or a member of the CPIA registration group? (Attention: if you are not answer NO)',
      options: ['No', 'Yes'],
      shouldShow: (answers) => answers['Is this Operational Process Safety Event (P Event)?'] == 'Yes',
    ),
    Question(
      text: 'Is this event an operational occurrence?',
      options: ['No', 'Yes'],
      shouldShow: (answers) => answers['Are you a CPIA coordinator or a member of the CPIA registration group? (Attention: if you are not answer NO)'] == 'Yes',
    ),
  ];

  Map<String, String> answers = {};
  bool showEventNatureDropdown = false;

  void updateAnswer(String question, String answer) {
    setState(() {
      answers[question] = answer;
      if (question == 'Select the type of property') {
        showEventNatureDropdown = false; // Reset dropdown visibility
      }
      // Show dropdown based on checkbox selection
      if (answers['Operational Incident Nature'] == 'Yes' || 
          answers['Operational Near Miss Nature'] == 'Yes') {
        showEventNatureDropdown = true;
      }
    });
    checkAndNavigateToEnvironmentEvent();
  }

    void checkAndNavigateToEnvironmentEvent() {
  print(answers);

  // Check the answer to a particular question
  if ((answers.containsKey('Are you a CPIA coordinator or a member of the CPIA registration group? (Attention: if you are not answer NO)') &&
      answers['Are you a CPIA coordinator or a member of the CPIA registration group? (Attention: if you are not answer NO)']=="No")||

    
      (answers.containsKey('Is this event an operational occurrence?') &&
      answers['Is this event an operational occurrence?']=="No"||answers['Is this event an operational occurrence?']=="Yes")

  
      ) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CommunityEvent()),
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
          MaterialPageRoute(builder: (context) => EnvironmentEvent()),
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
            MaterialPageRoute(builder: (context) => MaterialEvent()),
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
            MaterialPageRoute(builder: (context) => CommunityEvent()),
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
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (question.head != null)
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8.0),
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
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
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
                                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 62.0),
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
                            ),
                            // Display checkboxes conditionally
                            
                          ],
                        ),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                );
              }).toList(),
              // Display "Select the type of property" as a text question if applicable
              if (answers['Is this event an operational occurrence?'] == 'Yes')
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Select the type of property',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                if (
                                answers['Is this event an operational occurrence?'] == 'Yes')
                              Column(
                                children: [
                                  CheckboxListTile(
                                    title: Text("Operational Incident Nature"),
                                    value: answers['Operational Incident Nature'] == 'Yes',
                                    onChanged: (bool? value) {
                                      setState(() {
                                        answers['Operational Incident Nature'] = value! ? 'Yes' : 'No';
                                        // Update dropdown visibility
                                        showEventNatureDropdown = true;
                                      });
                                    },
                                  ),
                                  CheckboxListTile(
                                    title: Text("Operational Near Miss Nature"),
                                    value: answers['Operational Near Miss Nature'] == 'Yes',
                                    onChanged: (bool? value) {
                                      setState(() {
                                        answers['Operational Near Miss Nature'] = value! ? 'Yes' : 'No';
                                        // Update dropdown visibility
                                        showEventNatureDropdown = true;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            // Additional select for event nature
                            if (showEventNatureDropdown)
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Select the nature of the event',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButton<String>(
                                        value: answers['Event Nature'],
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            answers['Event Nature'] = newValue!;
                                          });
                                        },
                                        items: <String>['Nature A', 'Nature B', 'Nature C']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
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
