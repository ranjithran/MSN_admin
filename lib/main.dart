import 'frm1.dart';
import 'frm2.dart';
import 'package:admin/userNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'res/widgets/customRB.dart';

void main() => runApp(MyApp());

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
        create: (context) => UserNotifier(),
        lazy: true,
        child: Chooser(),
      ),
    );
  }
}

class Chooser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CutomRB(
            onPressed: () {},
            txt: 'frm 1',
          ),
          CutomRB(
            onPressed: () {},
            txt: 'frm 2',
          ),
        ],
      ),
    );
  }
}
