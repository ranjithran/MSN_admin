import 'package:admin/res/Colors.dart';
import 'package:admin/res/widgets/customRB.dart';
import 'package:admin/res/widgets/customTFF.dart';
import 'package:admin/services/sender.dart';
import 'package:admin/userNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class IntradayFrm extends StatefulWidget {
  IntradayFrm({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IntradayFrmState createState() => new _IntradayFrmState();
}

class _IntradayFrmState extends State<IntradayFrm> {
  @override
  void initState() {
    final UserNotifier userNotifier = Provider.of(context, listen: false);
    getUers(userNotifier);
    super.initState();
  }

  final form1Key = GlobalKey<FormState>();

  final bodyCntlr = TextEditingController();
  final titleCntlr = TextEditingController();
  final subTitlecntlr = TextEditingController();
  final companyNamecntlr = TextEditingController();
  final totalBuycntlr = TextEditingController();
  final totalSellcntlr = TextEditingController();
  final stopLossSellcntlr = TextEditingController();

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
                title: "Body",
                subtitle: "Body",
                cntlr: bodyCntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "Title",
                subtitle: "Title",
                cntlr: titleCntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "Sub Title",
                subtitle: "Sub Title",
                cntlr: subTitlecntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "Company Name",
                subtitle: "Company Name",
                cntlr: companyNamecntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "Sub Title",
                subtitle: "Sub Title",
                cntlr: subTitlecntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "Total Sell",
                subtitle: "Total Sell",
                cntlr: totalSellcntlr,
                textInputType: TextInputType.text,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "Stop Loss Sell",
                subtitle: "Stop Loss Sell",
                cntlr: stopLossSellcntlr,
                textInputType: TextInputType.text,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                child: Text(
                  'Users',
                  style: TextStyle(color: Colors.white),
                ),
                height: 20.0,
              ),
              Divider(
                color: Colors.white,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0),
                margin: EdgeInsets.symmetric(vertical: 0),
                color: Color(0xff494D50),
                height: 200,
                child: SingleChildScrollView(
                  child: Consumer<UserNotifier>(
                    builder: (context, model, child) => CheckboxGroup(
                      labels: model.userList,
                      onChange: (bool isChecked, String label, int index) => print(
                          '' /* "isChecked: $isChecked   label: $label  index: $index" */),
                      onSelected: (List<String> checked) =>
                          print("checked: ${checked.toString()}"),
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              // BusyButton(
              //   title: 'intraday',
              //   onPressed: () {
              //     sendmessage(
              //       body: bodyCntlr,
              //       title: titleCntlr,
              //       sttl: subTitlecntlr,
              //       companyName: companyNamecntlr,
              //       totalBuy: totalBuycntlr,
              //       totalSell: totalSellcntlr,
              //       stopLoss: stopLossSellcntlr,
              //     );
              //   },
              // )
              CustomRB(
                txt: 'Intraday',
                onPressed: () {
                  sendmessage(
                    body: bodyCntlr,
                    title: titleCntlr,
                    sttl: subTitlecntlr,
                    companyName: companyNamecntlr,
                    totalBuy: totalBuycntlr,
                    totalSell: totalSellcntlr,
                    stopLoss: stopLossSellcntlr,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
