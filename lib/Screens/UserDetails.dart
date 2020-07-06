import 'package:admin/FormsNotifer.dart';
import 'package:admin/Screens/ChatScreen.dart';
import 'package:admin/forms/deliveryFrm.dart';
import 'package:admin/forms/intradayFrm.dart';
import 'package:admin/res/colors.dart';
import 'package:admin/res/widgets/IntSateForStless.dart';
import 'package:admin/res/widgets/customRB.dart';
import 'package:admin/userNotifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatelessWidget {
  final String uid;

  const UserDetails({Key key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return StartingState(
      initFunction: () {
        Provider.of<UserNotifier>(context, listen: false)
            .gettingUserDeatils(uid);
      },
      child: Scaffold(
        backgroundColor: m0,
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Consumer<UserNotifier>(
                    
                    builder: (context, _,child) {
                      return Text('${_.userData.name}',
                          style: TextStyle(
                            fontSize: 15,
                          ));
                    }
                  ),
                  background: FlutterLogo(),
                ),
                backgroundColor: m0,
                actions: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (_) => ChatPage(),
                      ),
                    ),
                    icon: Icon(
                      Icons.bubble_chart,
                      size: ScreenUtil().setSp(100),
                    ),
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    Container(
                      // color: m0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Card(
                        color: m1,
                        child: Ran(),
                      ),
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Card(color: m1, child: Opitions()))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ran extends StatelessWidget {
  const Ran({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 0,
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  // decoration: BoxDecoration(color:Colors.white10),
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(100),
                  child: Text("Name",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(45))),
                ),
                Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(100),
                  child: Text("U-id",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(45))),
                ),
                Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(100),
                  child: Text("G-mail",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(45))),
                ),
                Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(100),
                  child: Text("Phone Number",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(45))),
                ),
                Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(100),
                  child: Text("Last Advise",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(45))),
                ),
                Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(100),
                  child: Text("Last Logined",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(45))),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Container(
            padding: EdgeInsets.only(left: 20),
            child: Consumer<UserNotifier>(
              builder: (context, _, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(100),
                    child: Text("${_.userData.name ?? "--"}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(45))),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(100),
                    child: Text("${_.userData.uid ?? "--"}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(25))),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(100),
                    child: Text("${_.userData.email ?? "--"}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(45))),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(100),
                    child: Text("${_.userData.phonenumber ?? "--"}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(45))),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(100),
                    child: Text("Last Advise",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(45))),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(100),
                    child: Text("${_.userData.statustime ?? "--"}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(35))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Opitions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomRB(
            onPressed: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (_) => ChangeNotifierProvider<FormsNotifer>(
                    create: (context) => FormsNotifer(), child: IntradayFrm()),
              ),
            ),
            buttonTitle: 'Intraday',
          ),
          CustomRB(
            onPressed: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (_) => DeliveryFrm(),
              ),
            ),
            buttonTitle: 'DeliveryFrm',
          ),
        ],
      ),
    );
  }
}
