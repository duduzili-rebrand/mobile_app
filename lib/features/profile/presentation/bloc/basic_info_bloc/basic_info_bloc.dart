// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/helpers/helpers.dart';

part 'basic_info_event.dart';
part 'basic_info_state.dart';
part 'basic_info_bloc.freezed.dart';

class BasicInfoBloc extends Bloc<BasicInfoEvent, BasicInfoState> {
  final IProfileRepository repository;
  final NetworkInfo networkInfo;
  BasicInfoBloc({required this.repository, required this.networkInfo})
      : super(const BasicInfoState.initial()) {
    on<_BasicInfo>(_onBasicInfo);
  }

  _onBasicInfo(_BasicInfo event, Emitter<BasicInfoState> state) async {
    try {
      emit(const BasicInfoState.basicInfoLoading());
      if (await networkInfo.isConnected()) {
        final response = await repository.basicInfo();
        response.fold((failure) {
          return emit(
            BasicInfoState.basicInfoError(
              error: failure.failureMessage(),
            ),
          );
        }, (authResponse) async {
          repository.createBasicInfoFromDb(authResponse.data!);
          emit(BasicInfoState.basicInfoSuccess(data: authResponse.data!));
        });
      } else {
        final response = await repository.getBasicInfoFromDb();
        response.fold((failure) {
          return emit(
            BasicInfoState.basicInfoError(
              error: failure.failureMessage(),
            ),
          );
        }, (authResponse) async {
          emit(BasicInfoState.basicInfoSuccess(data: authResponse));
        });
      }
    } on Failure catch (e) {
      emit(
        BasicInfoState.basicInfoError(
          error: e.failureMessage(),
        ),
      );
    } catch (e) {
      emit(
        BasicInfoState.basicInfoError(
          error: e.toString(),
        ),
      );
    }
  }
}
