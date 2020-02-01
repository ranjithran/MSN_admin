import 'package:admin/userNotifier.dart';
import 'package:flutter/material.dart';
import 'AdminForm.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<UserNotifier>(
        create: (context)=>UserNotifier(),
        lazy: true,
        child: AdminForm(title: 'main')),
    );
  }
}
