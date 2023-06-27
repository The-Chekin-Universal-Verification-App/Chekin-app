// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get phone_number => throw _privateConstructorUsedError;
  String get referral_code => throw _privateConstructorUsedError;
  String get email_verified_at => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get updated_at => throw _privateConstructorUsedError;
  String? get accountId => throw _privateConstructorUsedError;
  String get referral_link => throw _privateConstructorUsedError;
  String get account_id => throw _privateConstructorUsedError;
  String get wallet_balance => throw _privateConstructorUsedError;
  int? get referral_count => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get bank_accounts =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get meta => throw _privateConstructorUsedError;
  Map<String, dynamic> get wallet => throw _privateConstructorUsedError;
  Map<String, dynamic> get referral => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String name,
      String email,
      String image,
      String phone_number,
      String referral_code,
      String email_verified_at,
      String created_at,
      String updated_at,
      String? accountId,
      String referral_link,
      String account_id,
      String wallet_balance,
      int? referral_count,
      int id,
      List<Map<String, dynamic>> bank_accounts,
      Map<String, dynamic>? meta,
      Map<String, dynamic> wallet,
      Map<String, dynamic> referral});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? image = null,
    Object? phone_number = null,
    Object? referral_code = null,
    Object? email_verified_at = null,
    Object? created_at = null,
    Object? updated_at = null,
    Object? accountId = freezed,
    Object? referral_link = null,
    Object? account_id = null,
    Object? wallet_balance = null,
    Object? referral_count = freezed,
    Object? id = null,
    Object? bank_accounts = null,
    Object? meta = freezed,
    Object? wallet = null,
    Object? referral = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      phone_number: null == phone_number
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String,
      referral_code: null == referral_code
          ? _value.referral_code
          : referral_code // ignore: cast_nullable_to_non_nullable
              as String,
      email_verified_at: null == email_verified_at
          ? _value.email_verified_at
          : email_verified_at // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      referral_link: null == referral_link
          ? _value.referral_link
          : referral_link // ignore: cast_nullable_to_non_nullable
              as String,
      account_id: null == account_id
          ? _value.account_id
          : account_id // ignore: cast_nullable_to_non_nullable
              as String,
      wallet_balance: null == wallet_balance
          ? _value.wallet_balance
          : wallet_balance // ignore: cast_nullable_to_non_nullable
              as String,
      referral_count: freezed == referral_count
          ? _value.referral_count
          : referral_count // ignore: cast_nullable_to_non_nullable
              as int?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bank_accounts: null == bank_accounts
          ? _value.bank_accounts
          : bank_accounts // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      wallet: null == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      referral: null == referral
          ? _value.referral
          : referral // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String image,
      String phone_number,
      String referral_code,
      String email_verified_at,
      String created_at,
      String updated_at,
      String? accountId,
      String referral_link,
      String account_id,
      String wallet_balance,
      int? referral_count,
      int id,
      List<Map<String, dynamic>> bank_accounts,
      Map<String, dynamic>? meta,
      Map<String, dynamic> wallet,
      Map<String, dynamic> referral});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? image = null,
    Object? phone_number = null,
    Object? referral_code = null,
    Object? email_verified_at = null,
    Object? created_at = null,
    Object? updated_at = null,
    Object? accountId = freezed,
    Object? referral_link = null,
    Object? account_id = null,
    Object? wallet_balance = null,
    Object? referral_count = freezed,
    Object? id = null,
    Object? bank_accounts = null,
    Object? meta = freezed,
    Object? wallet = null,
    Object? referral = null,
  }) {
    return _then(_$_UserModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      phone_number: null == phone_number
          ? _value.phone_number
          : phone_number // ignore: cast_nullable_to_non_nullable
              as String,
      referral_code: null == referral_code
          ? _value.referral_code
          : referral_code // ignore: cast_nullable_to_non_nullable
              as String,
      email_verified_at: null == email_verified_at
          ? _value.email_verified_at
          : email_verified_at // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: null == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      referral_link: null == referral_link
          ? _value.referral_link
          : referral_link // ignore: cast_nullable_to_non_nullable
              as String,
      account_id: null == account_id
          ? _value.account_id
          : account_id // ignore: cast_nullable_to_non_nullable
              as String,
      wallet_balance: null == wallet_balance
          ? _value.wallet_balance
          : wallet_balance // ignore: cast_nullable_to_non_nullable
              as String,
      referral_count: freezed == referral_count
          ? _value.referral_count
          : referral_count // ignore: cast_nullable_to_non_nullable
              as int?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bank_accounts: null == bank_accounts
          ? _value._bank_accounts
          : bank_accounts // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      meta: freezed == meta
          ? _value._meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      wallet: null == wallet
          ? _value._wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      referral: null == referral
          ? _value._referral
          : referral // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel with DiagnosticableTreeMixin implements _UserModel {
  _$_UserModel(
      {this.name = '',
      this.email = '',
      this.image = '',
      this.phone_number = '',
      this.referral_code = '',
      this.email_verified_at = '',
      this.created_at = '',
      this.updated_at = '',
      this.accountId = '',
      this.referral_link = '',
      this.account_id = '',
      this.wallet_balance = '',
      this.referral_count = 0,
      this.id = 0,
      final List<Map<String, dynamic>> bank_accounts = const [],
      final Map<String, dynamic>? meta = const {},
      final Map<String, dynamic> wallet = const {},
      final Map<String, dynamic> referral = const {}})
      : _bank_accounts = bank_accounts,
        _meta = meta,
        _wallet = wallet,
        _referral = referral;

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String image;
  @override
  @JsonKey()
  final String phone_number;
  @override
  @JsonKey()
  final String referral_code;
  @override
  @JsonKey()
  final String email_verified_at;
  @override
  @JsonKey()
  final String created_at;
  @override
  @JsonKey()
  final String updated_at;
  @override
  @JsonKey()
  final String? accountId;
  @override
  @JsonKey()
  final String referral_link;
  @override
  @JsonKey()
  final String account_id;
  @override
  @JsonKey()
  final String wallet_balance;
  @override
  @JsonKey()
  final int? referral_count;
  @override
  @JsonKey()
  final int id;
  final List<Map<String, dynamic>> _bank_accounts;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get bank_accounts {
    if (_bank_accounts is EqualUnmodifiableListView) return _bank_accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bank_accounts);
  }

  final Map<String, dynamic>? _meta;
  @override
  @JsonKey()
  Map<String, dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic> _wallet;
  @override
  @JsonKey()
  Map<String, dynamic> get wallet {
    if (_wallet is EqualUnmodifiableMapView) return _wallet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_wallet);
  }

  final Map<String, dynamic> _referral;
  @override
  @JsonKey()
  Map<String, dynamic> get referral {
    if (_referral is EqualUnmodifiableMapView) return _referral;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_referral);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(name: $name, email: $email, image: $image, phone_number: $phone_number, referral_code: $referral_code, email_verified_at: $email_verified_at, created_at: $created_at, updated_at: $updated_at, accountId: $accountId, referral_link: $referral_link, account_id: $account_id, wallet_balance: $wallet_balance, referral_count: $referral_count, id: $id, bank_accounts: $bank_accounts, meta: $meta, wallet: $wallet, referral: $referral)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('phone_number', phone_number))
      ..add(DiagnosticsProperty('referral_code', referral_code))
      ..add(DiagnosticsProperty('email_verified_at', email_verified_at))
      ..add(DiagnosticsProperty('created_at', created_at))
      ..add(DiagnosticsProperty('updated_at', updated_at))
      ..add(DiagnosticsProperty('accountId', accountId))
      ..add(DiagnosticsProperty('referral_link', referral_link))
      ..add(DiagnosticsProperty('account_id', account_id))
      ..add(DiagnosticsProperty('wallet_balance', wallet_balance))
      ..add(DiagnosticsProperty('referral_count', referral_count))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('bank_accounts', bank_accounts))
      ..add(DiagnosticsProperty('meta', meta))
      ..add(DiagnosticsProperty('wallet', wallet))
      ..add(DiagnosticsProperty('referral', referral));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.phone_number, phone_number) ||
                other.phone_number == phone_number) &&
            (identical(other.referral_code, referral_code) ||
                other.referral_code == referral_code) &&
            (identical(other.email_verified_at, email_verified_at) ||
                other.email_verified_at == email_verified_at) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.referral_link, referral_link) ||
                other.referral_link == referral_link) &&
            (identical(other.account_id, account_id) ||
                other.account_id == account_id) &&
            (identical(other.wallet_balance, wallet_balance) ||
                other.wallet_balance == wallet_balance) &&
            (identical(other.referral_count, referral_count) ||
                other.referral_count == referral_count) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._bank_accounts, _bank_accounts) &&
            const DeepCollectionEquality().equals(other._meta, _meta) &&
            const DeepCollectionEquality().equals(other._wallet, _wallet) &&
            const DeepCollectionEquality().equals(other._referral, _referral));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      email,
      image,
      phone_number,
      referral_code,
      email_verified_at,
      created_at,
      updated_at,
      accountId,
      referral_link,
      account_id,
      wallet_balance,
      referral_count,
      id,
      const DeepCollectionEquality().hash(_bank_accounts),
      const DeepCollectionEquality().hash(_meta),
      const DeepCollectionEquality().hash(_wallet),
      const DeepCollectionEquality().hash(_referral));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {final String name,
      final String email,
      final String image,
      final String phone_number,
      final String referral_code,
      final String email_verified_at,
      final String created_at,
      final String updated_at,
      final String? accountId,
      final String referral_link,
      final String account_id,
      final String wallet_balance,
      final int? referral_count,
      final int id,
      final List<Map<String, dynamic>> bank_accounts,
      final Map<String, dynamic>? meta,
      final Map<String, dynamic> wallet,
      final Map<String, dynamic> referral}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get image;
  @override
  String get phone_number;
  @override
  String get referral_code;
  @override
  String get email_verified_at;
  @override
  String get created_at;
  @override
  String get updated_at;
  @override
  String? get accountId;
  @override
  String get referral_link;
  @override
  String get account_id;
  @override
  String get wallet_balance;
  @override
  int? get referral_count;
  @override
  int get id;
  @override
  List<Map<String, dynamic>> get bank_accounts;
  @override
  Map<String, dynamic>? get meta;
  @override
  Map<String, dynamic> get wallet;
  @override
  Map<String, dynamic> get referral;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) {
  return _WalletModel.fromJson(json);
}

