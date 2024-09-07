import 'package:flutter/material.dart';

class WorkerInfo extends StatefulWidget {
  const WorkerInfo({super.key});

  @override
  State<WorkerInfo> createState() => _WorkerInfoState();
}

class _WorkerInfoState extends State<WorkerInfo> {
  int _selectedValue = 1; // Initialize the selected value with a default option
  bool _showAdditionalQuestion = false; // Track whether to show the additional question
  List<String> _selectedConsequences = []; // Track selected consequences
  List<String> options = ['No', 'Yes'];
  String question = 'Did the injury require care beyond first aid?';
  Map<String, String> answers = {};

  void updateAnswer(String question, String answer) {
    setState(() {
      answers[question] = answer;

      if (question == 'Is this injury work related?') {
        if (answer == 'Yes') {
          _showAdditionalQuestion = true;
        } else {
          _showAdditionalQuestion = false;
          _selectedConsequences.clear(); // Clear consequences if "No" is selected
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: Icon(Icons.help_outline, color: Colors.blue),
                title: Text('Is this injury work related?'),
              ),
              Column(
                children: [
                  RadioListTile(
                    title: Text('Work-related'),
                    value: 1,
                    groupValue: _selectedValue,
                    fillColor: MaterialStateProperty.all(Colors.grey[300]), // Apply blue fill color
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                        updateAnswer('Is this injury work related?', 'Work-related');
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Commuting'),
                    value: 2,
                    groupValue: _selectedValue,
                    fillColor: MaterialStateProperty.all(Colors.grey[300]), // Apply blue fill color
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                        updateAnswer('Is this injury work related?', 'Commuting');
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text('Non-work-related'),
                    value: 3,
                    groupValue: _selectedValue,
                    fillColor: MaterialStateProperty.all(Colors.grey[300]), // Apply blue fill color
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                        updateAnswer('Is this injury work related?', 'Non-work-related');
                      });
                    },
                  ),
                ],
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: Icon(Icons.help_outline, color: Colors.blue),
                title: Text(question),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: options.map((option) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () => updateAnswer(question, option),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: BorderSide(
                          color: answers[question] == option ? Colors.blue : Colors.grey[300]!,
                          width: 2.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
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

              if (answers[question]=="Yes") ...[
                SizedBox(height: 20),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  trailing: Icon(Icons.help_outline, color: Colors.blue),
                  title: Text('Select the consequence of the injury, if known:'),
                ),
                CheckboxListTile(
                  title: Text('Medical Treatment'),
                  value: _selectedConsequences.contains('Medical Treatment'),
                  fillColor: MaterialStateProperty.all(Colors.grey[300]), // Apply blue fill color
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _selectedConsequences.add('Medical Treatment');
                      } else {
                        _selectedConsequences.remove('Medical Treatment');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Restriction'),
                  value: _selectedConsequences.contains('Restriction'),
                  fillColor: MaterialStateProperty.all(Colors.grey[300]), // Apply blue fill color
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _selectedConsequences.add('Restriction');
                      } else {
                        _selectedConsequences.remove('Restriction');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Lost Time'),
                  value: _selectedConsequences.contains('Lost Time'),
                  fillColor: MaterialStateProperty.all(Colors.grey[300]), // Apply blue fill color
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _selectedConsequences.add('Lost Time');
                      } else {
                        _selectedConsequences.remove('Lost Time');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Fatality'),
                  value: _selectedConsequences.contains('Fatality'),
                  fillColor: MaterialStateProperty.all(Colors.grey[300]), // Apply blue fill color
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _selectedConsequences.add('Fatality');
                      } else {
                        _selectedConsequences.remove('Fatality');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Unknown'),
                  value: _selectedConsequences.contains('Unknown'),
                  fillColor: MaterialStateProperty.all(Colors.grey[300]), // Apply blue fill color
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _selectedConsequences.add('Unknown');
                      } else {
                        _selectedConsequences.remove('Unknown');
                      }
                    });
                  },
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
