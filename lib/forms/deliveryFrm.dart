import 'package:admin/res/Colors.dart';
import 'package:admin/res/widgets/customRB.dart';
import 'package:admin/res/widgets/customTFF.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryFrm extends StatefulWidget {
  DeliveryFrm({
    Key key,
  }) : super(key: key);

  @override
  _DeliveryFrmState createState() => new _DeliveryFrmState();
}

class _DeliveryFrmState extends State<DeliveryFrm> {
  @override
  void initState() {
    super.initState();
  }

  static String ttl;
  static String cmp;
  static String recoDate;
  static String recoPrice;
  static String priceTarget;
  static String targetTime;
  static String upSide;

  int currentStep = 0;
  bool complete = false;
//TODO:need to implment
  next() {
    currentStep + 1 != _steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  List<Step> _steps = [
    Step(
      isActive: true,
      title: const Text('sec1'),
      content: Column(
        children: <Widget>[
          CustomTFF(
            title: "Invest On",
            subtitle: "MRF",
            onChanged: (v) {
              ttl = v;
            },
            textInputType: TextInputType.text,
          ),
        ],
      ),
    ),
    Step(
      title: const Text('New Account'),
      isActive: false,
      content: Column(
        children: <Widget>[
          CustomTFF(
            title: "CMP",
            subtitle: "CMP",
            onChanged: (v) {
              cmp = v;
            },
            textInputType: TextInputType.number,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTFF(
            title: "Reco Date",
            subtitle: "Reco Date",
            onChanged: (v) {
              recoDate = v;
            },
            textInputType: TextInputType.number,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTFF(
            title: "Reco Price",
            subtitle: "Reco Price",
            onChanged: (v) {
              recoPrice = v;
            },
            textInputType: TextInputType.number,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTFF(
            title: "Price Target",
            subtitle: "Price Target",
            onChanged: (v) {
              priceTarget = v;
            },
            textInputType: TextInputType.number,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTFF(
            title: "Target Time",
            subtitle: "Target Time",
            onChanged: (v) {
              targetTime = v;
            },
            textInputType: TextInputType.number,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTFF(
            title: "UpSide",
            subtitle: "UpSide",
            onChanged: (v) {
              upSide = v;
            },
            textInputType: TextInputType.number,
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return new Scaffold(
      backgroundColor: m0,
      appBar: new AppBar(
        title: new Text("Delivery"),
        centerTitle: true,
        backgroundColor: m0,
      ),
      body: complete
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Card(
                color: m1,
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TableData(
                      leftData: "Invest on",
                      rightData: ttl,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    TableData(
                      leftData: "CMP",
                      rightData: cmp,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    TableData(
                      leftData: "RECO Date",
                      rightData: recoDate,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    TableData(
                      leftData: "RECO Price",
                      rightData: recoPrice,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    TableData(
                      leftData: "Price Traget",
                      rightData: priceTarget,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    TableData(
                      leftData: "Target Time",
                      rightData: targetTime,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    TableData(
                      leftData: "Upside",
                      rightData: upSide,
                    ),
                    CustomRB(onPressed: (){},buttonTitle: "Submit",)

                  ],
                ),
              ),
            )
          : Stepper(
              steps: _steps,
              currentStep: currentStep,
              onStepContinue: next,
              onStepTapped: (step) => goTo(step),
              onStepCancel: cancel,
            ),
    );
  }
}

class TableData extends StatelessWidget {
  const TableData({
    Key key,
    @required this.leftData,
    @required this.rightData,
  }) : super(key: key);

  final String leftData;
  final String rightData;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "${leftData ?? " "}",
            
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(50),
            ),
          ),
          Text(
            " ${rightData ?? ""}",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: ScreenUtil().setSp(50),
            ),
          ),
        ],
      ),
    );
  }
}
