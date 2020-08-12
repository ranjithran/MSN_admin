import 'package:admin/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserNotifier with ChangeNotifier {
  List<UserData> _data = new List();

  List<UserData> get data => _data;

  // Map _userMapData = new Map();
  // Map get userMapData => _userMapData;

  //TODO:1
  UserData _userData = new UserData();

  UserData get userData => _userData;

  gettingUserList() async {
    print("gettinf list  of users");
    QuerySnapshot snapshot =
        await Firestore.instance.collection('user').getDocuments();
    _data.clear();
    snapshot.documents.forEach(
      (documant) {
        Users user = Users.fromMap(documant.data);
        _data.add(
          UserData(
            name: user.usrName.toString(),
            phonenumber: user.phonenumber.toString(),
            statustime: user.createdtime.toDate().toString(),
            uid: user.uid.toString(),
          ),
        );
        // _userMapData[user.uid.toString()] = new UserData(
        //     name: user.usrName,
        //     phonenumber: user.phonenumber,
        //     statustime: user.createdtime.toDate().toUtc().toString(),
        //     uid: user.uid,
        //     email: user.email);
      },
    );
    
    notifyListeners();
  }

  gettingUserDeatils(String uid) async {
    print("getting user details");
    print(uid);
    DocumentSnapshot _doc =
        await Firestore.instance.collection('user').document(uid).get();
    Users user = Users.fromMap(_doc.data);
    _userData = new UserData(
        name: user.usrName,
        phonenumber: user.phonenumber,
        // statustime: user.createdtime.toDate().toUtc().toString(),
        uid: user.uid,
        email: user.email);
    notifyListeners();
  }
}
