// import 'package:flutter/material.dart';
// import 'package:zentrum_app_01/components/Comp.dart';
// import 'package:zentrum_app_01/components/additionalInformation.dart';
// import 'package:zentrum_app_01/components/basicInformation.dart';
// import 'package:zentrum_app_01/components/countComponent.dart';
// import 'package:zentrum_app_01/components/workerComponent.dart';
// import 'package:zentrum_app_01/models/Question.dart';

// class FormPage extends StatefulWidget {
//   const FormPage({super.key});

//   @override
//   State<FormPage> createState() => _FormPageState();
// }

// class _FormPageState extends State<FormPage> {
//   List<Question> questions = [
//     Question(
//       head: "Personal Event",
//   text: 'Was a Vale employee or contractor injured?',
//   options: ['No', 'Yes'],
//   shouldShow: (_) => true,
//   customComponent: (answers) {
//     if (answers['Was a Vale employee or contractor injured?'] == 'Yes') {
//       return WorkerComponent(); // Replace with your custom component
//     }
//     return SizedBox.shrink(); // Returns an empty widget if not rendered
//   },
// ),
//      Question(
//        text: 'COULD this event have led to a fatality or a life changed?',
//        options: ['No', 'Yes'],
//        shouldShow: (answers) => answers['Was a Vale employee or contractor injured?'] == 'Yes',
//      ),
//      Question(
//        text: 'COULD this event have injured or lead to health impacts to a Vale employee or contractor?',
//        options: ['No', 'Yes'],
//        shouldShow: (answers) => answers['Was a Vale employee or contractor injured?'] == 'No',
//      ),
//     Question(
//       text: 'Is this event only a positive recognition of a behaviour?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers['COULD this event have injured or lead to health impacts to a company employee or contractor?'] =='No',),
//     Question(
//       text: 'Is this event only a positive recognition of a behaviour?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers[
//               'Is this event only a positive recognition of a behaviour?'] ==
//           'Yes',
//       customComponent: (answers) {
//         if (answers['Was a Vale employee or contractor injured?'] == 'No' ||
//             answers["COULD this event have injured or lead to health impacts to a Vale employee or contractor?"] ==
//                 'No') {
//           return Comp(); // Replace with your custom component
//         }
//         return SizedBox.shrink(); // Returns an empty widget if not rendered
//       },
//     ),

//     Question(
//       head: "Environmental Event",
//       text:
//           'Did the event impact the environment(soil, surface water, air, biodiversity)?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers[
//               'Is this event only a positive recognition of a behaviour?'] ==
//           'No',
//     ),

//     Question(
//       text:
//           'Does this event have POTENTIAL to impact the environment(soil, surface water, air, biodiversity)?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers[
//               'Did the event impact the environment(soil, surface water, air, biodiversity)?'] ==
//           'No',
//     ),

//     Question(
//         head: "Material Event",
//         text: 'Was there material damage?',
//         options: ['No', 'Yes'],
//         shouldShow: (answers) =>
//             answers[
//                 'Does this event have POTENTIAL to impact the environment(soil, surface water, air, biodiversity)?'] ==
//             'No'),

//     Question(
//       text: 'COULD this event have led to a fatality or a life changed?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers[
//               'COULD this event have injured or lead to health impacts to a Vale employee or contractor?'] ==
//           'Yes',
//     ),

//     Question(
//         head: "Environmental Event",
//         text:
//             'Did the event impact the environment(soil, surface water, air, biodiversity)?',
//         options: ['No', 'Yes'],
//         shouldShow: (answers) =>
//             answers[
//                 'COULD this event have led to a fatality or a life changed?'] ==
//             'Yes'),
//     Question(
//         head: "Environmental Event",
//         text:
//             'Did the event impact the environment(soil, surface water, air, biodiversity)?',
//         options: ['No', 'Yes'],
//         shouldShow: (answers) =>
//             answers[
//                 'COULD this event have led to a fatality or a life changed?'] ==
//             'No'),

//     Question(
//       text:
//           'Was the environmental impact controlled using ONLY immediate actions and internal resources?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers[
//               'Did the event impact the environment(soil, surface water, air, biodiversity)?'] ==
//           'Yes',
//     ),

//     // Question(
//     //    text: 'Did the event have an environmental impact beyound the immediate vicinity of the event?',
//     //    options: ['No', 'Yes'],
//     //    shouldShow: (answers) => answers['Was the environmental impact controlled using ONLY immediate actions and internal resources?'] == 'No',
//     //  ),

