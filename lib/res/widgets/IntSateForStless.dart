import 'package:flutter/widgets.dart';

class StartingState extends StatefulWidget {
  final Widget child;
  final Function initFunction;
  final Function disposeFunction;
  StartingState({Key key, @required this.child, this.initFunction, this.disposeFunction}) : super(key: key);

  @override
  _StartingStateState createState() => _StartingStateState();
}

class _StartingStateState extends State<StartingState> {
  @override
  void initState() {
    widget.initFunction();
    super.initState();
  }
  @override
  void dispose() {
    // widget.disposeFunction();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: widget.child,
    );
  }
}