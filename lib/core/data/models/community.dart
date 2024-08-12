class CommunityData {
  String? name;
  String? description;
  String? groupRules;
  String? privacy;
  String? communityId;
  String? membersCount;
  List<String>? membersPhotoPreview;
  String? coverPhoto;

  CommunityData({
    this.description,
    this.groupRules,
    this.name,
    this.privacy,
    this.communityId,
    this.membersCount,
    this.membersPhotoPreview,
    this.coverPhoto,
  });

  factory CommunityData.fromJson(Map<String, dynamic> json) {
    return CommunityData(
      name: json['name'],
      description: json['description'],
      groupRules: json['group_rules'],
      privacy: json['privacy'],
      communityId: json['community_id'],
      membersCount: json['members_count'],
      membersPhotoPreview: json['members_photo_preview'] == null
          ? null
          : (json['members_photo_preview'] as List)
              .map((item) => item as String)
              .toList(),
      coverPhoto: json['cover_photo'],
    );
  }
}
