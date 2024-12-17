// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:messenger/cubit/auth_cubit.dart' as _i753;
import 'package:messenger/cubit/debug_cubit.dart' as _i1010;
import 'package:messenger/db/db.dart' as _i170;
import 'package:messenger/logger.dart' as _i155;
import 'package:messenger/settings.dart' as _i590;
import 'package:messenger/utils.dart' as _i701;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i170.UsersDB>(() => _i170.UsersDB());
  gh.factory<_i1010.DebugCubit>(() => _i1010.DebugCubit());
  gh.factory<_i753.AuthCubit>(() => _i753.AuthCubit());
  gh.singleton<_i701.Utils>(() => _i701.Utils());
  gh.singletonAsync<_i155.Logger>(() {
    final i = _i155.Logger();
    return i.init().then((_) => i);
  });
  gh.singletonAsync<_i170.DB>(() => _i170.DB.create());
  gh.singletonAsync<_i590.Settings>(() => _i590.Settings.create());
  return getIt;
}
