import 'dart:convert';

DeliveryNotifi deliveryNotifiFromJson(String str) => DeliveryNotifi.fromJson(json.decode(str));

String deliveryNotifiToJson(DeliveryNotifi data) => json.encode(data.toJson());

class DeliveryNotifi {
    DelData data;
    DelNotification notification;
    String to;

    DeliveryNotifi({
        this.data,
        this.notification,
        this.to,
    });

    factory DeliveryNotifi.fromJson(Map<String, dynamic> json) => DeliveryNotifi(
        data: DelData.fromJson(json["data"]),
        notification: DelNotification.fromJson(json["notification"]),
        to: json["to"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "notification": notification.toJson(),
        "to": to,
    };
}

class DelData {
    String clickAction;
    String type;
    String companyName;
    String cmp;
    String recoDate;
    String recoPrice;
    String priceTraget;
    String tragetTime;
    String upSide;

    DelData({
        this.clickAction,
        this.type,
        this.companyName,
        this.cmp,
        this.recoDate,
        this.recoPrice,
        this.priceTraget,
        this.tragetTime,
        this.upSide,
    });

    factory DelData.fromJson(Map<String, dynamic> json) => DelData(
        clickAction: json["click_action"],
        type: json["type"],
        companyName: json["CompanyName"],
        cmp: json["CMP"],
        recoDate: json["RecoDate"],
        recoPrice: json["RecoPrice"],
        priceTraget: json["PriceTraget"],
        tragetTime: json["TragetTime"],
        upSide: json["UpSide"],
    );

    Map<String, dynamic> toJson() => {
        "click_action": clickAction,
        "type": type,
        "CompanyName": companyName,
        "CMP": cmp,
        "RecoDate": recoDate,
        "RecoPrice": recoPrice,
        "PriceTraget": priceTraget,
        "TragetTime": tragetTime,
        "UpSide": upSide,
    };
}

class DelNotification {
    String title;
    String body;
    String contentAvailable;

    DelNotification({
        this.title,
        this.body,
        this.contentAvailable,
    });

    factory DelNotification.fromJson(Map<String, dynamic> json) => DelNotification(
        title: json["title"],
        body: json["body"],
        contentAvailable: json["content_available"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "content_available": contentAvailable,
    };
}
