// import '../istorage.dart';

import 'package:dartz/dartz.dart';
import 'package:duduzili/core/helpers/helpers.dart';

class IsarImpl implements DatabaseStorage {
  @override
  Future<Either<Failure, void>> createDbProfile(ProfileData data) async =>
      await ProfileRepository().createObject(data);

  @override
  Future<Either<Failure, ProfileData>> getDbProfile() async =>
      await ProfileRepository().getObjects();

  @override
  Future<Either<Failure, void>> createAboutYouDb(AboutYouData data) async =>
      await AboutYouRepository().createObject(data);

  @override
  Future<Either<Failure, AboutYouData>> getAboutYouDb() async =>
      await AboutYouRepository().getObjects();

  @override
  Future<Either<Failure, void>> createBasicInfoDb(BasicInfoData data) async =>
      await BasicInfoRepository().createObject(data);

  @override
  Future<Either<Failure, BasicInfoData>> getBasicInfoDb() async =>
      await BasicInfoRepository().getObjects();
  @override
  Future<Either<Failure, void>> createContactInfoDb(
          ContactInfoData data) async =>
      await ContactInfoRepository().createObject(data);

  @override
  Future<Either<Failure, ContactInfoData>> getContactInfoDb() async =>
      await ContactInfoRepository().getObjects();

  @override
  Future<Either<Failure, List<CountryData>>> getAllCountryFromDb() async =>
      await CountryRepository().getAllObjects();

  @override
  Future<Either<Failure, void>> saveAllCountryToDb(
          List<CountryData> data) async =>
      await CountryRepository().createMultipleObjects(data);

  // @override
  // Future<List<String>> getAllSecurities() {
  //   throw UnimplementedError();
  // }
}
