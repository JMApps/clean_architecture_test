import 'package:clean_architecture_test/domain/state/home_state.dart';
import 'package:clean_architecture_test/internal/dependencies/repository_module.dart';

class HomeModule {
  static HomeState homeState() {
    return HomeState(
      RepositoryModule.dayRepository(),
    );
  }
}