import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../core/api/exceptions/contracts/failure.dart';
import '../../../core/api/service/contracts/api_response.dart';
import '../../../core/data/models/community.dart';

abstract class ICommunityRepository {
  Future<Either<Failure, ApiResponse<CommunityData>>> createCommunity(
      CommunityData data);
  Future<Either<Failure, ApiResponse<List<CommunityData>>>> createdCommunity();
  Future<Either<Failure, ApiResponse<CommunityData>>> uploadCommunityCoverPhoto(
      {required File file, required String communityId});
  Future<Either<Failure, ApiResponse<List<CommunityData>>>> discoverCommunity();
  Future<Either<Failure, ApiResponse<List<CommunityData>>>> joinedCommunity();
  Future<Either<Failure, ApiResponse<CommunityData>>> toggleCommunityMembership(
      CommunityData data);
  Future<Either<Failure, ApiResponse<CommunityData>>> communityDashboard(
      String data);
}
