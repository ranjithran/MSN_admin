import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String email;
  String uid;
  String usrName;
  String lastMessage;
  String phonenumber;
  Timestamp createdtime;

  
  Users();
  
  Users.fromMap(Map<String, dynamic> data) {
    phonenumber=data['PhoneNumber']??"no Phonenumber";
    email = data['Email']??"no Email";
    uid = data['uid']??"no id";
    usrName = data['User Name']??"no name";
    // createdtime=data['Createdtime']??DateTime.now();
  }
}
class UserData {
  final String name;
  final String iconurl;
  final String phonenumber;
  final String statustime;
  final String uid;
  final String email;

  UserData({this.uid, this.name, this.iconurl, this.phonenumber, this.statustime,this.email });
}
