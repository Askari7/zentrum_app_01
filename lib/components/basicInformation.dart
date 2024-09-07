import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:image_picker/image_picker.dart';
import 'package:zentrum_app_01/components/PersonalEvent.dart';
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

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
     _timeController.text = _selectedTime == null
        ? ''
        : _selectedTime!.format(context);
    _dateController.text = _selectedDate == null ? '' : DateFormat.yMMMd().format(_selectedDate!);
  }

  void _pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        _timeController.text = _selectedTime!.format(context);
      });
    }
  }
  void _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat.yMMMd().format(_selectedDate!);
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
                MaterialPageRoute(builder: (context) => PersonalEvent()),
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
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListTile(
                    leading: Icon(Icons.logo_dev), // Leading icon
                    title: Text(
                      'Basic Information',
                      style: TextStyle(fontSize: 20, color: Colors.yellow[700], fontWeight: FontWeight.w700),
                    ), // Text next to the icon
                  ),
                ),
                Text(
                  'When did the event occur?',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                TextField(
      controller: _dateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Select Date',
        suffixIcon: Icon(Icons.calendar_today, color: Colors.grey[600]),
      ),
      readOnly: true, // Prevents user from typing manually
      onTap: () => _pickDate(context),
    ),
                SizedBox(height: 10),
                Text(
                  'Time',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextField(
        controller: _timeController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Select Time',
          suffixIcon: Icon(Icons.access_time, color: Colors.grey[600]),
        ),
        readOnly: true, // Prevents user from typing manually
              onTap: () => _pickTime(context),

      ),
                SizedBox(height: 10),
                ListTile(
                  trailing: Icon(Icons.help_outline_rounded,color: Colors.grey[600]), // Leading icon
                  title: Text('Describe the event:'), // Text next to the icon
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(),
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Add Image (Optional)',
                  style: TextStyle(fontSize: 18,),
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
                  trailing: Icon(Icons.help_outline_rounded,color: Colors.grey[600]), // Leading icon
                  title: Text(
                  'Select the location where the event happened',
                ), // Text next to the icon
                ),
          
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(),
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  trailing: Icon(Icons.help_outline_rounded,color: Colors.grey[600]), // Leading icon
                  title: Text('Describe the location of the event'), // Text next to the icon
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(),
                    onChanged: (value) {
                      setState(() {
                        _description = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10),
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
                  MaterialPageRoute(builder: (context) => PersonalEvent()),
                );
              },
            ),
                        subtitle: Text("25 %"),
                      ),
                      SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearProgressIndicator(
                          value: 0.25, // 50% progress
                          backgroundColor: Colors.grey[600],
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
}
