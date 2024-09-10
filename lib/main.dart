import 'package:flutter/material.dart';
import 'package:zentrum_app_01/components/CommunityEvent.dart';
import 'package:zentrum_app_01/components/EnvironmentEvent.dart';
import 'package:zentrum_app_01/components/MAterialEvent.dart';
import 'package:zentrum_app_01/components/NoLossesScreen.dart';
import 'package:zentrum_app_01/components/PersonalEvent.dart';
import 'package:zentrum_app_01/components/SafeBehaviour.dart';
import 'package:zentrum_app_01/components/additionalInformation.dart';
import 'package:zentrum_app_01/components/basicInformation.dart';
import 'package:zentrum_app_01/components/form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      home: BasicInformation(),
    );
  }
}