/// @nodoc
mixin _$WalletModel {
  String get balance => throw _privateConstructorUsedError;
  String get debits => throw _privateConstructorUsedError;
  String get credits => throw _privateConstructorUsedError;
  String get referral_earnings => throw _privateConstructorUsedError;
  String get fund_from_admin => throw _privateConstructorUsedError;
  String get transaction_count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletModelCopyWith<WalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletModelCopyWith<$Res> {
  factory $WalletModelCopyWith(
          WalletModel value, $Res Function(WalletModel) then) =
      _$WalletModelCopyWithImpl<$Res, WalletModel>;
  @useResult
  $Res call(
      {String balance,
      String debits,
      String credits,
      String referral_earnings,
      String fund_from_admin,
      String transaction_count});
}

/// @nodoc
class _$WalletModelCopyWithImpl<$Res, $Val extends WalletModel>
    implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? debits = null,
    Object? credits = null,
    Object? referral_earnings = null,
    Object? fund_from_admin = null,
    Object? transaction_count = null,
  }) {
    return _then(_value.copyWith(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      debits: null == debits
          ? _value.debits
          : debits // ignore: cast_nullable_to_non_nullable
              as String,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as String,
      referral_earnings: null == referral_earnings
          ? _value.referral_earnings
          : referral_earnings // ignore: cast_nullable_to_non_nullable
              as String,
      fund_from_admin: null == fund_from_admin
          ? _value.fund_from_admin
          : fund_from_admin // ignore: cast_nullable_to_non_nullable
              as String,
      transaction_count: null == transaction_count
          ? _value.transaction_count
          : transaction_count // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletModelCopyWith<$Res>
    implements $WalletModelCopyWith<$Res> {
  factory _$$_WalletModelCopyWith(
          _$_WalletModel value, $Res Function(_$_WalletModel) then) =
      __$$_WalletModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String balance,
      String debits,
      String credits,
      String referral_earnings,
      String fund_from_admin,
      String transaction_count});
}

/// @nodoc
class __$$_WalletModelCopyWithImpl<$Res>
    extends _$WalletModelCopyWithImpl<$Res, _$_WalletModel>
    implements _$$_WalletModelCopyWith<$Res> {
  __$$_WalletModelCopyWithImpl(
      _$_WalletModel _value, $Res Function(_$_WalletModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
    Object? debits = null,
    Object? credits = null,
    Object? referral_earnings = null,
    Object? fund_from_admin = null,
    Object? transaction_count = null,
  }) {
    return _then(_$_WalletModel(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
      debits: null == debits
          ? _value.debits
          : debits // ignore: cast_nullable_to_non_nullable
              as String,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as String,
      referral_earnings: null == referral_earnings
          ? _value.referral_earnings
          : referral_earnings // ignore: cast_nullable_to_non_nullable
              as String,
      fund_from_admin: null == fund_from_admin
          ? _value.fund_from_admin
          : fund_from_admin // ignore: cast_nullable_to_non_nullable
              as String,
      transaction_count: null == transaction_count
          ? _value.transaction_count
          : transaction_count // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WalletModel with DiagnosticableTreeMixin implements _WalletModel {
  _$_WalletModel(
      {this.balance = '',
      this.debits = '',
      this.credits = '',
      this.referral_earnings = '',
      this.fund_from_admin = '',
      this.transaction_count = ''});

  factory _$_WalletModel.fromJson(Map<String, dynamic> json) =>
      _$$_WalletModelFromJson(json);

  @override
  @JsonKey()
  final String balance;
  @override
  @JsonKey()
  final String debits;
  @override
  @JsonKey()
  final String credits;
  @override
  @JsonKey()
  final String referral_earnings;
  @override
  @JsonKey()
  final String fund_from_admin;
  @override
  @JsonKey()
  final String transaction_count;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletModel(balance: $balance, debits: $debits, credits: $credits, referral_earnings: $referral_earnings, fund_from_admin: $fund_from_admin, transaction_count: $transaction_count)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletModel'))
      ..add(DiagnosticsProperty('balance', balance))
      ..add(DiagnosticsProperty('debits', debits))
      ..add(DiagnosticsProperty('credits', credits))
      ..add(DiagnosticsProperty('referral_earnings', referral_earnings))
      ..add(DiagnosticsProperty('fund_from_admin', fund_from_admin))
      ..add(DiagnosticsProperty('transaction_count', transaction_count));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletModel &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.debits, debits) || other.debits == debits) &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.referral_earnings, referral_earnings) ||
                other.referral_earnings == referral_earnings) &&
            (identical(other.fund_from_admin, fund_from_admin) ||
                other.fund_from_admin == fund_from_admin) &&
            (identical(other.transaction_count, transaction_count) ||
                other.transaction_count == transaction_count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, balance, debits, credits,
      referral_earnings, fund_from_admin, transaction_count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletModelCopyWith<_$_WalletModel> get copyWith =>
      __$$_WalletModelCopyWithImpl<_$_WalletModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletModelToJson(
      this,
    );
  }
}

abstract class _WalletModel implements WalletModel {
  factory _WalletModel(
      {final String balance,
      final String debits,
      final String credits,
      final String referral_earnings,
      final String fund_from_admin,
      final String transaction_count}) = _$_WalletModel;

  factory _WalletModel.fromJson(Map<String, dynamic> json) =
      _$_WalletModel.fromJson;

  @override
  String get balance;
  @override
  String get debits;
  @override
  String get credits;
  @override
  String get referral_earnings;
  @override
  String get fund_from_admin;
  @override
  String get transaction_count;
  @override
  @JsonKey(ignore: true)
  _$$_WalletModelCopyWith<_$_WalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}
