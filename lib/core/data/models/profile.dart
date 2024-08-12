import 'package:duduzili/core/helpers/helpers.dart';
part 'profile.g.dart';

@collection
class ProfileData {
  Id id = Isar.autoIncrement;
  @Index(unique: true, replace: true)
  String? username;
  String? fullName;
  String? firstName;
  String? lastName;
  String? middleName;
  String? numberOfPosts;
  String? followings;
  String? followers;
  String? bio;
  String? profilePicture;
  String? gender;
  String? maritalStatus;
  String? dateOfBirth;

  String? city;
  String? email;
  String? alternativeEmail;
  String? phoneNumber;
  String? countryId;

  ProfileData({
    this.username,
    this.fullName,
    this.numberOfPosts,
    this.followings,
    this.followers,
    this.bio,
    this.profilePicture,
    this.firstName,
    this.lastName,
    this.middleName,
    this.gender,
    this.maritalStatus,
    this.dateOfBirth,
    // this.country,
    this.city,
    this.email,
    this.alternativeEmail,
    this.phoneNumber,
    this.countryId,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      username: json['username'],
      fullName: json['full_name'],
      numberOfPosts: json['number_of_posts'],
      followings: json['followings'],
      followers: json['followers'],
      bio: json['bio'],
      profilePicture: json['profile_picture'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      middleName: json['middle_name'],
      gender: json['gender'],
      maritalStatus: json['marital_status'],
      dateOfBirth: json['date_of_birth'],
      // country: json['country'] == null
      //     ? null
      //     : CountryNamedData.fromJson(json['country']),
      city: json['city'],
      email: json['email'],
      alternativeEmail: json['alternative_email'],
      phoneNumber: json['phone_number'],
      countryId: json['country_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "full_name": fullName,
        "number_of_posts": numberOfPosts,
        "followings": followings,
        "followers": followers,
        "bio": bio,
        "profile_picture": profilePicture,
        "first_name": firstName,
        "last_Name": lastName,
      };

  String get userFullName =>
      "${firstName?.toString().decrypt() ?? ""} ${lastName?.toString().decrypt() ?? ""}";
}
