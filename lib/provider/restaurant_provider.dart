import 'package:flutter/material.dart';
import '../data/api_service.dart';
import '../models/restaurant.dart';

enum ResultState { loading, success, error }

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();

  ResultState _state = ResultState.loading;
  ResultState get state => _state;

  List<Restaurant> _restaurants = [];
  List<Restaurant> get restaurants => _restaurants;

  RestaurantDetail? _restaurantDetail;
  RestaurantDetail? get restaurantDetail => _restaurantDetail;

  String _message = '';
  String get message => _message;

  Future<void> fetchAllRestaurants() async {
    _state = ResultState.loading;
    notifyListeners();
    try {
      final result = await apiService.fetchRestaurantList();
      _restaurants = result.restaurants;
      _state = ResultState.success;
    } catch (e) {
      _message = e.toString();
      _state = ResultState.error;
    }
    notifyListeners();
  }

  Future<void> fetchRestaurantDetail(String id) async {
    _state = ResultState.loading;
    notifyListeners();
    try {
      final result = await apiService.fetchRestaurantDetail(id);
      _restaurantDetail = result.restaurant;
      _state = ResultState.success;
    } catch (e) {
      _message = e.toString();
      _state = ResultState.error;
    }
    notifyListeners();
  }
}
