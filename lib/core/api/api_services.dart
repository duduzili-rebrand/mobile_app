import 'dart:io';

import 'package:dartz/dartz.dart';
import '../helpers/helpers.dart';

abstract class ApiServices {
  Future<Either<Failure, ApiResponse<AuthData>>> register(AuthData data);
  Future<Either<Failure, ApiResponse<AuthData>>> verifyOtp(AuthData data);
  Future<Either<Failure, ApiResponse<AuthData>>> resendOtp();
  Future<Either<Failure, ApiResponse<AuthData>>> completeRegistration(
      AuthData data);
  Future<Either<Failure, ApiResponse<List<CountryData>>>> countryList();
  Future<Either<Failure, ApiResponse<String>>> defaultUsername();
  Future<Either<Failure, ApiResponse<String>>> validateUsername(String data);
  Future<Either<Failure, ApiResponse<AuthData>>> updateUsername(AuthData data);
  Future<Either<Failure, ApiResponse<AuthData>>> uploadProfilePicture(
      File file);
  Future<Either<Failure, ApiResponse<PreferenceListData>>> preferenceList();
  Future<Either<Failure, ApiResponse<AuthData>>> locationUpdate(AuthData data);
  Future<Either<Failure, ApiResponse<LoginData>>> login(LoginData data);
  Future<Either<Failure, ApiResponse<AuthData>>> recoverAccount(AuthData data);
  Future<Either<Failure, ApiResponse<AuthData>>> validateRecovery(
      AuthData data);
  Future<Either<Failure, ApiResponse<ProfileData>>> profile();
  Future<Either<Failure, ApiResponse<AboutYouData>>> aboutYou();
  Future<Either<Failure, ApiResponse<AboutYouData>>> editAboutYou(
      AboutYouData data);
  Future<Either<Failure, ApiResponse<BasicInfoData>>> basicInfo();
  Future<Either<Failure, ApiResponse<ContactInfoData>>> contactInfo();
  Future<Either<Failure, ApiResponse<BasicInfoData>>> editBasicInfo(
      BasicInfoData data);
  Future<Either<Failure, ApiResponse<ContactInfoData>>> editContactInfo(
      ContactInfoData data);
  Future<Either<Failure, ApiResponse<CommunityData>>> createCommunity(
      CommunityData data);
  Future<Either<Failure, ApiResponse<List<CommunityData>>>> createdCommunity();
  Future<Either<Failure, ApiResponse<CommunityData>>> uploadCommunityCoverPhoto(
      File file, String communityId);
  Future<Either<Failure, ApiResponse<List<CommunityData>>>> discoverCommunity();
  Future<Either<Failure, ApiResponse<List<CommunityData>>>> joinedCommunity();
  Future<Either<Failure, ApiResponse<CommunityData>>>
      toggleCommunityMemberShip(CommunityData data);
  Future<Either<Failure, ApiResponse<CommunityData>>> communityDashboard(String data);
}

