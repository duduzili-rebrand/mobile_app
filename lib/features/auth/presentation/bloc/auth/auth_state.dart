part of 'auth_bloc.dart';

@freezed
sealed class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.registerSuccess({required AuthData data}) =
      _RegisterSuccess;
  const factory AuthState.registerError({required String error}) =
      _RegisterError;
  const factory AuthState.verifyOtpSuccess({required AuthData data}) =
      _VerifyOtpSuccess;
  const factory AuthState.verifyOtpError({required String error}) =
      _VerifyOtpError;
  const factory AuthState.resendOtpSuccess({required AuthData data}) =
      _ResendOtpSuccess;
  const factory AuthState.resendOtpError({required String error}) =
      _ResendOtpError;
  const factory AuthState.completeRegistrationSuccess(
      {required AuthData data}) = _CompleteRegistrationSuccess;
  const factory AuthState.completeRegistrationError({required String error}) =
      _CompleteRegistrationError;
  const factory AuthState.countryListLoading() = _CountryListLoading;
  const factory AuthState.countryListSuccess(
      {required List<CountryData> data}) = _CountryListSuccess;
  const factory AuthState.countryListError({required String error}) =
      _CountryListError;
  const factory AuthState.filterCountryLoading() = _FilterCountryLoading;
  const factory AuthState.filterCountrySuccess(
      {required List<CountryData> data}) = _FilterCountrySuccess;
  const factory AuthState.filterCountryError({required String error}) =
      _FilterCountryError;
  const factory AuthState.defaultUsernameLoading() = _DefaultUsernameLoading;
  const factory AuthState.defaultUsernameSuccess({required String data}) =
      _DefaultUsernameSuccess;
  const factory AuthState.defaultUsernameError({required String error}) =
      _DefaultUsernameError;
  const factory AuthState.validateUsernameLoading() = _ValidateUsernameLoading;
  const factory AuthState.validateUsernameSuccess({required String data}) =
      _ValidateUsernameSuccess;
  const factory AuthState.validateUsernameError({required String error}) =
      _ValidateUsernameError;
  const factory AuthState.updateUsernameLoading() = _UpdateUsernameLoading;
  const factory AuthState.updateUsernameSuccess({required AuthData data}) =
      _UpdateUsernameSuccess;
  const factory AuthState.updateUsernameError({required String error}) =
      _UpdateUsernameError;
  const factory AuthState.uploadProfilePictureSuccess(
      {required AuthData data}) = _UploadProfilePictureSuccess;
  const factory AuthState.uploadProfilePictureError({required String error}) =
      _UploadProfilePictureError;
  const factory AuthState.preferenceListLoading() = _PreferenceListLoading;
  const factory AuthState.preferenceListSuccess(
      {required PreferenceListData data}) = _PreferenceListSuccess;
  const factory AuthState.preferenceListError({required String error}) =
      _PreferenceListError;
  const factory AuthState.locationUpdateLoading() = _LocationUpdateLoading;
  const factory AuthState.locationUpdateSuccess({required AuthData data}) =
      _LocationUpdateSuccess;
  const factory AuthState.locationUpdateError({required String error}) =
      _LocationUpdateError;
  const factory AuthState.loginSuccess({required LoginData data}) =
      _LoginSuccess;
  const factory AuthState.loginError({required String error}) = _LoginError;
  const factory AuthState.recoverAccountSuccess({required AuthData data}) =
      _RecoverAccountSuccess;
  const factory AuthState.recoverAccountError({required String error}) =
      _RecoverAccountError;
  const factory AuthState.logoutLoading() = _LogoutLoading;
  const factory AuthState.logoutSuccess() = _LogoutSuccess;
  const factory AuthState.logoutError({required String error}) = _LogoutError;
}
