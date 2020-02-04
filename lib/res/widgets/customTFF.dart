import 'package:flutter/material.dart';

class CustomTFF extends StatefulWidget {
  final String title;
  final String subtitle;
  final void Function(String v) onChanged;
  final TextInputType textInputType;
  final TextEditingController cntlr;
  const CustomTFF(
      {Key key,
      this.title,
      this.subtitle,
      this.onChanged,
      this.textInputType,
      this.cntlr})
      : super(key: key);

  @override
  _CustomTFFState createState() => _CustomTFFState();
}

class _CustomTFFState extends State<CustomTFF> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          SizedBox(height: 7.5),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0xff494D50),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            height: 50.0,
            child: TextFormField(
              onChanged: widget.onChanged,
              controller: widget.cntlr,
              keyboardType: widget.textInputType,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                hintStyle: TextStyle(
                  color: Colors.white54,
                  fontFamily: 'OpenSans',
                ),
                hintText: widget.subtitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
