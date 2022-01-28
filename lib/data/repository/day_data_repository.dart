import 'package:clean_architecture_test/data/api/api_util.dart';
import 'package:clean_architecture_test/domain/model/day.dart';
import 'package:clean_architecture_test/domain/repository/day_repository.dart';

class DayDataRepository extends DayRepository {
  final ApiUtil _apiUtil;

  DayDataRepository(this._apiUtil);

  @override
  Future<Day> getDay({required double latitude, required double longitude}) {
    return _apiUtil.getDay(latitude: latitude, longitude: longitude);
  }
}
