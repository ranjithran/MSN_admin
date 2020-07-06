import 'package:admin/res/Datamodels/FirebaseUserData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final Firestore _firestore = Firestore.instance;

  Future<void> settingAdvices(String uiHashCode, AdviceData data) async {
    var documentReference =
        _firestore.collection('Advices').document("$uiHashCode");

    _firestore.runTransaction((transaction) async {
      await transaction.set(
        documentReference,
        {
          "InvestOn": data.investon,
          "BuyAt": data.buyAt,
          "SellAt": data.sellAt,
          "StopLoss": data.stopLoss,
          "Validity": data.validity
        },
      );
    });
    print("document updated");
  }
}
