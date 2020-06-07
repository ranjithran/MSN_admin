import 'package:admin/Widgets/UserListWidgets.dart';
import 'package:admin/res/colors.dart';
import 'package:admin/userNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: m0,
        actions: <Widget>[IconButton(onPressed: (){
        final UserNotifier userNotifier = Provider.of(context, listen: false);
    getUers(userNotifier);
        },icon: Icon(Icons.refresh),)],
      ),

      body: Container(
          color: m1,
          child: Consumer<UserNotifier>(
            builder: (context, _, child) => ListView.builder(
              itemBuilder: (context, _index) => UserListWidget(name: _.userList[_index]??""),
              itemCount: _.userList.length,
            ),
          )),
    );
  }
}
