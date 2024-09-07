import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/PersonalEvent.dart';
import 'package:zentrum_app_01/components/additionalInformation.dart';
import 'package:zentrum_app_01/components/form.dart';

class Safebehaviour extends StatefulWidget {
  const Safebehaviour({super.key});

  @override
  State<Safebehaviour> createState() => _SafebehaviourState();
}

class _SafebehaviourState extends State<Safebehaviour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: const Text(
      'Classify the event',
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
            MaterialPageRoute(builder: (context) => FormPage()),
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: Column(
                    children: [
                      Text(
                        "Classify the events",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Center(
                          child: Text(
                            "Safe Behaviours",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Safe Behaviors",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Enter text",
                    border: OutlineInputBorder(),
                    fillColor: Colors.grey[200],
                    focusColor: Colors.grey[200],
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Safe Behaviors: Use this category to register positive recognition of expected actions and behaviors from observed workers.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Column(
                  children: [
                    _buildCheckItem("Procedures and Instructions"),
                    _buildCheckItem("Personal Conduct"),
                    _buildCheckItem("Training/Fit for Work"),
                    _buildCheckItem("Ergonomic/Fatigue"),
                    _buildCheckItem("PPE/Clothing"),
                    _buildCheckItem("Tools, Machinery, Equipment"),
                  ],
                ),
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
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AdditionalInformationPage()),
                            );
                          },
                        ),
                        subtitle: Text("75 %"),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearProgressIndicator(
                          value: 0.75, // 75% progress
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
      ),
    );
  }

  Widget _buildCheckItem(String title) {
    return CheckboxListTile(
      title: Text(title),
      value: false,
      onChanged: (bool? newValue) {
        // Handle checkbox state change
      },
      secondary: Icon(Icons.arrow_forward),
    );
  }
}
