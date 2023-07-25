// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_signup_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSignUpModel _$UserSignUpModelFromJson(Map<String, dynamic> json) {
  return _UserSignUpModel.fromJson(json);
}

/// @nodoc
mixin _$UserSignUpModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get middleName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get nationality => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSignUpModelCopyWith<UserSignUpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSignUpModelCopyWith<$Res> {
  factory $UserSignUpModelCopyWith(
          UserSignUpModel value, $Res Function(UserSignUpModel) then) =
      _$UserSignUpModelCopyWithImpl<$Res, UserSignUpModel>;
  @useResult
  $Res call(
      {String email,
      String password,
      String firstName,
      String middleName,
      String lastName,
      String nationality,
      String phoneNumber});
}

/// @nodoc
class _$UserSignUpModelCopyWithImpl<$Res, $Val extends UserSignUpModel>
    implements $UserSignUpModelCopyWith<$Res> {
  _$UserSignUpModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? lastName = null,
    Object? nationality = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserSignUpModelCopyWith<$Res>
    implements $UserSignUpModelCopyWith<$Res> {
  factory _$$_UserSignUpModelCopyWith(
          _$_UserSignUpModel value, $Res Function(_$_UserSignUpModel) then) =
      __$$_UserSignUpModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String firstName,
      String middleName,
      String lastName,
      String nationality,
      String phoneNumber});
}

/// @nodoc
class __$$_UserSignUpModelCopyWithImpl<$Res>
    extends _$UserSignUpModelCopyWithImpl<$Res, _$_UserSignUpModel>
    implements _$$_UserSignUpModelCopyWith<$Res> {
  __$$_UserSignUpModelCopyWithImpl(
      _$_UserSignUpModel _value, $Res Function(_$_UserSignUpModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? firstName = null,
    Object? middleName = null,
    Object? lastName = null,
    Object? nationality = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$_UserSignUpModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: null == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSignUpModel
    with DiagnosticableTreeMixin
    implements _UserSignUpModel {
  _$_UserSignUpModel(
      {this.email = '',
      this.password = '',
      this.firstName = '',
      this.middleName = '',
      this.lastName = '',
      this.nationality = '',
      this.phoneNumber = ''});

  factory _$_UserSignUpModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserSignUpModelFromJson(json);

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String middleName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String nationality;
  @override
  @JsonKey()
  final String phoneNumber;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserSignUpModel(email: $email, password: $password, firstName: $firstName, middleName: $middleName, lastName: $lastName, nationality: $nationality, phoneNumber: $phoneNumber)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserSignUpModel'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('middleName', middleName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('nationality', nationality))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSignUpModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, firstName,
      middleName, lastName, nationality, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSignUpModelCopyWith<_$_UserSignUpModel> get copyWith =>
      __$$_UserSignUpModelCopyWithImpl<_$_UserSignUpModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserSignUpModelToJson(
      this,
    );
  }
}

abstract class _UserSignUpModel implements UserSignUpModel {
  factory _UserSignUpModel(
      {final String email,
      final String password,
      final String firstName,
      final String middleName,
      final String lastName,
      final String nationality,
      final String phoneNumber}) = _$_UserSignUpModel;

  factory _UserSignUpModel.fromJson(Map<String, dynamic> json) =
      _$_UserSignUpModel.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get firstName;
  @override
  String get middleName;
  @override
  String get lastName;
  @override
  String get nationality;
  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_UserSignUpModelCopyWith<_$_UserSignUpModel> get copyWith =>
      throw _privateConstructorUsedError;
}
