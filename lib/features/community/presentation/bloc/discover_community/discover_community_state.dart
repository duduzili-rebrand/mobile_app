part of 'discover_community_bloc.dart';

@freezed
class DiscoverCommunityState with _$DiscoverCommunityState {
  const DiscoverCommunityState._();

  const factory DiscoverCommunityState.initial() = _Initial;
  const factory DiscoverCommunityState.loading() = _Loading;
  const factory DiscoverCommunityState.discoverCommunitySuccess(
      {required List<CommunityData> data}) = _DiscoverCommunitySuccess;
  const factory DiscoverCommunityState.discoverCommunityError(
      {required String error}) = _DiscoverCommunityError;
}
