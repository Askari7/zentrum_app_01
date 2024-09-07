import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/actionInfo.dart';

class ActionComponent extends StatefulWidget {
  const ActionComponent({super.key});

  @override
  State<ActionComponent> createState() => _ActionComponentState();
}

class _ActionComponentState extends State<ActionComponent> {
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
    for (int i = 0; i < _expandedState.length; i++) {
      _expandedState[i] = expandAll;
    }
  });
}

void _toggleCollapse() {
  setState(() {
    for (int i = 0; i < _expandedState.length; i++) {
      _expandedState[i] = false;
    }
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Add_Remove_Worker(),
      
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
                  "Collapse All",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          
          Column(
            children: List.generate(_expandedState.length, (index) {
              return Card(
                color: Colors.white,
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
                      title: Text('Action ${index + 1}'),
                      trailing: IconButton(
                        icon: Icon(
                          _expandedState[index]
                              ? Icons.expand_less
                              : Icons.expand_more,
                        ),
                        onPressed: () => _toggleCard(index),
                      ),
                    ),
                    if(_expandedState[index])
                    ActionInfo(),
                    
                  ],
                ),
              );
            }),
          ),
          
        ],
      ),
    );
  }

  Row Add_Remove_Worker() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              // Display the current count of workers with a border
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
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
              ),
              
              // Add more button with text (clickable)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
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
              ),
            ],
          );
  }
}
