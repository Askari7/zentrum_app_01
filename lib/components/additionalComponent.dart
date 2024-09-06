import 'package:flutter/material.dart';

class AdditionalComponentPage extends StatefulWidget {
  @override
  _AdditionalComponentPageState createState() =>
      _AdditionalComponentPageState();
}

class _AdditionalComponentPageState extends State<AdditionalComponentPage> {
  String selectedCompany = "Vale / 1";
  bool isControlledActivity = false;
  List<String> options = ['No', 'Yes'];
  List<String> witness = ['Myself', 'Other Person'];

  Map<String, String> answers = {};

  void updateAnswer(String question, String answer) {
    setState(() {
      answers[question] = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(), // Prevents scrolling conflict
        children: [
          // Supervisor/Manager Selection
          Text(
            'Select the area (supervisor or manager) responsible for the TASK/ACTIVITY performed at the time of the event',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          DropdownButton<String>(
            value: selectedCompany,
            onChanged: (String? newValue) {
              setState(() {
                selectedCompany = newValue!;
              });
            },
            items: <String>['Vale / 1', 'Other Company']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          // Controlled Activity
          Text(
            'Select the COMPANY responsible for the TASK/ACTIVITY performed at the time of the event?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                ),
                child: Text(
                  "VALE",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                ),
                child: Text(
                  "CONTRACTOR",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Controlled Activity Question
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Did the event happen during a controlled ACTIVITY?",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: options.map((option) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => updateAnswer("1", option),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 48.0),
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
          // Witness Question
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Who first communicated/witnessed the event? (optional)",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: witness.map((option) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () => updateAnswer("2", option),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
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
          Divider(),
          Row(
            children: [
              Container(
                child: Text(
                  'info@alphatic.net / Ali Salar Syed /',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  // Logic to remove or clear the information
                },
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
