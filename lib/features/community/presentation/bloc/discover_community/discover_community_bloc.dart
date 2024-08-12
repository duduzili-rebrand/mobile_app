// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/helpers/helpers.dart';

part 'discover_community_event.dart';
part 'discover_community_state.dart';
part 'discover_community_bloc.freezed.dart';

class DiscoverCommunityBloc
    extends Bloc<DiscoverCommunityEvent, DiscoverCommunityState> {
  final ICommunityRepository repository;
  DiscoverCommunityBloc({required this.repository})
      : super(const DiscoverCommunityState.initial()) {
    on<_DiscoverCommunityEvent>(_onDiscoverCommunity);
  }

  _onDiscoverCommunity(_DiscoverCommunityEvent event,
      Emitter<DiscoverCommunityState> state) async {
    try {
      emit(const DiscoverCommunityState.loading());
      final response = await repository.discoverCommunity();
      response.fold((failure) {
        return emit(
          DiscoverCommunityState.discoverCommunityError(
            error: failure.failureMessage(),
          ),
        );
      }, (authResponse) async {
        emit(
          DiscoverCommunityState.discoverCommunitySuccess(
              data: authResponse.data!.reversed.toList()),
        );
      });
    } on Failure catch (e) {
      emit(
        DiscoverCommunityState.discoverCommunityError(
            error: e.failureMessage()),
      );
    } catch (e) {
      emit(
        DiscoverCommunityState.discoverCommunityError(
          error: e.toString(),
        ),
      );
    }
  }
}
