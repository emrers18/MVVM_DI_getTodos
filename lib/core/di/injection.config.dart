// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mvvm/core/di/register_module.dart' as _i1013;
import 'package:mvvm/data/data.dart' as _i669;
import 'package:mvvm/data/services/todo_service.dart' as _i365;
import 'package:mvvm/domain/todo_repository.dart' as _i739;

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
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i519.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i365.IService>(
        () => _i365.TodoService(gh<_i519.Client>()));
    gh.lazySingleton<_i739.IRepository>(
        () => _i739.TodoRepository(todoService: gh<_i669.IService>()));
    return this;
  }
}

class _$RegisterModule extends _i1013.RegisterModule {}
