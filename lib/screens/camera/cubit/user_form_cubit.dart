import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:supono/app/data/app_query_params.dart';
import 'package:supono/app/enums/gender.dart';
import 'package:supono/data/network/user.dart';
import 'package:supono/data/storage/local_storage.dart';

part 'user_form_state.dart';

@injectable
class UserFormCubit extends Cubit<UserFormState> {
  UserFormCubit(this._localStorage) : super(UserFormState.initial());

  final LocalStorage _localStorage;

  void initializeUser(User? user) {
    emit(
      state.copyWith(
        user: user,
        optionOfSuccessOrFailure: none(),
      ),
    );
  }

  void nicknameChanged(String nickname) => emit(
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

  void changeUserAvatar(XFile avatar) {
    emit(
      state.copyWith(
        user: state.user.copyWith(avatar: avatar.path),
        optionOfSuccessOrFailure: none(),
      ),
    );

    _localStorage.setString(
      AppQueryParams.userInfo,
      json.encode(state.user.copyWith(avatar: avatar.path).toJson()),
    );
  }

  void unlockApp() {
    emit(
      state.copyWith(
        user: state.user.copyWith(isAppUnlocked: true),
        optionOfSuccessOrFailure: none(),
      ),
    );

    _localStorage.setString(
      AppQueryParams.userInfo,
      json.encode(state.user.copyWith(isAppUnlocked: true).toJson()),
    );
  }

  void birthdayChanged(String birthday) {
    final day = int.tryParse(birthday);
    if (day == null || day < 1 || day > 31) {
      emit(
        state.copyWith(
          user: state.user.copyWith(birthD: -1),
          optionOfSuccessOrFailure: none(),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        user: state.user.copyWith(birthD: day),
        optionOfSuccessOrFailure: none(),
      ),
    );
  }

  void birthMonthChanged(String birthMonth) {
    final month = int.tryParse(birthMonth);
    if (month == null || month < 1 || month > 12) {
      emit(
        state.copyWith(
          user: state.user.copyWith(birthM: -1),
          optionOfSuccessOrFailure: none(),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        user: state.user.copyWith(birthM: month),
        optionOfSuccessOrFailure: none(),
      ),
    );
  }

  void birthYearChanged(String birthYear) {
    final year = int.tryParse(birthYear);
    if (year == null || year < 1900 || year > DateTime.now().year) {
      emit(
        state.copyWith(
          user: state.user.copyWith(birthY: -1),
          optionOfSuccessOrFailure: none(),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        user: state.user.copyWith(birthY: year),
        optionOfSuccessOrFailure: none(),
      ),
    );
  }
}
