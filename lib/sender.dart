import 'package:admin/DelviryNotification.dart';
import 'package:admin/IntradayNotifidataJSON.dart';
import 'package:http/http.dart';

import 'res/apikeys.dart';
import 'res/appdata.dart';

Future sendmessage({ttl, sttl, company, totalBuy, totalSell, stopLossSell}) async {
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

Future deliveryNotification({cn, ca, t, c, rd, rp, pt, tt, us}) async {
  DeliveryNotifi delnotifi = new DeliveryNotifi(
    data: new DelData(
      companyName: cn,
      clickAction: ca,
      type: t,
      cmp: c,
      recoDate: rd,
      recoPrice: rp,
      priceTraget: pt,
      tragetTime: tt,
      upSide: us,
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
