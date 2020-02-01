import 'package:admin/userNotifier.dart';
import 'package:admin/widgets/CustomTFF.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class AdminForm extends StatefulWidget {
  AdminForm({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AdminFormState createState() => new _AdminFormState();
}

Color mBtn = Color(0xff5D97F5);
Color m0 = Color(0xff292F33);
Color m1 = Color(0xff494D50);

class _AdminFormState extends State<AdminForm> {
  // static UserNotifier get userNotifier => null;

  @override
  void initState() {
    UserNotifier userNotifier = Provider.of(context, listen: false);
    getUers(userNotifier);
    super.initState();
  }
  final formKey = GlobalKey<FormState>();
  // List _selecteCategorys = List();
  
  // Widget _submitBtn() {
  //   return Container(
  //     padding: EdgeInsets.fromLTRB(30, 25, 30, 25),
  //     width: double.infinity,
  //     child: RaisedButton(
  //       elevation: 5.0,
  //       onPressed: () {
  //         //   sendmessage(
  //         //       titleCntlr.text,
  //         //       subTitlecntlr.text,
  //         //       companyNamecntlr.text,
  //         //       totalBuycntlr.text,
  //         //       totalSellcntlr.text,
  //         //       stopLossSellcntlr.text);
  //       },
  //       padding: EdgeInsets.all(15.0),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(30.0),
  //       ),
  //       color: mBtn,
  //       child: Text(
  //         'SUBMIT',
  //         style: TextStyle(
  //           color: Colors.white,
  //           letterSpacing: 1.5,
  //           fontSize: 18.0,
  //           fontWeight: FontWeight.bold,
  //           fontFamily: 'OpenSans',
  //         ),
  //       ),
  //     ),
  //   );
  // }

  final titleCntlr = TextEditingController();
  final subTitlecntlr = TextEditingController();
  final companyNamecntlr = TextEditingController();
  final totalBuycntlr = TextEditingController();
  final totalSellcntlr = TextEditingController();
  final stopLossSellcntlr = TextEditingController();

  // void _onCategorySelected(bool selected, _id) {
  //   if (selected == true) {
  //     setState(
  //       () {
  //         _selecteCategorys.add(_id);
  //       },
  //     );
  //   } else {
  //     setState(
  //       () {
  //         _selecteCategorys.remove(_id);
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // UserNotifier userNtfr = Provider.of<UserNotifier>(context);
    return new Scaffold(
      backgroundColor: m0,
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
        backgroundColor: m0,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              CustomTFF(
                subtitle: "Title",
                title: "Title",
                cntlr: titleCntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                subtitle: "Sub Title",
                title: "Sub Title",
                cntlr: subTitlecntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                subtitle: "Company Name",
                title: "Company Name",
                cntlr: companyNamecntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                subtitle: "Company Name",
                title: "Company Name",
                cntlr: companyNamecntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                subtitle: "Company Name",
                title: "Company Name",
                cntlr: companyNamecntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                subtitle: "Company Name",
                title: "Company Name",
                cntlr: companyNamecntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                child: Text(
                  'sec2',
                  style: TextStyle(color: Colors.white),
                ),
                height: 20.0,
              ),
              Divider(
                color: Colors.white,
              ),
              // ListView.builder(
              //     // physics: NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     itemCount: userNtfr.userList.length,
              //     itemBuilder: (context, index) {
              //       return Theme(
              //         data: Theme.of(context).copyWith(
              //           unselectedWidgetColor: Colors.white,
              //         ),
              //         child: CheckboxListTile(
              //           checkColor: Colors.white,
              //           title: Text(
              //             usrs._usrs.keys.toList()[index],
              //             // userNtfr.userList[index].usrName != null ? userNtfr.userList[index].usrName : 'no username',
              //             style: TextStyle(color: Colors.white),
              //           ),
              //           value: usrs._usrs[usrs._usrs.keys.toList()[index]],

              //           onChanged: (bool selected) {
              //             setState(
              //               () {
              //                 // iss = selected;
              //                 usrs._usrs[usrs._usrs.keys.toList()[index]] =
              //                     selected;
              //               },
              //             );
              //             _onCategorySelected(
              //                 selected, usrs._usrs.keys.toList()[index]);
              //             print(_selecteCategorys);
              //             // print(usrs.result);
              //           },
              //         ),
              //       );
              //     },
              //   ),
              Container(
                color: Color(0xff494D50),
                height: 200,
                child: CheckboxGroup(
                  labels: [],
                  onChange: (bool isChecked, String label, int index) => print("isChecked: $isChecked   label: $label  index: $index"),
                  onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                )
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                subtitle: "Company Name",
                title: "Company Name",
                cntlr: companyNamecntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                subtitle: "Company Name",
                title: "Company Name",
                cntlr: companyNamecntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                subtitle: "Company Name",
                title: "Company Name",
                cntlr: companyNamecntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
