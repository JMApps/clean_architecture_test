import 'package:clean_architecture_test/data/api/request/get_day_body.dart';
import 'package:clean_architecture_test/data/mapper/day_mapper.dart';
import 'package:clean_architecture_test/data/service/sunrise_service.dart';
import 'package:clean_architecture_test/domain/model/day.dart';

class ApiUtil {
  final SunriseService _sunriseService;

  ApiUtil(this._sunriseService);

  Future<Day> getDay({
    required double latitude,
    required double longitude,
  }) async {
    final body = GetDayBody(latitude: latitude, longitude: longitude);
    final result = await _sunriseService.getDay(body);
    return DayMapper.fromApi(result);
  }
}
