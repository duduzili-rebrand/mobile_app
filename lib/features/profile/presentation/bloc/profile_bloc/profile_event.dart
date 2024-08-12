part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const ProfileEvent._();
  const factory ProfileEvent.fetchDashboardProfile() = _DashboardProfile;
}
