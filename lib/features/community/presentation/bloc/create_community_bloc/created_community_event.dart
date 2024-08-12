part of 'created_community_bloc.dart';

@freezed
class CreatedCommunityEvent with _$CreatedCommunityEvent {
  const CreatedCommunityEvent._();
  const factory CreatedCommunityEvent.fetchCreatedCommunity() =
      _CreatedCommunity;
}
