part of 'community_dashboard_bloc.dart';

@freezed
class CommunityDashboardEvent with _$CommunityDashboardEvent {
  const CommunityDashboardEvent._();
  const factory CommunityDashboardEvent.fetchCommunityDashboard(
      {required String data}) = _CommunityDashboard;
}
