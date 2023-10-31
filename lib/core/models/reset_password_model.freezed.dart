// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResetPasswordModel _$ResetPasswordModelFromJson(Map<String, dynamic> json) {
  return _ResetPasswordModel.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordModel {
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPasswordModelCopyWith<ResetPasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordModelCopyWith<$Res> {
  factory $ResetPasswordModelCopyWith(
          ResetPasswordModel value, $Res Function(ResetPasswordModel) then) =
      _$ResetPasswordModelCopyWithImpl<$Res, ResetPasswordModel>;
  @useResult
  $Res call({String email, String code, String password});
}

/// @nodoc
class _$ResetPasswordModelCopyWithImpl<$Res, $Val extends ResetPasswordModel>
    implements $ResetPasswordModelCopyWith<$Res> {
  _$ResetPasswordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResetPasswordModelCopyWith<$Res>
    implements $ResetPasswordModelCopyWith<$Res> {
  factory _$$_ResetPasswordModelCopyWith(_$_ResetPasswordModel value,
          $Res Function(_$_ResetPasswordModel) then) =
      __$$_ResetPasswordModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String code, String password});
}

/// @nodoc
class __$$_ResetPasswordModelCopyWithImpl<$Res>
    extends _$ResetPasswordModelCopyWithImpl<$Res, _$_ResetPasswordModel>
    implements _$$_ResetPasswordModelCopyWith<$Res> {
  __$$_ResetPasswordModelCopyWithImpl(
      _$_ResetPasswordModel _value, $Res Function(_$_ResetPasswordModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
    Object? password = null,
  }) {
    return _then(_$_ResetPasswordModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResetPasswordModel
    with DiagnosticableTreeMixin
    implements _ResetPasswordModel {
  _$_ResetPasswordModel({this.email = '', this.code = '', this.password = ''});

  factory _$_ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$$_ResetPasswordModelFromJson(json);

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResetPasswordModel(email: $email, code: $code, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResetPasswordModel'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPasswordModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, code, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResetPasswordModelCopyWith<_$_ResetPasswordModel> get copyWith =>
      __$$_ResetPasswordModelCopyWithImpl<_$_ResetPasswordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResetPasswordModelToJson(
      this,
    );
  }
}

abstract class _ResetPasswordModel implements ResetPasswordModel {
  factory _ResetPasswordModel(
      {final String email,
      final String code,
      final String password}) = _$_ResetPasswordModel;

  factory _ResetPasswordModel.fromJson(Map<String, dynamic> json) =
      _$_ResetPasswordModel.fromJson;

  @override
  String get email;
  @override
  String get code;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordModelCopyWith<_$_ResetPasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}
