import 'dart:collection';
import 'package:admin/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserNotifier with ChangeNotifier {
  List<Users> _userList = [];

  UnmodifiableListView<Users> get userList => UnmodifiableListView(_userList);

  Users get cUser => cUser;

  set userList(List<Users> userList) {
    _userList = userList;
    notifyListeners();
  }
  
}

getUers(UserNotifier userNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance.collection('user').getDocuments();

  List<Users> _userList = [];

  snapshot.documents.forEach((documant) {
    Users user = Users.fromMap(documant.data);
    _userList.add(user);
    
  });
  userNotifier.userList = _userList;
}
