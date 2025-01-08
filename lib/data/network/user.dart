import 'package:supono/app/enums/gender.dart';

class User {
  User({
    this.birthday,
    this.nickname,
    this.gender,
    this.birthD,
    this.birthM,
    this.birthY,
    this.avatar,
    this.isAppUnlocked = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final user = User(
      birthday: json['birthday'] != null
          ? DateTime.parse(json['birthday'] as String)
          : null,
      nickname: json['nickname'] as String?,
      gender:
          json['gender'] != null ? Gender.values[json['gender'] as int] : null,
      avatar: json['avatar'] as String?,
      isAppUnlocked: json['isAppUnlocked'] as bool? ?? false,
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
  final String? avatar;
  final bool isAppUnlocked;

  User copyWith({
    DateTime? birthday,
    String? nickname,
    Gender? gender,
    int? birthD,
    int? birthM,
    int? birthY,
    String? avatar,
    bool? isAppUnlocked,
  }) =>
      User(
        birthday: birthday ?? this.birthday,
        nickname: nickname ?? this.nickname,
        gender: gender ?? this.gender,
        birthD: birthD ?? this.birthD,
        birthM: birthM ?? this.birthM,
        birthY: birthY ?? this.birthY,
        avatar: avatar ?? this.avatar,
        isAppUnlocked: isAppUnlocked ?? this.isAppUnlocked,
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
      'avatar': avatar,
      'isAppUnlocked': isAppUnlocked,
    };
  }

  String get birthdayString {
    final b = DateTime(
      birthY ?? DateTime.now().year,
      birthM ?? DateTime.now().month,
      birthD ?? DateTime.now().day,
    );

    return '${b.day.toString().padLeft(2, '0')}'
        '/${b.month.toString().padLeft(2, '0')}/${b.year}';
  }
}
