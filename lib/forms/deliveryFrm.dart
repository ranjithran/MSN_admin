import 'package:admin/res/Colors.dart';
import 'package:admin/res/widgets/customTFF.dart';
import 'package:admin/userNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class DeliveryFrm extends StatefulWidget {
  DeliveryFrm({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DeliveryFrmState createState() => new _DeliveryFrmState();
}

class _DeliveryFrmState extends State<DeliveryFrm> {
  @override
  void initState() {
    final UserNotifier userNotifier = Provider.of(context, listen: false);
    getUers(userNotifier);
    super.initState();
  }

  static String ttl;
  static String bd;
  static String companyName;
  static String clickAction;
  static String type;
  static String cmp;
  static String recoDate;
  static String recoPrice;
  static String priceTarget;
  static String targetTime;
  static String upSide;

  int currentStep = 0;
  bool complete = false;

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
            title: "Title",
            subtitle: "Title",
            onChanged: (v) {
              ttl = v;
            },
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTFF(
            title: "Body",
            subtitle: "Body",
            onChanged: (v) {
              bd = v;
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
            title: "Company Name",
            subtitle: "Company Name",
          onChanged: (v) {
              companyName = v;
            },
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTFF(
            title: "Click Action",
            subtitle: "Click Action",
          onChanged: (v) {
              clickAction = v;
            },
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTFF(
            title: "Type",
            subtitle: "Type",
          onChanged: (v) {
              type = v;
            },
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 15,
          ),
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
    Step(
      isActive: false,
      title: const Text('users'),
      content: Container(
        color: m1,
        height: 500,
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
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: m0,
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
        backgroundColor: m0,
      ),
      body: complete
          ? Text('d sent')
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
