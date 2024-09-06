// // import 'package:flutter/material.dart';

// // class EventOverview extends StatefulWidget {
// //   const EventOverview({super.key});

// //   @override
// //   State<EventOverview> createState() => _EventOverviewState();
// // }

// // class _EventOverviewState extends State<EventOverview> {
// //     List<bool> _expandedState = []; // Ensure this is an empty growable list

// //     void _toggleExpandAll() {
// //     setState(() {
// //       final expandAll = !_expandedState.every((isExpanded) => isExpanded);
// //       _expandedState = List<bool>.filled(_expandedState.length, expandAll);
// //     });
// //   }

// //   void _toggleCollapse() {
// //     setState(() {
// //       _expandedState = List<bool>.filled(_expandedState.length, false);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// // appBar: AppBar(
// //         title: const Text('Event Overview',style: TextStyle(color: Colors.white),),
// //         backgroundColor: Colors.yellow[700], // Set background color to yellow
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back),
// //           color:Colors.white,
// //           onPressed: () {
// //             // Handle back button press
// //           },
// //         ),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.save),
// //             color: Colors.white,
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => EventOverview()),
// //               );
// //             },
// //           ),
// //           IconButton(
// //             icon: const Icon(Icons.send_outlined),
// //             color: Colors.white,
// //             onPressed: () {
// //               // Navigate to Additional Information page
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => EventOverview()),
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //       body: ListView(
// //         padding: EdgeInsets.all(16.0),
// //         children: [
// //           // Event Title and Details
// //           ListTile(
// //             contentPadding: EdgeInsets.zero,
// //             title: Text(
// //               'Event with Environmental, Material and Social Loss/Impact_MAIN PLANNING & CONTROL - VOPC_OMAN-Process Plant',
// //               style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
// //             ),
// //             subtitle: Text('September 04, 2024 - 23:17'),
// //           ),
// //           Divider(),
          
// //           // Created By section
// //           ListTile(
// //             contentPadding: EdgeInsets.zero,
// //             leading: CircleAvatar(
// //   backgroundImage: AssetImage('assets/images/default_avatar.png'), // Path to your default avatar image
// //   radius: 20, // Adjust the size as needed
// // ),
// //             title: Text('Ali Salar Syed'),
// //             subtitle: Text('info@alphatic.net'),
// //           ),
          
// //           // SAP Title
// //           ListTile(
// //             contentPadding: EdgeInsets.zero,
// //             title: Text(
// //               'SAP Title',
// //               style: TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //             subtitle: Text(
// //               'Event with Personal Loss/Impact_MAIN PLANNING & CONTROL - VOPC_OMAN-Process Plant',
// //             ),
// //           ),
          
