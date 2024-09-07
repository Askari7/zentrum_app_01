import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/actionComponent.dart';
import 'package:zentrum_app_01/components/form.dart';

class ActivityComponent extends StatefulWidget {
  const ActivityComponent({super.key});

  @override
  State<ActivityComponent> createState() => _ActivityComponentState();
}

class _ActivityComponentState extends State<ActivityComponent> {
    List<String>  options =  ['No', 'Yes'];

     Map<String, String> answers = {};

   void updateAnswer(String question, String answer) {
     setState(() {
       answers[question] = answer;
     });
   }
  @override
  Widget build(BuildContext context) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

      children: [

      Column(
                        children: [
                          
                          Text(
                            "Were immediate actions taken to mitigate further impacts of the event?",
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
                                  onPressed: () => updateAnswer("2",option),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white ,
                                    foregroundColor: Colors.black,
                                    side: BorderSide(
                                    color: answers["2"] == option ? Colors.blue : Colors.grey[300]!,
                                      width: 2.0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 48.0),
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
                        if(answers["2"]=="Yes")
                        ActionComponent(),
                        Text(
                  'Keep going!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ListTile(
            leading: SizedBox(
              width: 100, // Set width for the progress bar
              child: LinearProgressIndicator(
                value: 0.25, // 25% progress
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                minHeight: 8,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward, color: Colors.blue),
              onPressed: () {
                Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FormPage()),
                );
              },
            ),
            title: Text('100% completed', style: TextStyle(fontSize: 16)),
                )
    ],
    );
  }
}