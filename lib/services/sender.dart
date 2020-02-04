import 'package:admin/res/apikeys.dart';
import 'package:admin/res/appdata.dart';
import 'package:http/http.dart';
import 'DelviryNotification.dart';
import 'IntradayNotifidataJSON.dart';

Future sendmessage({body, title, sttl, companyName, totalBuy, totalSell, stopLoss}) async {
  IntraDayNotifi data = new IntraDayNotifi(
      notification: new Notification(
        body: body,
        contentAvailable: "true",
        title: title,
      ),
      data: new Data(
        clickAction: "FLUTTER_NOTIFICATION_CLICK",
        companyName: companyName,
        totalBuy: totalBuy,
        totalSell: totalSell,
        stopLoss: stopLoss,
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

Future deliveryNotification({title, body, companyName, clickAction, type, cmp, recoDate, recoPrice, priceTraget, tragetTime, upSide}) async {
  DeliveryNotifi delnotifi = new DeliveryNotifi(
    data: new DelData(
      companyName: companyName,
      clickAction: clickAction,
      type: type,
      cmp: cmp,
      recoDate: recoDate,
      recoPrice: recoPrice,
      priceTraget: priceTraget,
      tragetTime: tragetTime,
      upSide: upSide,
    ),
    to: "fd7qBwuJgCU:APA91bHggzmk6OjZKVe-tFjbG1q6Mb3CkiB6LX3G7pCVhkN7prbsx-9Wdh709Rn8llPOgKX0SU1Fed42hNJ7P0Bn2jyeWHt2TE0aIPDOKiOYEiEAb2NAIhFgjG_thWzun_PufpMoJiBs",
    notification: new DelNotification(
        title: title, body: body, contentAvailable: "true"),
  );
  var headers = {
    "Content-Type": "application/json",
    "Authorization": "key=$firebasekey"
  };
  await post(url, body: deliveryNotifiToJson(delnotifi), headers: headers);
}
