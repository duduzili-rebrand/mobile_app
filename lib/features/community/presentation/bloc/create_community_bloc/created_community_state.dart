part of 'created_community_bloc.dart';

@freezed
class CreatedCommunityState with _$CreatedCommunityState {
  const CreatedCommunityState._();

  const factory CreatedCommunityState.initial() = _Initial;
  const factory CreatedCommunityState.loading() = _Loading;
  const factory CreatedCommunityState.createdCommunitySuccess(
      {required List<CommunityData> data}) = _CreatedCommunitySuccess;
  const factory CreatedCommunityState.createdCommunityError(
      {required String error}) = _CreatedCommunityError;
}
