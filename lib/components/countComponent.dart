import 'package:flutter/material.dart';

class CountComponent extends StatefulWidget {
  const CountComponent({super.key});

  @override
  State<CountComponent> createState() => _CountComponentState();
}

class _CountComponentState extends State<CountComponent> {
  int _fatalitiesCount = 0;

  void _increaseCount() {
    setState(() {
      _fatalitiesCount++;
    });
  }

  void _decreaseCount() {
    setState(() {
      if (_fatalitiesCount > 0) {
        _fatalitiesCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'How many fatalities involving community members?',
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     IconButton(
          //       icon: Icon(Icons.remove),
          //       onPressed: _decreaseCount,
          //     ),
          //     Text(
          //       '$_fatalitiesCount',
          //     ),
          //     IconButton(
          //       icon: Icon(Icons.add),
          //       onPressed: _increaseCount,
          //     ),
          //   ],
          // ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Remove button with text (clickable)
                GestureDetector(
                  onTap: _decreaseCount, // Executes when clicking either icon or text
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
                    '${_fatalitiesCount}',
                    style: TextStyle(fontSize: 18, color: Colors.grey[300]),
                  ),
                ),
                
                // Add more button with text (clickable)
                GestureDetector(
                  onTap: _increaseCount, // Executes when clicking either icon or text
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
                    
                    ],
                  ),
                ),
              ],
            ),
          SizedBox(height: 16), // Add space between rows
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'How many community members were injured(Non-fatal)',
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     IconButton(
          //       icon: Icon(Icons.remove),
          //       onPressed: _decreaseCount,
          //     ),
          //     Text(
          //       '$_fatalitiesCount',
          //     ),
          //     IconButton(
          //       icon: Icon(Icons.add),
          //       onPressed: _increaseCount,
          //     ),
            // ],
          // ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Remove button with text (clickable)
                GestureDetector(
                  onTap: _decreaseCount, // Executes when clicking either icon or text
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
                    '${_fatalitiesCount}',
                    style: TextStyle(fontSize: 18, color: Colors.grey[300]),
                  ),
                ),
                
                // Add more button with text (clickable)
                GestureDetector(
                  onTap: _increaseCount, // Executes when clicking either icon or text
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
                    
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