//     // Question(
//     //    text: 'COULD the environmental impact affect beyound the immediate vicinity of the event?',
//     //    options: ['No', 'Yes'],
//     //    shouldShow: (answers) => answers['Did the event have an environmental impact beyound the immediate vicinity of the event?'] == 'No',
//     //  ),

//     //      Question(
//     //   head: "Material Event",
//     //    text: 'Was there material damage?',
//     //    options: ['No', 'Yes'],
//     //    shouldShow: (answers) => answers['COULD the environmental impact affect beyound the immediate vicinity of the event?'] == 'No'
//     //  ),

//     Question(
//       text:
//           'Is there POTENTIAL for the environmental impact to require actions BEYOUND those immediately implemented or require external support?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers[
//               'Was the environmental impact controlled using ONLY immediate actions and internal resources?'] ==
//           'Yes',
//     ),

//     // Question(
//     //    text: 'Is there POTENTIAL for the environmental impact to require actions BEYOUND those immediately implemented or require external support?',
//     //    options: ['No', 'Yes'],
//     //    shouldShow: (answers) => answers['Does this event have POTENTIAL to impact the environment(soil, surface water, air, biodiversity)?'] == 'Yes',
//     //  ),

//     Question(
//       text:
//           'COULD the environmental impact affect beyound the immediate vicinity of the event?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers[
//               'Is there POTENTIAL for the environmental impact to require actions BEYOUND those immediately implemented or require external support?'] ==
//           'Yes',
//     ),
//     Question(
//       text: 'COULD the environmental impact affect areas protected by law',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers[
//               'COULD the environmental impact affect beyound the immediate vicinity of the event?'] ==
//           'Yes',
//     ),

//     Question(
//         head: "Material Event",
//         text: 'Was there material damage?',
//         options: ['No', 'Yes'],
//         shouldShow: (answers) =>
//             answers[
//                 'COULD the environmental impact affect beyound the immediate vicinity of the event?'] ==
//             'No'),

//     Question(
//         head: "Material Event",
//         text: 'Was there material damage?',
//         options: ['No', 'Yes'],
//         shouldShow: (answers) =>
//             answers[
//                 'Did the event have an environmental impact beyound the immediate vicinity of the event?'] ==
//             'Yes'),
//     Question(
//         head: "Material Event",
//         text: 'Was there material damage?',
//         options: ['No', 'Yes'],
//         shouldShow: (answers) =>
//             answers[
//                 'COULD the environmental impact affect areas protected by law'] ==
//             'Yes'),

//     Question(
//       text:
//           'Operational equipment or assets were directly involved in the event?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) => answers['Was there material damage?'] == 'Yes',
//     ),

//     Question(
//       text:
//           'Operational equipment or assets were directly involved in the event?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) => answers['Was there material damage?'] == 'No',
//     ),
//     Question(
//       text:
//           'Are you a CPIA coordinator or a member of the CPIA registration group?(Attention: if you are not answer NO)',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers[
//               'Operational equipment or assets were directly involved in the event?'] ==
//           'No',
//     ),
//     Question(
//       text: 'Is this Operational Process Safety Event (P Event)?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers[
//               'Operational equipment or assets were directly involved in the event?'] ==
//           'Yes',
//     ),
//     Question(
//       text:
//           'Are you a CPIA coordinator or a member of the CPIA registration group?(Attention: if you are not answer NO)',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers['Is this Operational Process Safety Event (P Event)?'] ==
//           'No',
//     ),
//     Question(
//       text:
//           'Are you a CPIA coordinator or a member of the CPIA registration group?(Attention: if you are not answer NO)',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers['Is this Operational Process Safety Event (P Event)?'] ==
//           'Yes',
//     ),

//     Question(
//       text: 'Is this event an operational occurence?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers[
//               'Are you a CPIA coordinator or a member of the CPIA registration group?(Attention: if you are not answer NO)'] ==
//           'Yes',
//     ),
//     Question(
//       head: "Community Event",
//       text:
//           'Was there injury to a community member(not a Vale employee / contractor / subcontractor)?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers['Is this event an operational occurence?'] == 'No' ||
//           answers['Are you a CPIA coordinator or a member of the CPIA registration group?(Attention: if you are not answer NO)'] ==
//               'No',
//       customComponent: (answers) {
//         if ((answers[
//                 'Was there injury to a community member(not a Vale employee / contractor / subcontractor)?'] ==
//             'Yes')) {
//           return CountComponent(); // Replace with your custom component
//         }
//         return SizedBox.shrink(); // Returns an empty widget if not rendered
//       },
//     ),
//     Question(
//       head: "Community Event",
//       text:
//           'Was there injury to a community member(not a Vale employee / contractor / subcontractor)?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers['Is this event an operational occurence?'] == 'Yes',
//       customComponent: (answers) {
//         if ((answers[
//                 'Was there injury to a community member(not a Vale employee / contractor / subcontractor)?'] ==
//             'Yes')) {
//           return CountComponent(); // Replace with your custom component
//         }
//         return SizedBox.shrink(); // Returns an empty widget if not rendered
//       },
//     ),
//     Question(
//       text: 'COULD this event have led to a fatality of a community member?',
//       options: ['No', 'Yes'],
//       shouldShow: (answers) =>
//           answers['Was there injury to a community member(not a Vale employee / contractor / subcontractor)?'] ==
//               'No' ||
//           answers['Was there injury to a community member(not a Vale employee / contractor / subcontractor)?'] ==
//               'Yes',
//     ),
//   ];

