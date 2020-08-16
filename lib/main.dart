
import 'package:firestoreplay/screens/streamAdd.dart';
import 'package:firestoreplay/screens/dashboard.dart';
import 'package:firestoreplay/screens/streamDelete.dart';
import 'package:firestoreplay/screens/streamRead.dart';
import 'package:firestoreplay/screens/streamUpdate.dart';
import 'package:firestoreplay/screens/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: AddDataToFireStore(),
    );
  }
}

