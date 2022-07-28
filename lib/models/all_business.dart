// To parse this JSON data, do
//
//     final allBusinessData = allBusinessDataFromJson(jsonString);

import 'dart:convert';

AllBusinessData allBusinessDataFromJson(String str) => AllBusinessData.fromJson(json.decode(str));

String allBusinessDataToJson(AllBusinessData data) => json.encode(data.toJson());

class AllBusinessData {
    AllBusinessData({
        this.status,
        this.message,
        this.data,
    });

    String? status;
    String? message;
    Data? data;

    factory AllBusinessData.fromJson(Map<String, dynamic> json) => AllBusinessData(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.totalDocuments,
        this.totalPages,
        this.currentPage,
        this.nextPage,
        this.prevPage,
        this.data,
    });

    int? totalDocuments;
    int? totalPages;
    int? currentPage;
    dynamic nextPage;
    dynamic prevPage;
    List<Business>? data;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalDocuments: json["totalDocuments"],
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
        nextPage: json["nextPage"],
        prevPage: json["prevPage"],
        data: List<Business>.from(json["data"].map((x) => Business.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalDocuments": totalDocuments,
        "totalPages": totalPages,
        "currentPage": currentPage,
        "nextPage": nextPage,
        "prevPage": prevPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Business {
    Business({
        this.id,
        this.owner,
        this.name,
        this.description,
        this.lga,
        this.state,
        this.city,
        this.nearestLandmark,
        this.dateEstablished,
        this.phoneNumber1,
        this.phoneNumber2,
        this.email1,
        this.email2,
        this.instagram,
        this.twitter,
        this.facebook,
        this.tiktok,
        this.linkedIn,
        this.verified,
        this.paymentOption,
        this.isActive,
        this.v,
        this.currentSubscription,
        this.luxCode,
    });

    String? id;
    String? owner;
    String? name;
    String? description;
    String? lga;
    String? state;
    String? city;
    String? nearestLandmark;
    DateTime? dateEstablished;
    String? phoneNumber1;
    String? phoneNumber2;
    String? email1;
    String? email2;
    String? instagram;
    String? twitter;
    String? facebook;
    String? tiktok;
    String? linkedIn;
    bool? verified;
    String? paymentOption;
    bool? isActive;
    int? v;
    dynamic currentSubscription;
    String? luxCode;

    factory Business.fromJson(Map<String, dynamic> json) => Business(
        id: json["_id"],
        owner: json["owner"],
        name: json["name"],
        description: json["description"],
        lga: json["lga"],
        state: json["state"],
        city: json["city"],
        nearestLandmark: json["nearestLandmark"],
        dateEstablished: DateTime.parse(json["dateEstablished"]),
        phoneNumber1: json["phoneNumber1"],
        phoneNumber2: json["phoneNumber2"],
        email1: json["email1"],
        email2: json["email2"],
        instagram: json["instagram"],
        twitter: json["twitter"],
        facebook: json["facebook"],
        tiktok: json["tiktok"],
        linkedIn: json["linkedIn"],
        verified: json["verified"],
        paymentOption: json["paymentOption"],
        isActive: json["isActive"],
        v: json["__v"],
        currentSubscription: json["currentSubscription"],
        luxCode: json["luxCode"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "owner": owner,
        "name": name,
        "description": description,
        "lga": lga,
        "state": state,
        "city": city,
        "nearestLandmark": nearestLandmark,
        "dateEstablished": "${dateEstablished!.year.toString().padLeft(4, '0')}-${dateEstablished!.month.toString().padLeft(2, '0')}-${dateEstablished!.day.toString().padLeft(2, '0')}",
        "phoneNumber1": phoneNumber1,
        "phoneNumber2": phoneNumber2,
        "email1": email1,
        "email2": email2,
        "instagram": instagram,
        "twitter": twitter,
        "facebook": facebook,
        "tiktok": tiktok,
        "linkedIn": linkedIn,
        "verified": verified,
        "paymentOption": paymentOption,
        "isActive": isActive,
        "__v": v,
        "currentSubscription": currentSubscription,
        "luxCode": luxCode,
    };
}
