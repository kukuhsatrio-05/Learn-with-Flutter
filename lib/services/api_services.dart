import 'dart:math';
import 'package:dio/dio.dart';
import '../models/product_model.dart';

class ApiServices {
  late final Dio _dio;

  ApiServices() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://fakestoreapi.com/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        logPrint: (log) => print('[DIO] $log'),
      ),
    );
  }

  Future<List<ProductModel>> getProducts() async {
    final response = await _dio.get('/products');
    final List<dynamic> rawList = response.data;
    return rawList.map((item) => ProductModel.fromJson(item)).toList();
  }

  Future<ProductModel> getProductById(int id) async {
    final response = await _dio.get('/products/$id');
    return ProductModel.fromJson(response.data);
  }

  Dio get client => _dio;
}
