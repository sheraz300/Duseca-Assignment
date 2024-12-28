// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SocialStatModel {
  String socialIconPath;
  String name;
  String socialAccount;
  String socialFollowerCount;
  String growthPercentage;
  String followers;
  SocialStatModel({
    required this.socialIconPath,
    required this.name,
    required this.socialAccount,
    required this.socialFollowerCount,
    required this.growthPercentage,
    required this.followers,
  });

  SocialStatModel copyWith({
    String? socialIconPath,
    String? name,
    String? socialAccount,
    String? socialFollowerCount,
    String? growthPercentage,
    String? followers,
  }) {
    return SocialStatModel(
      socialIconPath: socialIconPath ?? this.socialIconPath,
      name: name ?? this.name,
      socialAccount: socialAccount ?? this.socialAccount,
      socialFollowerCount: socialFollowerCount ?? this.socialFollowerCount,
      growthPercentage: growthPercentage ?? this.growthPercentage,
      followers: followers ?? this.followers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'socialIconPath': socialIconPath,
      'name': name,
      'socialAccount': socialAccount,
      'socialFollowerCount': socialFollowerCount,
      'growthPercentage': growthPercentage,
      'followers': followers,
    };
  }

  factory SocialStatModel.fromMap(Map<String, dynamic> map) {
    return SocialStatModel(
      socialIconPath: map['socialIconPath'] as String,
      name: map['name'] as String,
      socialAccount: map['socialAccount'] as String,
      socialFollowerCount: map['socialFollowerCount'] as String,
      growthPercentage: map['growthPercentage'] as String,
      followers: map['followers'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialStatModel.fromJson(String source) =>
      SocialStatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SocialStatModel(socialIconPath: $socialIconPath, name: $name, socialAccount: $socialAccount, socialFollowerCount: $socialFollowerCount, growthPercentage: $growthPercentage, followers: $followers)';
  }

  @override
  bool operator ==(covariant SocialStatModel other) {
    if (identical(this, other)) return true;

    return other.socialIconPath == socialIconPath &&
        other.name == name &&
        other.socialAccount == socialAccount &&
        other.socialFollowerCount == socialFollowerCount &&
        other.growthPercentage == growthPercentage &&
        other.followers == followers;
  }

  @override
  int get hashCode {
    return socialIconPath.hashCode ^
        name.hashCode ^
        socialAccount.hashCode ^
        socialFollowerCount.hashCode ^
        growthPercentage.hashCode ^
        followers.hashCode;
  }
}
