// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusinessReviewModel _$BusinessReviewModelFromJson(Map<String, dynamic> json) {
  return _BusinessReviewModel.fromJson(json);
}

/// @nodoc
mixin _$BusinessReviewModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int get v => throw _privateConstructorUsedError;
  String get business => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;
  String get review => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedA => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessReviewModelCopyWith<BusinessReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessReviewModelCopyWith<$Res> {
  factory $BusinessReviewModelCopyWith(
          BusinessReviewModel value, $Res Function(BusinessReviewModel) then) =
      _$BusinessReviewModelCopyWithImpl<$Res, BusinessReviewModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: '__v') int v,
      String business,
      String rating,
      String user,
      String review,
      String status,
      String createdAt,
      String updatedA});
}

/// @nodoc
class _$BusinessReviewModelCopyWithImpl<$Res, $Val extends BusinessReviewModel>
    implements $BusinessReviewModelCopyWith<$Res> {
  _$BusinessReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? v = null,
    Object? business = null,
    Object? rating = null,
    Object? user = null,
    Object? review = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedA = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
      business: null == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedA: null == updatedA
          ? _value.updatedA
          : updatedA // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BusinessReviewModelCopyWith<$Res>
    implements $BusinessReviewModelCopyWith<$Res> {
  factory _$$_BusinessReviewModelCopyWith(_$_BusinessReviewModel value,
          $Res Function(_$_BusinessReviewModel) then) =
      __$$_BusinessReviewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: '__v') int v,
      String business,
      String rating,
      String user,
      String review,
      String status,
      String createdAt,
      String updatedA});
}

/// @nodoc
class __$$_BusinessReviewModelCopyWithImpl<$Res>
    extends _$BusinessReviewModelCopyWithImpl<$Res, _$_BusinessReviewModel>
    implements _$$_BusinessReviewModelCopyWith<$Res> {
  __$$_BusinessReviewModelCopyWithImpl(_$_BusinessReviewModel _value,
      $Res Function(_$_BusinessReviewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? v = null,
    Object? business = null,
    Object? rating = null,
    Object? user = null,
    Object? review = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedA = null,
  }) {
    return _then(_$_BusinessReviewModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
      business: null == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedA: null == updatedA
          ? _value.updatedA
          : updatedA // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BusinessReviewModel
    with DiagnosticableTreeMixin
    implements _BusinessReviewModel {
  _$_BusinessReviewModel(
      {@JsonKey(name: '_id') this.id = '',
      @JsonKey(name: '__v') this.v = 0,
      this.business = '',
      this.rating = '',
      this.user = '',
      this.review = '',
      this.status = '',
      this.createdAt = '',
      this.updatedA = ''});

  factory _$_BusinessReviewModel.fromJson(Map<String, dynamic> json) =>
      _$$_BusinessReviewModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: '__v')
  final int v;
  @override
  @JsonKey()
  final String business;
  @override
  @JsonKey()
  final String rating;
  @override
  @JsonKey()
  final String user;
  @override
  @JsonKey()
  final String review;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String createdAt;
  @override
  @JsonKey()
  final String updatedA;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BusinessReviewModel(id: $id, v: $v, business: $business, rating: $rating, user: $user, review: $review, status: $status, createdAt: $createdAt, updatedA: $updatedA)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BusinessReviewModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('v', v))
      ..add(DiagnosticsProperty('business', business))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('review', review))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedA', updatedA));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BusinessReviewModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedA, updatedA) ||
                other.updatedA == updatedA));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, v, business, rating, user,
      review, status, createdAt, updatedA);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BusinessReviewModelCopyWith<_$_BusinessReviewModel> get copyWith =>
      __$$_BusinessReviewModelCopyWithImpl<_$_BusinessReviewModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BusinessReviewModelToJson(
      this,
    );
  }
}

abstract class _BusinessReviewModel implements BusinessReviewModel {
  factory _BusinessReviewModel(
      {@JsonKey(name: '_id') final String id,
      @JsonKey(name: '__v') final int v,
      final String business,
      final String rating,
      final String user,
      final String review,
      final String status,
      final String createdAt,
      final String updatedA}) = _$_BusinessReviewModel;

  factory _BusinessReviewModel.fromJson(Map<String, dynamic> json) =
      _$_BusinessReviewModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: '__v')
  int get v;
  @override
  String get business;
  @override
  String get rating;
  @override
  String get user;
  @override
  String get review;
  @override
  String get status;
  @override
  String get createdAt;
  @override
  String get updatedA;
  @override
  @JsonKey(ignore: true)
  _$$_BusinessReviewModelCopyWith<_$_BusinessReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
