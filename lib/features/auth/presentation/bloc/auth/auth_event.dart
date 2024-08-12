part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.register({required AuthData authData}) = _Register;
  const factory AuthEvent.verifyOtp({required AuthData authData}) = _VerifyOtp;
  const factory AuthEvent.resendOtp() = _ResendOtp;
  const factory AuthEvent.completeRegistration({required AuthData authData}) =
      _CompleteRegistration;
  const factory AuthEvent.countryList() = _CountryList;
  const factory AuthEvent.filterCountry({required String searchText}) =
      _FilterCountry;
  const factory AuthEvent.fetchDefaultUsername() = _DefaultUsername;
  const factory AuthEvent.validateDefaultUsername({required String query}) =
      _ValidateUsername;
  const factory AuthEvent.updateDefaultUsername({required AuthData data}) =
      _UpdateUsername;
  const factory AuthEvent.uploadProfilePicture({required File file}) =
      _UploadProfilePicture;
  const factory AuthEvent.fetchPreferenceList() = _PreferenceList;
  const factory AuthEvent.locationUpdate({required AuthData data}) =
      _LocationUpdate;
  const factory AuthEvent.login({required LoginData data}) = _Login;
  const factory AuthEvent.recoverAccount({required AuthData data}) =
      _RecoverAccount;
  const factory AuthEvent.logout() = _Logout;
}
