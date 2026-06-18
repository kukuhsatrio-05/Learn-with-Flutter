import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/product_model.dart';
import '../services/api_services.dart';

enum FetchStatus { loading, success, error }

class ProductProvider extends ChangeNotifier {
  final ApiServices _apiService = ApiServices();

  FetchStatus _status = FetchStatus.loading;
  List<ProductModel> _products = [];
  String _errorMessage = '';
  bool _isOffline = false;

  FetchStatus get status => _status;
  List<ProductModel> get products => _products;
  String get errorMessage => _errorMessage;
  bool get isOffline => _isOffline;

  Future<void> fetchProducts() async {
    _status = FetchStatus.loading;
    _isOffline = false;
    _errorMessage = '';
    notifyListeners();

    try {
      _products = await _apiService.getProducts();
      _status = FetchStatus.success;
    } on DioException catch (e) {
      _status = FetchStatus.error;
      _isOffline = true;

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        _errorMessage = 'Unstable internet connection. Try again.';
      } else if (e.type == DioExceptionType.connectionError) {
        _errorMessage = 'Ups! No internet connection.';
      } else {
        _errorMessage = 'System fault: ${e.message}';
      }
    } catch (e) {
      _status = FetchStatus.error;
      _errorMessage = 'Unpredictable condition.';
    }

    notifyListeners();
  }
}