// //           // Description
// //           ListTile(
// //             contentPadding: EdgeInsets.zero,
// //             title: Text(
// //               'Description',
// //               style: TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //             subtitle: Text('ABC'),
// //           ),
// //           SizedBox(height: 16),
// //           Row(
// //               mainAxisAlignment: MainAxisAlignment.end,
// //               children: [
// //                 TextButton(
// //                   onPressed: _toggleExpandAll,
// //                   child: Text(
// //                     "Expand All",
// //                     style: TextStyle(color: Colors.blue),
// //                   ),
// //                 ),
// //                 TextButton(
// //                   onPressed: _toggleCollapse,
// //                   child: Text(
// //                     "Collapse All",
// //                     style: TextStyle(color: Colors.red),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             Divider(),
// //           // ExpansionTile for Basic Information
// //           ExpansionTile(
// //             title: Text(
// //               'Basic Information',
// //               style: TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //             children: [
// //               ListTile(
// //                 title: Text('Organizational Unit',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('MAIN PLANNING & CONTROL - VOPC / 50721745 /'),
// //               ),
// //               ListTile(
// //                 title: Text('Location',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('OMAN-Process Plant / 6478'),
// //               ),
// //               ListTile(
// //                 title: Text('Location Description',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('ABC'),
// //               ),
// //             ],
// //           ),
// //           ExpansionTile(
// //             title: Text(
// //               'People',
// //               style: TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //             children: [
// //               ListTile(
// //                 title: Text('Organizational Unit',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('MAIN PLANNING & CONTROL - VOPC / 50721745 /'),
// //               ),
// //               ListTile(
// //                 title: Text('Location',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('OMAN-Process Plant / 6478'),
// //               ),
// //               ListTile(
// //                 title: Text('Location Description',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('ABC'),
// //               ),
// //             ],
// //           ),
// //           ExpansionTile(
// //             title: Text(
// //               'Environmental Impact',
// //               style: TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //             children: [
// //               ListTile(
// //                 title: Text('Organizational Unit',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('MAIN PLANNING & CONTROL - VOPC / 50721745 /'),
// //               ),
// //               ListTile(
// //                 title: Text('Location',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('OMAN-Process Plant / 6478'),
// //               ),
// //               ListTile(
// //                 title: Text('Location Description',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('ABC'),
// //               ),
// //             ],
// //           ),
// //           ExpansionTile(
// //             title: Text(
// //               'Assets',
// //               style: TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //             children: [
// //               ListTile(
// //                 title: Text('Organizational Unit',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('MAIN PLANNING & CONTROL - VOPC / 50721745 /'),
// //               ),
// //               ListTile(
// //                 title: Text('Location',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('OMAN-Process Plant / 6478'),
// //               ),
// //               ListTile(
// //                 title: Text('Location Description',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('ABC'),
// //               ),
// //             ],
// //           ),
// //           ExpansionTile(
// //             title: Text(
// //               'Community Members',
// //               style: TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //             children: [
// //               ListTile(
// //                 title: Text('Organizational Unit',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('MAIN PLANNING & CONTROL - VOPC / 50721745 /'),
// //               ),
// //               ListTile(
// //                 title: Text('Location',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('OMAN-Process Plant / 6478'),
// //               ),
// //               ListTile(
// //                 title: Text('Location Description',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('ABC'),
// //               ),
// //             ],
// //           ),
// //           ExpansionTile(
// //             title: Text(
// //               'Additional Information',
// //               style: TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //             children: [
// //               ListTile(
// //                 title: Text('Organizational Unit',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('MAIN PLANNING & CONTROL - VOPC / 50721745 /'),
// //               ),
// //               ListTile(
// //                 title: Text('Location',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('OMAN-Process Plant / 6478'),
// //               ),
// //               ListTile(
// //                 title: Text('Location Description',style: TextStyle(fontWeight: FontWeight.w700),),
// //                 subtitle: Text('ABC'),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';

// class EventOverview extends StatefulWidget {
//   const EventOverview({super.key});

//   @override
//   State<EventOverview> createState() => _EventOverviewState();
// }

// class _EventOverviewState extends State<EventOverview> {
//   List<bool> _expandedState = []; // List to manage expansion state of each tile

//   @override
//   void initState() {
//     super.initState();
//     _expandedState = List<bool>.filled(6, false); // Initialize with 6 ExpansionTiles all collapsed
//   }

//   void _toggleExpandAll() {
//     print("${_expandedState}_expandedState");
//     setState(() {
//       final expandAll = !_expandedState.every((isExpanded) => isExpanded);
//       _expandedState = List<bool>.filled(_expandedState.length, expandAll);
//     });
//   }

//   void _toggleCollapse() {
//         print("${_expandedState}_expandedState");

//     setState(() {
//       _expandedState = List<bool>.filled(_expandedState.length, false);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Event Overview', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.yellow[700],
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           color: Colors.white,
//           onPressed: () {
//             // Handle back button press
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.save),
//             color: Colors.white,
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => EventOverview()),
//               );
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.send_outlined),
//             color: Colors.white,
//             onPressed: () {
//               // Navigate to Additional Information page
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => EventOverview()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(16.0),
//         children: [
//           ListTile(
//             contentPadding: EdgeInsets.zero,
//             title: Text(
//               'Event with Environmental, Material and Social Loss/Impact_MAIN PLANNING & CONTROL - VOPC_OMAN-Process Plant',
//               style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
//             ),
//             subtitle: Text('September 04, 2024 - 23:17'),
//           ),
//           Divider(),
//           ListTile(
//             contentPadding: EdgeInsets.zero,
//             leading: CircleAvatar(
//               backgroundImage: AssetImage('assets/images/default_avatar.png'),
//               radius: 20,
//             ),
//             title: Text('Ali Salar Syed'),
//             subtitle: Text('info@alphatic.net'),
//           ),
//           ListTile(
//             contentPadding: EdgeInsets.zero,
//             title: Text(
//               'SAP Title',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text(
//               'Event with Personal Loss/Impact_MAIN PLANNING & CONTROL - VOPC_OMAN-Process Plant',
//             ),
//           ),
//           ListTile(
//             contentPadding: EdgeInsets.zero,
//             title: Text(
//               'Description',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             subtitle: Text('ABC'),
//           ),
//           SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               TextButton(
//                 onPressed: _toggleExpandAll,
//                 child: Text(
//                   "Expand All",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//               TextButton(
//                 onPressed: _toggleCollapse,
//                 child: Text(
//                   "Collapse All",
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//             ],
//           ),
//           Divider(),
          
