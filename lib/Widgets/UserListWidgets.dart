import 'package:admin/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserListWidget extends StatelessWidget {
  final String name;
  const UserListWidget({
    Key key, this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(230),
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: mBtn,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Card(
                elevation: 3,
                shape: CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FlutterLogo(
                    size: 80,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "$name",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(70),
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      child: Text(
                        "MRF",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(40),
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                // color: Colors.red,
                alignment: Alignment.centerRight,
                child: Text(
                  "now",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(45),
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ));
  }
}
