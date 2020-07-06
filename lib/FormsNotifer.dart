import 'package:flutter/cupertino.dart';

class FormsNotifer extends ChangeNotifier{


String _investTitle="";

String get investTilte=>_investTitle;



settingTitle(String val){

  _investTitle=val;
  notifyListeners();
}









}