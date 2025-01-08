import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:supono/app/enums/gender.dart';
import 'package:supono/data/network/user.dart';

part 'user_form_state.dart';

class UserFormCubit extends Cubit<UserFormState> {
  UserFormCubit() : super(UserFormState.initial());

  void nameChanged(String nickname) => emit(
        state.copyWith(
          user: state.user.copyWith(nickname: nickname),
          optionOfSuccessOrFailure: none(),
        ),
      );

  void genderChanged(Gender gender) => emit(
        state.copyWith(
          user: state.user.copyWith(gender: gender),
          optionOfSuccessOrFailure: none(),
        ),
      );

  void birthdayChanged(String birthday) {
    final day = int.tryParse(birthday);
    if (day == null || day < 1 || day > 31) return;

    emit(
      state.copyWith(
        user: state.user.copyWith(birthD: day),
        optionOfSuccessOrFailure: none(),
      ),
    );
  }

  void birthMonthChanged(String birthMonth) {
    final month = int.tryParse(birthMonth);
    if (month == null || month < 1 || month > 12) return;

    emit(
      state.copyWith(
        user: state.user.copyWith(birthM: month),
        optionOfSuccessOrFailure: none(),
      ),
    );
  }

  void birthYearChanged(String birthYear) {
    final year = int.tryParse(birthYear);
    if (year == null || year < 1900 || year > DateTime.now().year) return;

    emit(
      state.copyWith(
        user: state.user.copyWith(birthY: year),
        optionOfSuccessOrFailure: none(),
      ),
    );
  }
}
