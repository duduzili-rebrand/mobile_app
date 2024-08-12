part of 'basic_info_bloc.dart';

@freezed
class BasicInfoEvent with _$BasicInfoEvent {
  const BasicInfoEvent._();
  const factory BasicInfoEvent.fetchBasicInfo() = _BasicInfo;
}
