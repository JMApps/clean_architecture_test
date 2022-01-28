import 'package:clean_architecture_test/domain/model/day.dart';
import 'package:clean_architecture_test/domain/repository/day_repository.dart';
import 'package:flutter/material.dart';

class HomeState with ChangeNotifier {

  HomeState(this._dayRepository);
  final DayRepository _dayRepository;

  DayRepository get getDayRepository => _dayRepository;

  Day? _day;

  Day? get getDayModel => _day;

  bool _isLoading = false;

  bool get getIsLoading => _isLoading;

  Future<void> getDay({
    required double latitude,
    required double longitude,
  }) async {
    _isLoading = true;
    final data = await _dayRepository.getDay(latitude: latitude, longitude: longitude);
    _day = data;
    _isLoading = false;
    notifyListeners();
  }
}
