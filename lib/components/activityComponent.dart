import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/actionComponent.dart';
import 'package:zentrum_app_01/components/eventOverview.dart';
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
                  MaterialPageRoute(builder: (context) => EventOverview()),
                );
              },
            ),
                        subtitle: Text("100 %"),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearProgressIndicator(
                          value: 1, // 50% progress
                          backgroundColor: Colors.grey[300],
                          color: Colors.green,
                          minHeight: 8.0,
                        ),
                      ),
                    ],
                  ),
                ),
    ],
    );
  }
}