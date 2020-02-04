import 'package:admin/res/Colors.dart';
import 'package:admin/res/widgets/customTFF.dart';
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

  static String a;
  static String b;
  static String c;
  static String d;
  static String e;
  static String f;
  static String g;

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
              a = v;
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
              b = v;
              print(a);
            },
            textInputType: TextInputType.text,
          ),
        ],
      ),
    ),
    Step(
      title: const Text('sec 2'),
      isActive: false,
      content: Column(
        children: <Widget>[
          CustomTFF(
            title: "Sub Title",
            subtitle: "Sub Title",
            onChanged: (v) {
              c = v;
            },
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTFF(
            title: "Company Name",
            subtitle: "Company Name",
            onChanged: (v) {
              d = v;
            },
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTFF(
            title: "Total Sell",
            subtitle: "Total Sell",
            onChanged: (v) {
              f = v;
            },
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 15,
          ),
          CustomTFF(
            title: "Stop Loss Sell",
            subtitle: "Stop Loss Sell",
            onChanged: (v) {
              g = v;
            },
            textInputType: TextInputType.text,
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
          ? Text('i sent')
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
