import 'package:clean_architecture_test/data/api/api_day.dart';
import 'package:clean_architecture_test/domain/model/day.dart';

class DayMapper {
  static Day fromApi(ApiDay day) {
    return Day(
      sunrise: DateTime.parse(day.sunrise),
      sunset: DateTime.parse(day.sunset),
      solarNoon: DateTime.parse(day.solarNoon),
      dayLength: day.dayLength.toInt(),
    );
  }
}
