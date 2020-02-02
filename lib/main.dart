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
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Chooser(),
          ),
        ),
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
          CustomRB(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => Frm1(title: 'frm 1',))
            ),
            txt: 'frm 1',
          ),
          CustomRB(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Frm2(title: 'frm 2',))
            ),
            txt: 'frm 2',
          ),
        ],
      ),
    );
  }
}
