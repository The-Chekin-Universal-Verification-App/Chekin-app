// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
    UserProfile({
        this.status,
        this.message,
        this.data,
    });

    String? status;
    String? message;
    UserData? data;

    factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        status: json["status"],
        message: json["message"],
        data: UserData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
    };
}

class UserData {
    UserData({
        this.id,
        this.firstName,
        this.lastName,
        this.middleName,
        this.nationality,
        this.profileImageUrl,
        this.email,
        this.role,
        this.verified,
        this.phoneNumber,
        this.business,
    });

    String? id;
    String? firstName;
    String? lastName;
    String? middleName;
    String? nationality;
    String? profileImageUrl;
    String? email;
    String? role;
    bool? verified;
    String? phoneNumber;
    String? business;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        middleName: json["middleName"],
        nationality: json["nationality"],
        profileImageUrl: json["profileImageUrl"],
        email: json["email"],
        role: json["role"],
        verified: json["verified"],
        phoneNumber: json["phoneNumber"],
        business: json["business"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "nationality": nationality,
        "profileImageUrl": profileImageUrl,
        "email": email,
        "role": role,
        "verified": verified,
        "phoneNumber": phoneNumber,
        "business": business,
    };
}
