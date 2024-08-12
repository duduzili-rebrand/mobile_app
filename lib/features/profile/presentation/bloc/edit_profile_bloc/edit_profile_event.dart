part of 'edit_profile_bloc.dart';

@freezed
class EditProfileEvent with _$EditProfileEvent {
  const EditProfileEvent._();
  const factory EditProfileEvent.editAboutYou({required AboutYouData data}) =
      _EditAboutYou;
  const factory EditProfileEvent.editBasicInfo({required BasicInfoData data}) =
      _EditBasicInfo;
  const factory EditProfileEvent.editContactInfo(
      {required ContactInfoData data}) = _EditContactInfo;
}
