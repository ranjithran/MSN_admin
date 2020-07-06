import 'package:admin/FormsNotifer.dart';
import 'package:admin/Logic/FirebaseServices.dart';
import 'package:admin/res/Colors.dart';
import 'package:admin/res/Datamodels/FirebaseUserData.dart';
import 'package:admin/res/widgets/customRB.dart';
import 'package:admin/res/widgets/customTFF.dart';
import 'package:admin/userNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'deliveryFrm.dart';

class IntradayFrm extends StatefulWidget {
  IntradayFrm({
    Key key,
  }) : super(key: key);

  @override
  _IntradayFrmState createState() => new _IntradayFrmState();
}

class _IntradayFrmState extends State<IntradayFrm> {
  @override
  void initState() {
    super.initState();
  }

  final FirebaseServices _firebaseServices = FirebaseServices();

  static String investon;
  static String buyAt;
  static String sellAt;
  static String stopLoss;
  static String validity;

  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != _steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
    if (investon != null) {
      Provider.of<FormsNotifer>(context, listen: false).settingTitle(investon);
    }
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
      title: Consumer<UserNotifier>(builder: (context, _, child) {
        return Text('For ${_.userData.name ?? " "}',
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(45),
                fontWeight: FontWeight.w800));
      }),
      content: Column(
        children: <Widget>[
          CustomTFF(
            title: "Invest on ",
            subtitle: "MRF",
            onChanged: (v) {
              investon = v;
            },
            textInputType: TextInputType.text,
          ),
        ],
      ),
    ),
    Step(
      title: Consumer<FormsNotifer>(builder: (context, _, child) {
        return Text('${_.investTilte ?? " "}',
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(45),
                fontWeight: FontWeight.w800));
      }),
      isActive: false,
      content: Column(
        children: <Widget>[
          CustomTFF(
            title: "Buy At",
            subtitle: "100",
            onChanged: (v) {
              buyAt = v;
            },
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTFF(
            title: "Sell At",
            subtitle: "200",
            onChanged: (v) {
              sellAt = v;
            },
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTFF(
            title: "Stop Loss",
            subtitle: "50",
            onChanged: (v) {
              stopLoss = v;
            },
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTFF(
            title: "Validity",
            subtitle: "18-06-2020",
            onChanged: (v) {
              validity = v;
            },
            textInputType: TextInputType.text,
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final details = Provider.of<UserNotifier>(context, listen: false).userData;

    return new Scaffold(
      backgroundColor: m0,
      appBar: new AppBar(
        title: new Text("IntraDay"),
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
                      rightData: investon,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    TableData(
                      leftData: "Buy At",
                      rightData: buyAt,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    TableData(
                      leftData: "Sell At",
                      rightData: sellAt,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    TableData(
                      leftData: "StopLoss",
                      rightData: stopLoss,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    TableData(
                      leftData: "Validity",
                      rightData: validity,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                    ),
                    CustomRB(
                      onPressed: () {
                        AdviceData data = new AdviceData(
                            buyAt: buyAt,
                            investon: investon,
                            sellAt: sellAt,
                            stopLoss: stopLoss,
                            validity: validity);
                        _firebaseServices.settingAdvices(
                            details.uid.hashCode.toString(), data);
                        Navigator.of(context).pop();
                      },
                      buttonTitle: "Submit",
                    )
                  ],
                ),
              ),
            )
          : Stepper(
              // type: StepperType.horizontal,
              steps: _steps,
              currentStep: currentStep,
              onStepContinue: next,
              onStepTapped: (step) => goTo(step),
              onStepCancel: cancel,
            ),
    );
  }
}
