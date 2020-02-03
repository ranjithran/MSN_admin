import 'package:admin/userNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'forms/deliveryFrm.dart';
import 'forms/intradayFrm.dart';
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
              MaterialPageRoute(builder: (_) => IntradayFrm(title: 'IntradayFrm',))
            ),
            txt: 'IntradayFrm',
          ),
          CustomRB(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => DeliveryFrm(title: 'DeliveryFrm',))
            ),
            txt: 'DeliveryFrm',
          ),
        ],
      ),
    );
  }
}
