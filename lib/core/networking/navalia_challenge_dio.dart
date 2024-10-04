import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:navalia_code_challenge/core/constants/urls.dart';

class NavaliaChallengeDio extends DioForNative {
  NavaliaChallengeDio() {
    options = BaseOptions(baseUrl: Urls.baseUrl);
    interceptors.add(cacheInterceptor);
  }

  static final _cacheStore = HiveCacheStore(null);

  final _cacheOptions = CacheOptions(
    store: _cacheStore,
    hitCacheOnErrorExcept: [],
  );

  CacheOptions get cacheOptions => _cacheOptions;
  DioCacheInterceptor get cacheInterceptor {
    return DioCacheInterceptor(options: _cacheOptions);
  }
}
