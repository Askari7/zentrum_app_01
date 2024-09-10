import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/SafeBehaviour.dart';

class ProcedureInstructionsPage extends StatefulWidget {
  @override
  _ProcedureInstructionsPageState createState() => _ProcedureInstructionsPageState();
}

class _ProcedureInstructionsPageState extends State<ProcedureInstructionsPage> {
  // List of procedures and instructions
  final List<String> procedures = [
    'Proper use of personal proective equipment(PPE)',
    'Exercising right to refuse unsafe work correctly',
    'Effective communication',
    'Entering restricted area with authorization',
    'Safe lifting/handling of loads',
    'Effective Lockout & Tagout',
    'Complying with traffic plan',
    'Performing task in the appropriate place',
    'Appropriate barricading',
    'Complying with the Safe Work Permit (SWP) process',
    'Complying with work standards',
  ];

  // List to track the state of each checkbox
  List<bool> isChecked=[];
  final List<String> options = ["Clear","Select"]; // E.g., ['Yes', 'No']

  @override
  void initState() {
    super.initState();
    // Initialize all checkboxes as unchecked
    isChecked = List<bool>.filled(procedures.length, false);
  }

  // Method to handle the CLEAR button press
  void clearSelection() {
    setState(() {
      isChecked = List<bool>.filled(procedures.length, false);
    });
  }

  // Method to handle the SELECT button press (you can define what it should do)
  void selectProcedures() {
    // Here, you can handle the logic for selected procedures
    // For example, print the selected items
    List<String> selectedProcedures = [];
    for (int i = 0; i < procedures.length; i++) {
      if (isChecked[i]) {
        selectedProcedures.add(procedures[i]);
      }
    }
    print('Selected Procedures: $selectedProcedures');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Procedures and Instructions',
              style: TextStyle(color: Colors.white,fontSize: 16),

        ),
            leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      color: Colors.white,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Safebehaviour()),
        );
      },
    ),
        actions: [
      IconButton(
        icon: const Icon(Icons.cancel),
        color: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Safebehaviour()),
          );
        },
      ),
        ]
      ),
      
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: procedures.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  
                  title: Text(procedures[index]),
                  value: isChecked[index],
                  
                  onChanged: (value) {
                    setState(() {
                      isChecked[index] = value!;
                    });
                  },
                );
              },
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     OutlinedButton(
          //       onPressed: clearSelection,
          //       child: Text('CLEAR'),
          //     ),
          //     OutlinedButton(
          //       onPressed: selectProcedures,
          //       child: Text('SELECT'),
          //     ),
          //   ],
          // ),

          Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: options.map((option) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    side: BorderSide(
                                    color:  Colors.grey[300]!,
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
        ],
      ),
    );
  }
}
