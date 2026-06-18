import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/api_services.dart';

enum FetchStatus { loading, success, error }

class ProductProvider extends ChangeNotifier {
  final ApiServices _apiService = ApiServices();

  FetchStatus _status = FetchStatus.loading;

  List<ProductModel> _products = [];

  String _errorMessage = '';

  FetchStatus get status => _status;

  List<ProductModel> get products => _products;

  String get errorMessage => _errorMessage;

  bool _isOffline = false;

  bool get isOffline => _isOffline;

  Future<void> fetchProducts() async {
    _status = FetchStatus.loading;

    notifyListeners();

    try {
      _products = await _apiService.getProducts();

      _status = FetchStatus.success;
    } catch (e) {
      _status = FetchStatus.error;

      _isOffline = true;
    }

    notifyListeners();
  }
}