//   Map<String, String> answers = {};

//   void updateAnswer(String question, String answer) {
//     print("$answers answers");
//     setState(() {
//       answers[question] = answer;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
  // appBar: AppBar(
  //   title: const Text(
  //     'Event Details',
  //     style: TextStyle(color: Colors.white),
  //   ),
  //   backgroundColor: Colors.yellow[700],
  //   leading: IconButton(
  //     icon: const Icon(Icons.arrow_back),
  //     color: Colors.white,
  //     onPressed: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => BasicInformation()),
  //       );
  //     },
  //   ),
  //   actions: [
  //     IconButton(
  //       icon: const Icon(Icons.save),
  //       color: Colors.white,
  //       onPressed: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => FormPage()),
  //         );
  //       },
  //     ),
  //     IconButton(
  //       icon: const Icon(Icons.arrow_forward),
  //       color: Colors.white,
  //       onPressed: () {
  //         // Navigate to Additional Information page
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => AdditionalInformationPage()),
  //         );
  //       },
  //     ),
  //   ],
  // ),
//   body: Container(
//     decoration: BoxDecoration(color: Colors.white),
//     child: ListView(
//       children: [
//         ...questions.where((q) => q.shouldShow(answers)).map((question) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (question.head != null)
//                   Container(
//                     width: double.infinity, // Full width
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300], // Background color
//                       borderRadius: BorderRadius.circular(8.0), // Optional: rounded corners
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             question.head!,
//                             style: TextStyle(
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Icon(
//                             Icons.arrow_drop_down,
//                             color: Colors.black, // Arrow color
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         question.text,
//                         style: TextStyle(
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: question.options.map((option) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: ElevatedButton(
//                         onPressed: () => updateAnswer(question.text, option),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           foregroundColor: Colors.black,
//                           side: BorderSide(
//                             color: answers[question.text] == option
//                                 ? Colors.blue
//                                 : Colors.grey[300]!,
//                             width: 2.0,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           padding:
//                               EdgeInsets.symmetric(vertical: 8.0, horizontal: 64.0),
//                         ),
//                         child: Text(
//                           option,
//                           style: TextStyle(
//                             fontSize: 16.0,
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                       // Display custom component if defined
//                       if (question.customComponent != null)
//                         question.customComponent!(answers),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
                
//               ],
//             ),
//           );
//         }).toList(),
//       ],
//     ),
//   ),
// );

//   }
// }


import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/CommunityEvent.dart';
import 'package:zentrum_app_01/components/EnvironmentEvent.dart';
import 'package:zentrum_app_01/components/MaterialEvent.dart';
import 'package:zentrum_app_01/components/PersonalEvent.dart';
import 'package:zentrum_app_01/components/additionalInformation.dart';
import 'package:zentrum_app_01/components/basicInformation.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: const Text(
      'Event Details',
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.yellow[700],
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      color: Colors.white,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BasicInformation()),
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
  body:  SingleChildScrollView(
      child:Column(children:[
        // PersonalEvent(),
        EnvironmentEvent(),
        MaterialEvent(),
        CommunityEvent(),
        // Padding(
        //           padding: const EdgeInsets.all(16.0),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               ListTile(
        //                 title: Text(
        //                 'Keep going!',
        //                 style: TextStyle(
        //                   fontSize: 16.0,
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.black,
        //                 ),
                        
        //                 ),
        //                 trailing: IconButton(
        //       icon: const Icon(Icons.arrow_forward),
        //       color: Colors.blue,
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => PersonalEvent()),
        //         );
        //       },
        //     ),
        //                 subtitle: Text("50 %"),
        //               ),
        //               SizedBox(height: 8.0),
        //               Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: LinearProgressIndicator(
        //                   value: 0.5, // 50% progress
        //                   backgroundColor: Colors.grey[300],
        //                   color: Colors.green,
        //                   minHeight: 8.0,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
      ],
      )
    ),
  );
  }
}