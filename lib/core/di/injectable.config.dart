// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;

import '../network/dio_client.dart' as _i6;
import '../network/network_info.dart' as _i5;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioClient = _$DioClient();
  final networkModule = _$NetworkModule();
  gh.singleton<_i3.Dio>(() => dioClient.dio());
  gh.factory<_i4.InternetConnectionChecker>(
      () => networkModule.checkConnection());
  gh.factory<_i5.NetworkInfo>(
      () => _i5.NetworkInfoImpl(gh<_i4.InternetConnectionChecker>()));
  return getIt;
}

class _$DioClient extends _i6.DioClient {}

class _$NetworkModule extends _i5.NetworkModule {}
