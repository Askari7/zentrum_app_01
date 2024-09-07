import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/ActivityComponent.dart';
import 'package:zentrum_app_01/components/actionComponent.dart';
import 'package:zentrum_app_01/components/eventOverview.dart';

class AdditionalComponentPage2 extends StatefulWidget {
  @override
  _AdditionalComponentPageState createState() =>
      _AdditionalComponentPageState();
}

class _AdditionalComponentPageState extends State<AdditionalComponentPage2> {
  String selectedCompany = "Vale / 1";
  bool isControlledActivity = false;
  List<String> options = ['No', 'Yes'];
  List<String> witness = ['Myself', 'Other Person'];
  String selectedVale = "VALE";
  bool isValeSelected = false;
  String? selectedRAC;
  String? witnessOption;

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
            'Select the area (supervisor or manager) responsible for the LOCATION where the event happened',
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

          // Company Selection Section
          Text(
            'Select the COMPANY responsible for the LOCATION where the event happened',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    // Logic to select Vale
                    final selectedOption = await showDialog<String>(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text('Select VALE option'),
                          children: [
                            SimpleDialogOption(
                              onPressed: () => Navigator.pop(context, 'Vale 1'),
                              child: Text('Vale 1'),
                            ),
                            SimpleDialogOption(
                              onPressed: () => Navigator.pop(context, 'Vale 2'),
                              child: Text('Vale 2'),
                            ),
                          ],
                        );
                      },
                    );
                    if (selectedOption != null) {
                      setState(() {
                        selectedVale = selectedOption;
                        isValeSelected = true;
                      });
                    }
                  },
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
                    selectedVale,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => {
                    
                  },
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
              ),
            ],
          ),

          // Conditional RAC Section (if Vale is selected)
          if (isValeSelected) ...[
            SizedBox(height: 16),
            Text(
              "Select the critical (RAC) associated with the event:",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: selectedRAC,
                hint: Text("Select RAC"),
                onChanged: (value) {
                  setState(() {
                    selectedRAC = value;
                  });
                },
                items: ["RAC 1", "RAC 2", "RAC 3"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
          if (isValeSelected && selectedVale =="CONTRACTOR") ...[
            SizedBox(height: 16),
            Text(
              "Select the critical (RAC) associated with the event:",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: selectedRAC,
                hint: Text("Select RAC"),
                onChanged: (value) {
                  setState(() {
                    selectedRAC = value;
                  });
                },
                items: ["RAC 1", "RAC 2", "RAC 3"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],

          // Witness Question
          SizedBox(height: 16),
          // Show "Who first communicated?" only if Vale is selected
          if (isValeSelected)
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: witness.map((option) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              witnessOption = option;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            side: BorderSide(
                              color: witnessOption == option
                                  ? Colors.blue
                                  : Colors.grey[300]!,
                              width: 2.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 32.0),
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

          // If witness option is "Myself", show the specific info and cancel button
          if (witnessOption == "Myself") ...[
            Divider(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'info@alphatic.net / Ali Salar Syed /',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      witnessOption = null; // Reset the witness option
                    });
                  },
                ),
              ],
            ),
            Divider(),
          ],

          // Immediate action question, only if "Myself" is selected
          if (witnessOption == "Myself")
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: options.map((option) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () => updateAnswer("2", option),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            side: BorderSide(
                              color: answers["2"] == option
                                  ? Colors.blue
                                  : Colors.grey[300]!,
                              width: 2.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 48.0),
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
                if (answers["2"] == "Yes") ActionComponent(),
              ],
            ),

          if (answers["2"] == "Yes"||answers["2"] == "No") 
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
                    value: 1, // 100% progress
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
    );
  }
}
