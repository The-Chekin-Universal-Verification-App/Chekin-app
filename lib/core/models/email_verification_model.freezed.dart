// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_verification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmailVerificationModel _$EmailVerificationModelFromJson(
    Map<String, dynamic> json) {
  return _EmailVerificationModel.fromJson(json);
}

/// @nodoc
mixin _$EmailVerificationModel {
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailVerificationModelCopyWith<EmailVerificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationModelCopyWith<$Res> {
  factory $EmailVerificationModelCopyWith(EmailVerificationModel value,
          $Res Function(EmailVerificationModel) then) =
      _$EmailVerificationModelCopyWithImpl<$Res, EmailVerificationModel>;
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class _$EmailVerificationModelCopyWithImpl<$Res,
        $Val extends EmailVerificationModel>
    implements $EmailVerificationModelCopyWith<$Res> {
  _$EmailVerificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmailVerificationModelCopyWith<$Res>
    implements $EmailVerificationModelCopyWith<$Res> {
  factory _$$_EmailVerificationModelCopyWith(_$_EmailVerificationModel value,
          $Res Function(_$_EmailVerificationModel) then) =
      __$$_EmailVerificationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class __$$_EmailVerificationModelCopyWithImpl<$Res>
    extends _$EmailVerificationModelCopyWithImpl<$Res,
        _$_EmailVerificationModel>
    implements _$$_EmailVerificationModelCopyWith<$Res> {
  __$$_EmailVerificationModelCopyWithImpl(_$_EmailVerificationModel _value,
      $Res Function(_$_EmailVerificationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_$_EmailVerificationModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmailVerificationModel
    with DiagnosticableTreeMixin
    implements _EmailVerificationModel {
  _$_EmailVerificationModel({this.email = '', this.code = ''});

  factory _$_EmailVerificationModel.fromJson(Map<String, dynamic> json) =>
      _$$_EmailVerificationModelFromJson(json);

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String code;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EmailVerificationModel(email: $email, code: $code)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EmailVerificationModel'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('code', code));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailVerificationModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailVerificationModelCopyWith<_$_EmailVerificationModel> get copyWith =>
      __$$_EmailVerificationModelCopyWithImpl<_$_EmailVerificationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmailVerificationModelToJson(
      this,
    );
  }
}

abstract class _EmailVerificationModel implements EmailVerificationModel {
  factory _EmailVerificationModel({final String email, final String code}) =
      _$_EmailVerificationModel;

  factory _EmailVerificationModel.fromJson(Map<String, dynamic> json) =
      _$_EmailVerificationModel.fromJson;

  @override
  String get email;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_EmailVerificationModelCopyWith<_$_EmailVerificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
