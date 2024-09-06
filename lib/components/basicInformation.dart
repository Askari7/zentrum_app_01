import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:image_picker/image_picker.dart';
import 'package:zentrum_app_01/components/form.dart'; // For picking images

class BasicInformation extends StatefulWidget {
  @override
  _BasicInformationState createState() => _BasicInformationState();
}

class _BasicInformationState extends State<BasicInformation> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _description;
  PickedFile? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Information', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.yellow[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {},
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormPage()),
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
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.logo_dev), // Leading icon
                  title: Text(
                    'Basic Information',
                    style: TextStyle(fontSize: 20, color: Colors.yellow[700], fontWeight: FontWeight.w700),
                  ), // Text next to the icon
                ),
                Text(
                  'When did the event occur?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () => _pickDate(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: _selectedDate == null
                          ? 'Select Date'
                          : DateFormat.yMMMd().format(_selectedDate!),
                      suffixIcon: Icon(Icons.calendar_today,color: Colors.grey,),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Time',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => _pickTime(context),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: _selectedTime == null
                          ? 'Select Time'
                          : _selectedTime!.format(context),
                      suffixIcon: Icon(Icons.access_time,color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  trailing: Icon(Icons.question_mark_outlined,color: Colors.grey), // Leading icon
                  title: Text('Describe the event:'), // Text next to the icon
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
                SizedBox(height: 20),
                Text(
                  'Add Image (Optional)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.add_a_photo, size: 35,color: Colors.grey),
                      title: Center(
                          child: Text(
                        'Add Image',
                        style: TextStyle(fontSize: 20,color: Colors.grey),
                      )),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                
                ListTile(
                  trailing: Icon(Icons.question_mark_outlined,color: Colors.grey), // Leading icon
                  title: Text(
                  'Select the location where the event happened',
                ), // Text next to the icon
                ),
          
                SizedBox(height: 10),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(),
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                ListTile(
                  trailing: Icon(Icons.question_mark_outlined,color: Colors.grey), // Leading icon
                  title: Text('Describe the location of the event'), // Text next to the icon
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
                SizedBox(height: 10),
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
            title: Text('25% completed', style: TextStyle(fontSize: 16)),
          ),
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
