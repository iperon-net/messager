// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:messenger/logger.dart' as _i155;
import 'package:messenger/settings.dart' as _i590;

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
  gh.singletonAsync<_i155.Logger>(() {
    final i = _i155.Logger();
    return i.init().then((_) => i);
  });
  gh.singletonAsync<_i590.Settings>(() => _i590.Settings.create());
  return getIt;
}
