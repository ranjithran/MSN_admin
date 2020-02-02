import 'package:admin/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserNotifier with ChangeNotifier {
  List<String> _userList = new List();

  List get userList => _userList;

  Users get cUser => cUser;

  set settingUserList(List<String> userList) {
    _userList = userList;
    print("data form set"+_userList.length.toString());
    notifyListeners();
  }
  
}

getUers(UserNotifier userNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance.collection('user').getDocuments();

  List<String> _insideUserList= new List();

  snapshot.documents.forEach((documant) {
    Users user = Users.fromMap(documant.data);
    _insideUserList.add(user.usrName.toString());
    
  });
  userNotifier.settingUserList=_insideUserList;
}
