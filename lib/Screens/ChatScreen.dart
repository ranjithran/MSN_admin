import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key key}) : super(key: key);
  
  final Firestore _firestore = Firestore.instance;
  ScrollController listScrollController = new ScrollController();
  String message;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
  
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          "Chat",
          style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              color: Colors.black,
              fontWeight: FontWeight.w800),
        )),
        actions: <Widget>[
          Container(
            child: Icon(
              Icons.refresh,
              size: 50,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            // overflow: Overflow.visible,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: _firestore
                          .collection("Messages")
                          .document("12345")
                          .collection("messages")
                          .orderBy("timestamp", descending: false)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }

                        return ListView.builder(
                            controller: listScrollController,
                            itemCount: snapshot.data.documents.length,
                            cacheExtent: 2,
                            itemBuilder: (context, index) =>
                                snapshot.data.documents[index].data["id"] == "2"
                                    ? Container(
                                        alignment: Alignment.centerRight,
                                        padding: EdgeInsets.only(
                                            left: ScreenUtil().setWidth(60),
                                            top: ScreenUtil().setHeight(10),
                                            bottom: ScreenUtil().setHeight(10),
                                            right: ScreenUtil().setWidth(10)),
                                        child: MessageBox(
                                          text: snapshot.data.documents[index]
                                              .data["message"],
                                          left: 0,
                                          right: 15,
                                          color: Colors.grey[200],
                                        ))
                                    : Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            left: ScreenUtil().setWidth(10),
                                            top: ScreenUtil().setHeight(10),
                                            bottom: ScreenUtil().setHeight(10),
                                            right: ScreenUtil().setWidth(60)),
                                        child: MessageBox(
                                          text: snapshot.data.documents[index]
                                              .data["message"],
                                          right: 0,
                                          left: 15,
                                          color: Colors.blue[100]
                                              .withGreen(244)
                                              .withRed(214),
                                        )));
                      }),
                ),
              ),
              Expanded(
                flex: 0,
                child: TextField(
                  onChanged: (_) {
                    this.message = _;
                  },
                  decoration: InputDecoration(
                    hintText: "Type a message",
                    prefixIcon: Icon(Icons.trending_down),
                    suffixIcon: Card(
                        elevation: 0,
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                            onPressed: () async {
                              var documentReference = _firestore
                                  .collection('Messages')
                                  .document("12345")
                                  .collection("messages")
                                  .document(DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString());

                              _firestore.runTransaction((transaction) async {
                                await transaction.set(
                                  documentReference,
                                  {
                                    "id": "2",
                                    "message": message,
                                    'timestamp': DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString(),
                                  },
                                );
                              });
                              listScrollController.animateTo(
                                  listScrollController.offset,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeOut);
                            },
                            tooltip: "Send Message",
                            icon: Icon(
                              Icons.send,
                              color: Colors.black,
                            ))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageBox extends StatelessWidget {
  final String text;
  final double left;
  final double right;
  final Color color;
  MessageBox(
      {@required this.text,
      @required this.left,
      this.color,
      @required this.right});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(left),
                    bottomRight: Radius.circular(right),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: color,
              ),
              padding: EdgeInsets.all(20),
              child: Text(
                text,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
