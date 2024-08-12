part of 'discover_community_bloc.dart';

@freezed
class DiscoverCommunityEvent with _$DiscoverCommunityEvent {
  const DiscoverCommunityEvent._();
  const factory DiscoverCommunityEvent.fetchDiscoverCommunity() =
      _DiscoverCommunityEvent;
}
