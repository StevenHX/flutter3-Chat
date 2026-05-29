// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 注册表单状态管理

@ProviderFor(SignupForm)
final signupFormProvider = SignupFormProvider._();

/// 注册表单状态管理
final class SignupFormProvider
    extends $NotifierProvider<SignupForm, SignupFormState> {
  /// 注册表单状态管理
  SignupFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signupFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signupFormHash();

  @$internal
  @override
  SignupForm create() => SignupForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignupFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignupFormState>(value),
    );
  }
}

String _$signupFormHash() => r'702369f289600d140844c41690981026d2ccb1b3';

/// 注册表单状态管理

abstract class _$SignupForm extends $Notifier<SignupFormState> {
  SignupFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SignupFormState, SignupFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SignupFormState, SignupFormState>,
              SignupFormState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
