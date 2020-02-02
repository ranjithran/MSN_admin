import 'package:admin/res/Colors.dart';
import 'package:admin/res/widgets/customRB.dart';
import 'package:admin/res/widgets/customTFF.dart';
import 'package:admin/userNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class Frm2 extends StatefulWidget {
  Frm2({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Frm2State createState() => new _Frm2State();
}

class _Frm2State extends State<Frm2> {
  @override
  void initState() {
    final UserNotifier userNotifier = Provider.of(context, listen: false);
    getUers(userNotifier);
    super.initState();
  }
  
  final cnCntlr = TextEditingController();
  final subTitleCntlr = TextEditingController();
  final caCntlr = TextEditingController();
  final tCntlr = TextEditingController();
  final cmpCntlr = TextEditingController();
  final rdCntlr = TextEditingController();
  final rpCntlr = TextEditingController();
  final ptCntlr = TextEditingController();
  final ttCntlr = TextEditingController();
  final usCntlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                title: "Company Name",
                subtitle: "Company Name",
                cntlr: cnCntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "Click Action",
                subtitle: "Click Action",
                cntlr: caCntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "Type",
                subtitle: "Type",
                cntlr: tCntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "CMP",
                subtitle: "CMP",
                cntlr: cmpCntlr,
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "Reco Date",
                subtitle: "Reco Date",
                cntlr: rdCntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "Reco Price",
                subtitle: "Reco Price",
                cntlr: rpCntlr,
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "Price Target",
                subtitle: "Price Target",
                cntlr: ptCntlr,
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "Target Time",
                subtitle: "Target Time",
                cntlr: ttCntlr,
                textInputType: TextInputType.number,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "UpSide",
                subtitle: "UpSide",
                cntlr: usCntlr,
                textInputType: TextInputType.number,
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
              Container(
                color: Color(0xff494D50),
                height: 200,
                child: SingleChildScrollView(
                  child: Consumer<UserNotifier>(
                    builder: (context, model, child) => CheckboxGroup(
                      labels: model.userList,
                      onChange: (bool isChecked, String label, int index) => print(
                          "isChecked: $isChecked   label: $label  index: $index"),
                      onSelected: (List<String> checked) =>
                          print("checked: ${checked.toString()}"),
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              CustomRB(
                txt: 'frm 2',
                onPressed: () {
                  // deliveryNotification();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
