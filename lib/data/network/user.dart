import 'package:supono/app/enums/gender.dart';

class User {
  User({
    this.birthday,
    this.nickname,
    this.gender,
    this.birthD,
    this.birthM,
    this.birthY,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final user = User(
      birthday: json['birthday'] != null
          ? DateTime.parse(json['birthday'] as String)
          : null,
      nickname: json['nickname'] as String?,
      gender:
          json['gender'] != null ? Gender.values[json['gender'] as int] : null,
    );

    return user.copyWith(
      birthD: user.birthday?.day,
      birthM: user.birthday?.month,
      birthY: user.birthday?.year,
    );
  }

  User.empty() : this();

  final DateTime? birthday;
  final String? nickname;
  final Gender? gender;
  final int? birthD;
  final int? birthM;
  final int? birthY;

  User copyWith({
    DateTime? birthday,
    String? nickname,
    Gender? gender,
    int? birthD,
    int? birthM,
    int? birthY,
  }) =>
      User(
        birthday: birthday ?? this.birthday,
        nickname: nickname ?? this.nickname,
        gender: gender ?? this.gender,
        birthD: birthD ?? this.birthD,
        birthM: birthM ?? this.birthM,
        birthY: birthY ?? this.birthY,
      );

  Map<String, dynamic> toJson() {
    return {
      'birthday': DateTime(
        birthY ?? DateTime.now().year,
        birthM ?? DateTime.now().month,
        birthD ?? DateTime.now().day,
      ).toIso8601String(),
      'nickname': nickname,
      'gender': gender?.index,
    };
  }
}
