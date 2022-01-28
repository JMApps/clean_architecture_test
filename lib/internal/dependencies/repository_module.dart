import 'package:clean_architecture_test/data/repository/day_data_repository.dart';
import 'package:clean_architecture_test/domain/repository/day_repository.dart';
import 'package:clean_architecture_test/internal/dependencies/api_module.dart';

class RepositoryModule {
  static DayRepository? _dayRepository;

  static DayRepository dayRepository() {
    _dayRepository ??= DayDataRepository(ApiModule.apiUtil());
    return _dayRepository!;
  }
}