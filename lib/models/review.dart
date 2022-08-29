class Review {
  String? business;
  int? rating;
  String? user;
  String? review;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Review(
      {this.business,
      this.rating,
      this.user,
      this.review,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        business: json['business'],
        rating: json['rating'],
        user: json['user'],
        review: json['review'],
        status: json['status'],
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt']),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt']));
  }

  Map<String, dynamic> toJson() {
    return {
      "business": business,
      "rating": rating,
      "user": user,
      "review": review,
      "status": status,
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
    };
  }
}
