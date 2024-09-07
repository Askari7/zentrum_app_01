import 'package:flutter/material.dart';

class ActionInfo extends StatefulWidget {
  const ActionInfo({super.key});

  @override
  State<ActionInfo> createState() => _ActionInfoState();
}

class _ActionInfoState extends State<ActionInfo> {
  String? _description;
  bool _showUserInfo = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Describe the immediate action taken?'),
            ),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(),
              onChanged: (value) {
                setState(() {
                  _description = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(child: Text('Date of execution of the immediate action')),
                IconButton(
                  icon: Icon(Icons.help_outline),
                  onPressed: () {
                    // Logic to show help or tooltip
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text('Person who implemented immediate action'),
            SizedBox(height: 8.0),
        
            if (!_showUserInfo) ...[
              
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: BorderSide(
                          color: 
                              Colors.grey[300]!,
                          width: 2.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 24.0),
                      ),
                                        onPressed: () {
                      setState(() {
                        _showUserInfo = true;
                      });
                                        },
                                        child: Text('Myself'),
                                      ),
                    ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: BorderSide(
                          color
                              : Colors.grey[300]!,
                          width: 2.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 24.0),
                      ),
                    onPressed: () {
                      // Logic for "Other Person" selection
                    },
                    child: Text('Other Person'),
                  ),
                ),
                  ],
                ),
              )
            ],
        
            if (_showUserInfo)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'info@alphatic.net / Ali Salar Syed',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        _showUserInfo = false;
                      });
                    },
                  ),
                ],
              ),
          ],
        ),
                ),
              ],
            ),
      ],
    );
  }
}
