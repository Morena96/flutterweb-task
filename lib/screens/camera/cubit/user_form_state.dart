part of 'user_form_cubit.dart';

class UserFormState {
  UserFormState({
    required this.user,
    required this.isEditing,
    required this.isSaving,
    required this.optionOfSuccessOrFailure,
  });

  factory UserFormState.initial() => UserFormState(
        user: User.empty(),
        isEditing: false,
        isSaving: false,
        optionOfSuccessOrFailure: none(),
      );

  User user;
  bool isEditing;
  bool isSaving;
  String? errorText;
  Option<Either<String, User>> optionOfSuccessOrFailure;

  UserFormState copyWith({
    User? user,
    bool? isEditing,
    bool? isSaving,
    Option<Either<String, User>>? optionOfSuccessOrFailure,
    String? errorText,
  }) =>
      UserFormState(
        user: user ?? this.user,
        isEditing: isEditing ?? this.isEditing,
        isSaving: isSaving ?? this.isSaving,
        optionOfSuccessOrFailure:
            optionOfSuccessOrFailure ?? this.optionOfSuccessOrFailure,
      );

  bool get isBirthdayValid {
    if (user.birthD == null || user.birthM == null || user.birthY == null) {
      return false;
    }
    try {
      final date = DateTime(user.birthY!, user.birthM!, user.birthD!);
      return date.year == user.birthY! &&
          date.month == user.birthM! &&
          date.day == user.birthD! &&
          user.birthY! > 1900 &&
          user.birthY! < DateTime.now().year;
    } catch (e) {
      return false;
    }
  }

  bool get isNicknameValid =>
      user.nickname != null && user.nickname!.isNotEmpty;
}
