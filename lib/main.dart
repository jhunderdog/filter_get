import 'package:filter_get/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

List<String> defaultList = [
  'Flutter Developer',
  'React Native Developer',
  'Swift Developer',
  'Java Developer',
  'C# Developer',
  'C++ Developer',
  'Full Stack Developer',
  'HTML Developer',
  'CSS Developer',
  'Perl Perl',
  '.Net Perl',
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Filter Application',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}
