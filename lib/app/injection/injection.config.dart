// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/storage/local_storage.dart' as _i442;
import '../../screens/camera/cubit/user_form_cubit.dart' as _i14;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i442.LocalStorage>(() => _i442.LocalStorage());
    gh.factory<_i14.UserFormCubit>(
        () => _i14.UserFormCubit(gh<_i442.LocalStorage>()));
    return this;
  }
}
