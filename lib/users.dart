class Users {
  String email;
  String uid;
  String usrName;
  
  Users();
  
  Users.fromMap(Map<String, dynamic> data) {
    email = data['Email'];
    uid = data['uid'];
    usrName = data['User Name'];
  }
}
