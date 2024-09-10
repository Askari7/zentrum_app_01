import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/PersonalEvent.dart';

class NoLossesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // The warning icon (red exclamation mark)
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 100,
            ),
            SizedBox(height: 20),
            
            // Main message text
            Text(
              'No losses or potential losses were identified at the event.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            
            // Sub-message text
            Text(
              'Based on your responses, this event should not be reported on this system. Review the information or discard the record.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Spacer(),
            
            // "Revise Answers" link
            TextButton(
              onPressed: () {
                Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PersonalEvent()),
          );
              },
              child: Text(
                'Revise Answers',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
