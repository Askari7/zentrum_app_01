import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/SafeBehaviour.dart';
import 'package:zentrum_app_01/components/basicInformation.dart';
import 'package:zentrum_app_01/components/workerComponent.dart';
import 'package:zentrum_app_01/models/Question.dart';
import 'package:zentrum_app_01/components/EnvironmentEvent.dart'; // Import EnvironmentEvent

class PersonalEvent extends StatefulWidget {
  const PersonalEvent({super.key});

  @override
  State<PersonalEvent> createState() => _PersonalEventState();
}

class _PersonalEventState extends State<PersonalEvent> {
  List<Question> questions = [
    Question(
      head: "Personal Event",
      text: 'Was a Vale employee or contractor injured?',
      options: ['No', 'Yes'],
      shouldShow: (_) => true,
      customComponent: (answers) {
        if (answers['Was a Vale employee or contractor injured?'] == 'Yes') {
          return WorkerComponent(); // Replace with your custom component
        }
        return SizedBox.shrink(); // Returns an empty widget if not rendered
      },
    ),
    Question(
      text: 'COULD this event have injured or lead to health impacts to a Vale employee or contractor?',
      options: ['No', 'Yes'],
      shouldShow: (answers) =>
          answers['Was a Vale employee or contractor injured?'] == 'No',
    ),
    Question(
      text: 'COULD this event have led to a fatality or a life changed?',
      options: ['No', 'Yes'],
      shouldShow: (answers) =>
          answers['COULD this event have injured or lead to health impacts to a Vale employee or contractor?'] == 'Yes',
    ),
    Question(
      text: 'Is this event only a positive recognition of a behaviour?',
      options: ['No', 'Yes'],
      shouldShow: (answers) =>
          answers['COULD this event have injured or lead to health impacts to a Vale employee or contractor?'] == 'No',
    ),
  ];

  Map<String, String> answers = {};

  void updateAnswer(String question, String answer) {
    setState(() {
      answers[question] = answer;
    });
    // Check if all answers are 'No'
    checkAndNavigateToEnvironmentEvent();
  }

  // Function to check if all answers are 'No'
void checkAndNavigateToEnvironmentEvent() {
  print(answers);

  // Check the answer to a particular question
  if ((answers.containsKey('Is this event only a positive recognition of a behaviour?') &&
      answers['Is this event only a positive recognition of a behaviour?']=="No")||
      (answers.containsKey('COULD this event have led to a fatality or a life changed?') &&
      answers['COULD this event have led to a fatality or a life changed?']=="No"||
      answers['COULD this event have led to a fatality or a life changed?']=="No")

      ) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EnvironmentEvent()),
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
          MaterialPageRoute(builder: (context) => BasicInformation()),
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
            MaterialPageRoute(builder: (context) => PersonalEvent()),
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
            MaterialPageRoute(builder: (context) => EnvironmentEvent()),
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
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (question.head != null)
                        Container(
                          width: double.infinity, // Full width
                          decoration: BoxDecoration(
                            color: Colors.grey[300], // Background color
                            borderRadius:
                                BorderRadius.circular(8.0), // Optional: rounded corners
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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question.text,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: question.options.map((option) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        updateAnswer(question.text, option),
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
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 64.0),
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
                ),
              );
            }).toList(),
            // Progress bar conditionally rendered
            if (answers['Is this event only a positive recognition of a behaviour?'] == 'Yes')
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
                            MaterialPageRoute(builder: (context) => Safebehaviour()),
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
