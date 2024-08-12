// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/api/exceptions/contracts/failure.dart';
import '../../../../../core/data/models/community.dart';
import '../../../repository/icommunity_repository.dart';

part 'joined_community_event.dart';
part 'joined_community_state.dart';
part 'joined_community_bloc.freezed.dart';

class JoinedCommunityBloc
    extends Bloc<JoinedCommunityEvent, JoinedCommunityState> {
  final ICommunityRepository repository;
  JoinedCommunityBloc({required this.repository})
      : super(const JoinedCommunityState.initial()) {
    on<_JoinedCommunityEvent>(_onJoinedCommunity);
  }

  _onJoinedCommunity(
      _JoinedCommunityEvent event, Emitter<JoinedCommunityState> state) async {
    try {
      emit(const JoinedCommunityState.loading());
      final response = await repository.joinedCommunity();
      response.fold((failure) {
        return emit(
          JoinedCommunityState.joinedCommunityError(
            error: failure.failureMessage(),
          ),
        );
      }, (authResponse) async {
        emit(
          JoinedCommunityState.joinedCommunitySuccess(
              data: authResponse.data!.reversed.toList()),
        );
      });
    } on Failure catch (e) {
      emit(
        JoinedCommunityState.joinedCommunityError(error: e.failureMessage()),
      );
    } catch (e) {
      emit(
        JoinedCommunityState.joinedCommunityError(
          error: e.toString(),
        ),
      );
    }
  }
}
