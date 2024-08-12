part of 'community_bloc.dart';

@freezed
class CommunityEvent with _$CommunityEvent {
  const CommunityEvent._();
  const factory CommunityEvent.createCommunity({required CommunityData data}) =
      _CreateCommunity;
  const factory CommunityEvent.uploadCommunityCoverPhoto(
      {required File file,
      required String communityId}) = _UploadCommunityCoverPhoto;
}
