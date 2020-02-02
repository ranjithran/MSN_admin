import 'package:admin/DelviryNotification.dart';
import 'package:admin/IntradayNotifidataJSON.dart';
import 'package:http/http.dart';

import 'res/apikeys.dart';
import 'res/appdata.dart';

Future sendmessage(
    ttl, sttl, company, totalBuy, totalSell, stopLossSell) async {
  IntraDayNotifi data = new IntraDayNotifi(
      notification: new Notification(
          body: "MRF",  //TODO:craete a field for this also
          contentAvailable: "true",
          title: ttl),
      data: new Data(
        clickAction: "FLUTTER_NOTIFICATION_CLICK",
        companyName: company,
        totalBuy: totalBuy,
        totalSell: totalSell,
        stopLoss: stopLossSell,
      ),
      to: "Devices Token");

  var headers = {
    "Content-Type": "application/json",
    "Authorization": "key=Firebase_servicesKey"
  };
  var apost;
  apost = await post(url, body: intraDayNotifiToJson(data), headers: headers);
  print(apost);
}

Future deliveryNotification() async {
  DeliveryNotifi delnotifi = new DeliveryNotifi(
    data: new DelData(
      //TODO:create ui for this
      companyName: "MRF",
      clickAction: "FLUTTER_NOTIFICATION_CLICK",
      type: "Delviry",
      cmp: "5899.09",
      recoDate: "25-01-2020",
      recoPrice: "300.00",
      priceTraget: "4800.98",
      tragetTime: "2-3 years",
      upSide: "50.00",
    ),
    to: "fd7qBwuJgCU:APA91bHggzmk6OjZKVe-tFjbG1q6Mb3CkiB6LX3G7pCVhkN7prbsx-9Wdh709Rn8llPOgKX0SU1Fed42hNJ7P0Bn2jyeWHt2TE0aIPDOKiOYEiEAb2NAIhFgjG_thWzun_PufpMoJiBs",
    notification: new DelNotification(
        title: "IntraDay", body: "MRF", contentAvailable: "true"),
  );
  var headers = {
    "Content-Type": "application/json",
    "Authorization": "key=$firebasekey"
  };
  await post(url, body: deliveryNotifiToJson(delnotifi), headers: headers);
}
