import 'package:flutter/material.dart';

class Propertycomponent extends StatefulWidget {
  const Propertycomponent({super.key});

  @override
  State<Propertycomponent> createState() => _PropertycomponentState();
}

class _PropertycomponentState extends State<Propertycomponent> {
  @override
  Widget build(BuildContext context) {
      Map<String, String> answers = {};

  void updateAnswer(String question, String answer) {
    print("$answers answers");
    setState(() {
      answers[question] = answer;
    });
  }
    return Column(
      children: [
        

        Column(
                              children: [
                                CheckboxListTile(
                                  title: Text("Operational Incident Nature"),
                                  value: answers['Operational Incident Nature'] == 'Yes',
                                  onChanged: (bool? value) {
                                    setState(() {
                                      answers['Operational Incident Nature'] = value! ? 'Yes' : 'No';
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text("Operational Near Miss Nature"),
                                  value: answers['Operational Near Miss Nature'] == 'Yes',
                                  onChanged: (bool? value) {
                                    setState(() {
                                      answers['Operational Near Miss Nature'] = value! ? 'Yes' : 'No';
                                    });
                                  },
                                ),
                              ],
                            ),
                          // Additional select for event nature
                          if (answers['Operational Incident Nature'] == 'Yes' ||
                              answers['Operational Near Miss Nature'] == 'Yes')
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Select the nature of the event',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  DropdownButton<String>(
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
                                ],
                              ),
                            )
      ],
    );
  }
}