//           // ExpansionTiles
//           ExpansionTile(
//             title: Text('Basic Information', style: TextStyle(fontWeight: FontWeight.bold)),
//             initiallyExpanded: _expandedState[0],
//             onExpansionChanged: (expanded) {
//               setState(() {
//                 _expandedState[0] = expanded;
//               });
//     print("${_expandedState}_expandedState");
//             },
//             children: [
//               ListTile(
//                 title: Text('Organizational Unit', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('MAIN PLANNING & CONTROL - VOPC / 50721745 /'),
//               ),
//               ListTile(
//                 title: Text('Location', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('OMAN-Process Plant / 6478'),
//               ),
//               ListTile(
//                 title: Text('Location Description', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('ABC'),
//               ),
//             ],
//           ),
          
//           ExpansionTile(
//             title: Text('People', style: TextStyle(fontWeight: FontWeight.bold)),
//             initiallyExpanded: _expandedState[1],
//             onExpansionChanged: (expanded) {
//               setState(() {
//                 _expandedState[1] = expanded;
//               });
//             },
//             children: [
//               ListTile(
//                 title: Text('Organizational Unit', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('MAIN PLANNING & CONTROL - VOPC / 50721745 /'),
//               ),
//               ListTile(
//                 title: Text('Location', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('OMAN-Process Plant / 6478'),
//               ),
//               ListTile(
//                 title: Text('Location Description', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('ABC'),
//               ),
//             ],
//                     ),
//           ExpansionTile(
//             title: Text('Environmental Impact', style: TextStyle(fontWeight: FontWeight.bold)),
//             initiallyExpanded: _expandedState[2],
//             onExpansionChanged: (expanded) {
//               setState(() {
//                 _expandedState[2] = expanded;
//               });
//             },
//             children: [
//               ListTile(
//                 title: Text('Organizational Unit', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('MAIN PLANNING & CONTROL - VOPC / 50721745 /'),
//               ),
//               ListTile(
//                 title: Text('Location', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('OMAN-Process Plant / 6478'),
//               ),
//               ListTile(
//                 title: Text('Location Description', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('ABC'),
//               ),
//             ],
//           ),
//           ExpansionTile(
//             title: Text('Assets', style: TextStyle(fontWeight: FontWeight.bold)),
//             initiallyExpanded: _expandedState[3],
//             onExpansionChanged: (expanded) {
//               setState(() {
//                 _expandedState[3] = expanded;
//               });
//             },
//             children: [
//               ListTile(
//                 title: Text('Organizational Unit', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('MAIN PLANNING & CONTROL - VOPC / 50721745 /'),
//               ),
//               ListTile(
//                 title: Text('Location', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('OMAN-Process Plant / 6478'),
//               ),
//               ListTile(
//                 title: Text('Location Description', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('ABC'),
//               ),
//             ],
//           ),
//           ExpansionTile(
//             title: Text('Community Members', style: TextStyle(fontWeight: FontWeight.bold)),
//             initiallyExpanded: _expandedState[4],
//             onExpansionChanged: (expanded) {
//               setState(() {
//                 _expandedState[4] = expanded;
//               });
//             },
//             children: [
//               ListTile(
//                 title: Text('Organizational Unit', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('MAIN PLANNING & CONTROL - VOPC / 50721745 /'),
//               ),
//               ListTile(
//                 title: Text('Location', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('OMAN-Process Plant / 6478'),
//               ),
//               ListTile(
//                 title: Text('Location Description', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('ABC'),
//               ),
//             ],
//           ),
//           ExpansionTile(
//             title: Text('Additional Information', style: TextStyle(fontWeight: FontWeight.bold)),
//             initiallyExpanded: _expandedState[5],
//             onExpansionChanged: (expanded) {
//               setState(() {
//                 _expandedState[5] = expanded;
//               });
//             },
//             children: [
//               ListTile(
//                 title: Text('Organizational Unit', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('MAIN PLANNING & CONTROL - VOPC / 50721745 /'),
//               ),
//               ListTile(
//                 title: Text('Location', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('OMAN-Process Plant / 6478'),
//               ),
//               ListTile(
//                 title: Text('Location Description', style: TextStyle(fontWeight: FontWeight.w700)),
//                 subtitle: Text('ABC'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/additionalInformation.dart';

class EventOverview extends StatefulWidget {
  const EventOverview({super.key});

  @override
  State<EventOverview> createState() => _EventOverviewState();
}

