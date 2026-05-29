// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignupFormState {

 String get name; String get email; String get password; String get confirmPassword; bool get isPasswordVisible; bool get isConfirmPasswordVisible; bool get isLoading; bool get agreeToTerms; String? get error;
/// Create a copy of SignupFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignupFormStateCopyWith<SignupFormState> get copyWith => _$SignupFormStateCopyWithImpl<SignupFormState>(this as SignupFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignupFormState&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.isConfirmPasswordVisible, isConfirmPasswordVisible) || other.isConfirmPasswordVisible == isConfirmPasswordVisible)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.agreeToTerms, agreeToTerms) || other.agreeToTerms == agreeToTerms)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,password,confirmPassword,isPasswordVisible,isConfirmPasswordVisible,isLoading,agreeToTerms,error);

@override
String toString() {
  return 'SignupFormState(name: $name, email: $email, password: $password, confirmPassword: $confirmPassword, isPasswordVisible: $isPasswordVisible, isConfirmPasswordVisible: $isConfirmPasswordVisible, isLoading: $isLoading, agreeToTerms: $agreeToTerms, error: $error)';
}


}

/// @nodoc
abstract mixin class $SignupFormStateCopyWith<$Res>  {
  factory $SignupFormStateCopyWith(SignupFormState value, $Res Function(SignupFormState) _then) = _$SignupFormStateCopyWithImpl;
@useResult
$Res call({
 String name, String email, String password, String confirmPassword, bool isPasswordVisible, bool isConfirmPasswordVisible, bool isLoading, bool agreeToTerms, String? error
});




}
/// @nodoc
class _$SignupFormStateCopyWithImpl<$Res>
    implements $SignupFormStateCopyWith<$Res> {
  _$SignupFormStateCopyWithImpl(this._self, this._then);

  final SignupFormState _self;
  final $Res Function(SignupFormState) _then;

/// Create a copy of SignupFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? isPasswordVisible = null,Object? isConfirmPasswordVisible = null,Object? isLoading = null,Object? agreeToTerms = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isConfirmPasswordVisible: null == isConfirmPasswordVisible ? _self.isConfirmPasswordVisible : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,agreeToTerms: null == agreeToTerms ? _self.agreeToTerms : agreeToTerms // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignupFormState].
extension SignupFormStatePatterns on SignupFormState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignupFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignupFormState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignupFormState value)  $default,){
final _that = this;
switch (_that) {
case _SignupFormState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignupFormState value)?  $default,){
final _that = this;
switch (_that) {
case _SignupFormState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String password,  String confirmPassword,  bool isPasswordVisible,  bool isConfirmPasswordVisible,  bool isLoading,  bool agreeToTerms,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignupFormState() when $default != null:
return $default(_that.name,_that.email,_that.password,_that.confirmPassword,_that.isPasswordVisible,_that.isConfirmPasswordVisible,_that.isLoading,_that.agreeToTerms,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String password,  String confirmPassword,  bool isPasswordVisible,  bool isConfirmPasswordVisible,  bool isLoading,  bool agreeToTerms,  String? error)  $default,) {final _that = this;
switch (_that) {
case _SignupFormState():
return $default(_that.name,_that.email,_that.password,_that.confirmPassword,_that.isPasswordVisible,_that.isConfirmPasswordVisible,_that.isLoading,_that.agreeToTerms,_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String password,  String confirmPassword,  bool isPasswordVisible,  bool isConfirmPasswordVisible,  bool isLoading,  bool agreeToTerms,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _SignupFormState() when $default != null:
return $default(_that.name,_that.email,_that.password,_that.confirmPassword,_that.isPasswordVisible,_that.isConfirmPasswordVisible,_that.isLoading,_that.agreeToTerms,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SignupFormState implements SignupFormState {
  const _SignupFormState({this.name = '', this.email = '', this.password = '', this.confirmPassword = '', this.isPasswordVisible = false, this.isConfirmPasswordVisible = false, this.isLoading = false, this.agreeToTerms = false, this.error});
  

@override@JsonKey() final  String name;
@override@JsonKey() final  String email;
@override@JsonKey() final  String password;
@override@JsonKey() final  String confirmPassword;
@override@JsonKey() final  bool isPasswordVisible;
@override@JsonKey() final  bool isConfirmPasswordVisible;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool agreeToTerms;
@override final  String? error;

/// Create a copy of SignupFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignupFormStateCopyWith<_SignupFormState> get copyWith => __$SignupFormStateCopyWithImpl<_SignupFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignupFormState&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.confirmPassword, confirmPassword) || other.confirmPassword == confirmPassword)&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.isConfirmPasswordVisible, isConfirmPasswordVisible) || other.isConfirmPasswordVisible == isConfirmPasswordVisible)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.agreeToTerms, agreeToTerms) || other.agreeToTerms == agreeToTerms)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,password,confirmPassword,isPasswordVisible,isConfirmPasswordVisible,isLoading,agreeToTerms,error);

@override
String toString() {
  return 'SignupFormState(name: $name, email: $email, password: $password, confirmPassword: $confirmPassword, isPasswordVisible: $isPasswordVisible, isConfirmPasswordVisible: $isConfirmPasswordVisible, isLoading: $isLoading, agreeToTerms: $agreeToTerms, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SignupFormStateCopyWith<$Res> implements $SignupFormStateCopyWith<$Res> {
  factory _$SignupFormStateCopyWith(_SignupFormState value, $Res Function(_SignupFormState) _then) = __$SignupFormStateCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String password, String confirmPassword, bool isPasswordVisible, bool isConfirmPasswordVisible, bool isLoading, bool agreeToTerms, String? error
});




}
/// @nodoc
class __$SignupFormStateCopyWithImpl<$Res>
    implements _$SignupFormStateCopyWith<$Res> {
  __$SignupFormStateCopyWithImpl(this._self, this._then);

  final _SignupFormState _self;
  final $Res Function(_SignupFormState) _then;

/// Create a copy of SignupFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? password = null,Object? confirmPassword = null,Object? isPasswordVisible = null,Object? isConfirmPasswordVisible = null,Object? isLoading = null,Object? agreeToTerms = null,Object? error = freezed,}) {
  return _then(_SignupFormState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,confirmPassword: null == confirmPassword ? _self.confirmPassword : confirmPassword // ignore: cast_nullable_to_non_nullable
as String,isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isConfirmPasswordVisible: null == isConfirmPasswordVisible ? _self.isConfirmPasswordVisible : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,agreeToTerms: null == agreeToTerms ? _self.agreeToTerms : agreeToTerms // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
