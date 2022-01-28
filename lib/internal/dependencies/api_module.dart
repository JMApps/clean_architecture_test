import 'package:clean_architecture_test/data/api/api_util.dart';
import 'package:clean_architecture_test/data/service/sunrise_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    _apiUtil ??= ApiUtil(SunriseService());
    return _apiUtil!;
  }
}