class _EventOverviewState extends State<EventOverview> {
  List<bool> _expandedState = []; // List to manage expansion state of each section

  final List<Map<String, dynamic>> sections = [
    {
      'title': 'Basic Information',
      'data': [
        {'label': 'Organizational Unit', 'value': 'MAIN PLANNING & CONTROL - VOPC / 50721745 /'},
        {'label': 'Location', 'value': 'OMAN-Process Plant / 6478'},
        {'label': 'Location Description', 'value': 'ABC'},
      ],
    },
    {
      'title': 'People',
      'data': [
        {'label': 'Organizational Unit', 'value': 'MAIN PLANNING & CONTROL - VOPC / 50721745 /'},
        {'label': 'Location', 'value': 'OMAN-Process Plant / 6478'},
        {'label': 'Location Description', 'value': 'ABC'},
      ],
    },
    {
      'title': 'Environmental Impact',
      'data': [
        {'label': 'Organizational Unit', 'value': 'MAIN PLANNING & CONTROL - VOPC / 50721745 /'},
        {'label': 'Location', 'value': 'OMAN-Process Plant / 6478'},
        {'label': 'Location Description', 'value': 'ABC'},
      ],
    },
        {
      'title': 'Assets',
      'data': [
        {'label': 'Organizational Unit', 'value': 'MAIN PLANNING & CONTROL - VOPC / 50721745 /'},
        {'label': 'Location', 'value': 'OMAN-Process Plant / 6478'},
        {'label': 'Location Description', 'value': 'ABC'},
      ],
    },
        {
      'title': 'Community Members',
      'data': [
        {'label': 'Organizational Unit', 'value': 'MAIN PLANNING & CONTROL - VOPC / 50721745 /'},
        {'label': 'Location', 'value': 'OMAN-Process Plant / 6478'},
        {'label': 'Location Description', 'value': 'ABC'},
      ],
    },
        {
      'title': 'Additional Information',
      'data': [
        {'label': 'Organizational Unit', 'value': 'MAIN PLANNING & CONTROL - VOPC / 50721745 /'},
        {'label': 'Location', 'value': 'OMAN-Process Plant / 6478'},
        {'label': 'Location Description', 'value': 'ABC'},
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _expandedState = List<bool>.filled(sections.length, false); // Initialize with all collapsed
  }

  void _toggleExpandAll() {
    setState(() {
      final expandAll = !_expandedState.every((isExpanded) => isExpanded);
      _expandedState = List<bool>.filled(sections.length, expandAll);
    });
  }

  void _toggleCollapse() {
    setState(() {
      _expandedState = List<bool>.filled(sections.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Overview', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.yellow[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdditionalInformationPage()),
              );          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EventOverview()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.send_outlined),
            color: Colors.white,
            onPressed: () {
              // Navigate to Additional Information page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EventOverview()),
              );
            },
          ),
        ],
      ),
      body: Container(
                decoration: BoxDecoration(color: Colors.white),

        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            // Event Title and Details
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Event with Environmental, Material and Social Loss/Impact_MAIN PLANNING & CONTROL - VOPC_OMAN-Process Plant',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
              ),
              subtitle: Text('September 04, 2024 - 23:17'),
            ),
            Divider(),
            // Created By section
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/default_avatar.png'),
                radius: 20,
              ),
              title: Text('Ali Salar Syed'),
              subtitle: Text('info@alphatic.net'),
            ),
            Divider(),
            // SAP Title
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'SAP Title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Event with Personal Loss/Impact_MAIN PLANNING & CONTROL - VOPC_OMAN-Process Plant',
              ),
            ),
            Divider(),
            // Description
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Description',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('ABC'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            Divider(),
            
            // Generate the sections dynamically
            ListView.builder(
              physics: NeverScrollableScrollPhysics(), // Disable scrolling for inner list
              shrinkWrap: true, // Ensures inner ListView takes only necessary space
              itemCount: sections.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        sections[index]['title'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(_expandedState[index]
                            ? Icons.expand_less
                            : Icons.expand_more),
                        onPressed: () {
                          setState(() {
                            _expandedState[index] = !_expandedState[index];
                          });
                        },
                      ),
                    ),
                    if (_expandedState[index])
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: sections[index]['data'].length,
                        itemBuilder: (context, dataIndex) {
                          return ListTile(
                            title: Text(
                              sections[index]['data'][dataIndex]['label'],
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            subtitle: Text(
                              sections[index]['data'][dataIndex]['value'],
                            ),
                          );
                        },
                      ),
                    Divider(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
