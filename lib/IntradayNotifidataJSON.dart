import 'dart:convert';

IntraDayNotifi intraDayNotifiFromJson(String str) => IntraDayNotifi.fromJson(json.decode(str));

String intraDayNotifiToJson(IntraDayNotifi data) => json.encode(data.toJson());

class IntraDayNotifi {
    Data data;
    Notification notification;
    String to;

    IntraDayNotifi({
        this.data,
        this.notification,
        this.to,
    });

    factory IntraDayNotifi.fromJson(Map<String, dynamic> json) => IntraDayNotifi(
        data: Data.fromJson(json["data"]),
        notification: Notification.fromJson(json["notification"]),
        to: json["to"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "notification": notification.toJson(),
        "to": to,
    };
}

class Data {
    String clickAction;
    String companyName;
    String totalBuy;
    String totalSell;
    String stopLoss;
    String type;

    Data({
        this.clickAction,
        this.companyName,
        this.totalBuy,
        this.totalSell,
        this.stopLoss,
        this.type,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        clickAction: json["click_action"],
        companyName: json["CompanyName"],
        totalBuy: json["TotalBuy"],
        totalSell: json["TotalSell"],
        stopLoss: json["StopLoss"],
        type:json["type"],
    );

    Map<String, dynamic> toJson() => {
        "click_action": clickAction,
        "CompanyName": companyName,
        "TotalBuy": totalBuy,
        "TotalSell": totalSell,
        "StopLoss": stopLoss,
        "type":type,
    };
}

class Notification {
    String title;
    String body;
    String contentAvailable;

    Notification({
        this.title,
        this.body,
        this.contentAvailable,
    });

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
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
