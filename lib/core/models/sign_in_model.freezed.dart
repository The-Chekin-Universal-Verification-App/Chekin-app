// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInModel _$SignInModelFromJson(Map<String, dynamic> json) {
  return _SignInModel.fromJson(json);
}

/// @nodoc
mixin _$SignInModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInModelCopyWith<SignInModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInModelCopyWith<$Res> {
  factory $SignInModelCopyWith(
          SignInModel value, $Res Function(SignInModel) then) =
      _$SignInModelCopyWithImpl<$Res, SignInModel>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInModelCopyWithImpl<$Res, $Val extends SignInModel>
    implements $SignInModelCopyWith<$Res> {
  _$SignInModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignInModelCopyWith<$Res>
    implements $SignInModelCopyWith<$Res> {
  factory _$$_SignInModelCopyWith(
          _$_SignInModel value, $Res Function(_$_SignInModel) then) =
      __$$_SignInModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_SignInModelCopyWithImpl<$Res>
    extends _$SignInModelCopyWithImpl<$Res, _$_SignInModel>
    implements _$$_SignInModelCopyWith<$Res> {
  __$$_SignInModelCopyWithImpl(
      _$_SignInModel _value, $Res Function(_$_SignInModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_SignInModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
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
class _$_SignInModel with DiagnosticableTreeMixin implements _SignInModel {
  _$_SignInModel({this.email = '', this.password = ''});

  factory _$_SignInModel.fromJson(Map<String, dynamic> json) =>
      _$$_SignInModelFromJson(json);

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInModel(email: $email, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInModel'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInModelCopyWith<_$_SignInModel> get copyWith =>
      __$$_SignInModelCopyWithImpl<_$_SignInModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignInModelToJson(
      this,
    );
  }
}

abstract class _SignInModel implements SignInModel {
  factory _SignInModel({final String email, final String password}) =
      _$_SignInModel;

  factory _SignInModel.fromJson(Map<String, dynamic> json) =
      _$_SignInModel.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_SignInModelCopyWith<_$_SignInModel> get copyWith =>
      throw _privateConstructorUsedError;
}
