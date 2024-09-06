import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/additionalComponent.dart';
import 'package:zentrum_app_01/components/eventOverview.dart';
import 'package:zentrum_app_01/components/form.dart';

class AdditionalInformationPage extends StatefulWidget {
  @override
  _AdditionalInformationPageState createState() =>
      _AdditionalInformationPageState();
}

class _AdditionalInformationPageState extends State<AdditionalInformationPage> {
  List<String>  options =  ['No', 'Yes'];
   Map<String, String> answers = {};

   void updateAnswer(String question, String answer) {
     setState(() {
       answers[question] = answer;
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Additional Details',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.yellow[700], // Set background color to yellow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color:Colors.white,
          onPressed: () {
Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormPage()),
              );          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdditionalInformationPage()),
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
                MaterialPageRoute(builder: (context) => EventOverview()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
                  decoration: BoxDecoration(color: Colors.white),
        
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Additional Information',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.yellow[700]),
                  ),
                ),
                SizedBox(height: 8),
                Text.rich(
            TextSpan(
              text: 'The registered event was classified as an ', // Normal text
              style: TextStyle(fontSize: 14),
              children: <TextSpan>[
          TextSpan(
            text: 'Event with Personal Loss/Impact', // Bold text
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: '. Fill in the additional information regarding this event.', // Normal text after bold
          ),
              ],
            ),
          ),
          
                SizedBox(height: 16),
          
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Text(
                            "Did the event happen during the execution of a work TASK/ACTIVITY?",
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
                                  onPressed: () => updateAnswer("1",option),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: option == 'NO' ? Colors.white : Colors.grey[300],
                                    foregroundColor: Colors.black,
                                    side: BorderSide(
                                      color: Colors.blue,
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
                AdditionalComponentPage(),
          
                Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                  onPressed: () => updateAnswer("1",option),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: option == 'NO' ? Colors.white : Colors.grey[300],
                                    foregroundColor: Colors.black,
                                    side: BorderSide(
                                      color: Colors.blue,
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
          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
