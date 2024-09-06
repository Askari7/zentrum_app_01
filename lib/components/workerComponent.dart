import 'package:flutter/material.dart';

class WorkerComponent extends StatefulWidget {
  const WorkerComponent({super.key});

  @override
  State<WorkerComponent> createState() => _WorkerComponentState();
}

class _WorkerComponentState extends State<WorkerComponent> {
  List<bool> _expandedState = []; // Ensure this is an empty growable list

  void _addWorker() {
    setState(() {
      _expandedState.add(false); // Add a new worker with collapsed state
    });
  }

  void _removeLastWorker() {
    if (_expandedState.isNotEmpty) {
      setState(() {
        _expandedState.removeLast(); // Remove the last worker added
      });
    }
  }

  void _removeWorker(int index) {
    if (index >= 0 && index < _expandedState.length) {
      setState(() {
        _expandedState.removeAt(index); // Remove the worker at the given index
      });
    }
  }

  void _toggleExpandAll() {
    setState(() {
      final expandAll = !_expandedState.every((isExpanded) => isExpanded);
      _expandedState = List<bool>.filled(_expandedState.length, expandAll);
    });
  }

  void _toggleCollapse() {
    setState(() {
      _expandedState = List<bool>.filled(_expandedState.length, false);
    });
  }

  void _toggleCard(int index) {
    setState(() {
      if (index >= 0 && index < _expandedState.length) {
        _expandedState[index] = !_expandedState[index]; // Toggle the state of the clicked worker
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remove button with text (clickable)
                GestureDetector(
                  onTap: _removeLastWorker, // Executes when clicking either icon or text
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4), // Padding around the icon
                        decoration: BoxDecoration(
                          color: Colors.blue, // Blue background
                          shape: BoxShape.circle, // Circular icon background
                        ),
                        child: Icon(Icons.remove, color: Colors.white), // White icon
                      ),
                      SizedBox(width: 5), // Spacing between icon and text
                      Text(
                        'Remove',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                
                // Display the current count of workers with a border
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Padding around text
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey), // Border color
                    borderRadius: BorderRadius.circular(5), // Rounded corners
                  ),
                  child: Text(
                    '${_expandedState.length}',
                    style: TextStyle(fontSize: 18, color: Colors.grey[300]),
                  ),
                ),
                
                // Add more button with text (clickable)
                GestureDetector(
                  onTap: _addWorker, // Executes when clicking either icon or text
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4), // Padding around the icon
                        decoration: BoxDecoration(
                          color: Colors.blue, // Blue background
                          shape: BoxShape.circle, // Circular icon background
                        ),
                        child: Icon(Icons.add, color: Colors.white), // White icon
                      ),
                      SizedBox(width: 5), // Spacing between icon and text
                      Text(
                        'Add More',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _toggleExpandAll,
                  child: Text(
                    "Expand All",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                TextButton(
                  onPressed: _toggleCollapse,
                  child: Text(
                    "Collapse",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            
            Column(
              children: List.generate(_expandedState.length, (index) {
                var _selectedValue;
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _removeWorker(index); // Remove the worker at the specific index
                          },
                        ),
                        title: Text('Worker ${index + 1}'),
                        trailing: IconButton(
                          icon: Icon(
                            _expandedState[index]
                                ? Icons.expand_less
                                : Icons.expand_more,
                          ),
                          onPressed: () => _toggleCard(index),
                        ),
                      ),
                      if (_expandedState[index])
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Is this injury work related?'),
                                  Column(
                                    children: [
                                      RadioListTile(
                                        title: Text('Work-related'),
                                        value: 1,
                                        groupValue: _selectedValue,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedValue = value!;
                                          });
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text('Commuting'),
                                        value: 2,
                                        groupValue: _selectedValue,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedValue = value!;
                                          });
                                        },
                                      ),
                                      RadioListTile(
                                        title: Text('Non-work-related'),
                                        value: 3,
                                        groupValue: _selectedValue,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedValue = value!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Text('Did the injury require care beyond first aid?'),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Set answer as NO
                                          },
                                          child: Text('NO'),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Set answer as YES
                                          },
                                          child: Text('YES'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                );
              }),
            ),
            
          ],
        ),
      ),
    );
  }
}
