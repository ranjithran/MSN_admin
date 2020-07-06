import 'package:admin/Logic/FirebaseAuthServices.dart';
import 'package:admin/Logic/Locator.dart';
import 'package:admin/res/colors.dart';
import 'package:admin/res/widgets/UserListWidgets.dart';
import 'package:admin/userNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key key}) : super(key: key);
  final FirebaseAuthServices firebaseAuthServices =
      locator<FirebaseAuthServices>();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text("Admin"),
        backgroundColor: m0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Provider.of<UserNotifier>(context, listen: false)
                  .gettingUserList();
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              firebaseAuthServices.signOut(context);
            },
            icon: Icon(Icons.power_settings_new),
          ),
        ],
      ),
      body: Container(
          color: m1,
          child: Consumer<UserNotifier>(
            builder: (context, _, child) => ListView.builder(
              itemBuilder: (context, _index) => UserListWidget(
                ui: _.data[_index].uid ?? "",
                name: _.data[_index].name ?? "",
                phonenumber: _.data[_index].phonenumber ?? "",
                status: _.data[_index].statustime.substring(0, 8) ?? "",
              ),
              itemCount: _.data.length,
            ),
          )),
    );
  }
}
