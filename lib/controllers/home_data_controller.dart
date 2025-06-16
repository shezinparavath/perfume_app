import 'package:flutter/material.dart';
import 'package:perfume_app/services/api_services.dart';

import '../models/home_data_model/home_data_model.dart';
import '../models/home_data_model/product.dart';
import '../models/login_token_model/login_token_model.dart';

class HomeDataController with ChangeNotifier {
  final ApiServices _apiServices = ApiServices();

  Future<LoginTokenModel> getLoginToken() async {
    try {
      return await _apiServices.loginToken();
    } catch (e) {
      throw Exception('error occured');
    }
  }

  Future<HomeDataModel> getHomeData(String token) async {
    try {
      final data = await _apiServices.getHomeData(token);
      _products =
          data.data?.homeFields
              ?.expand((e) => e.products ?? [])
              .cast<Product>()
              .toList() ??
          [];
      return data;
    } catch (e) {
      throw Exception('error occured');
    }
  }

  List<Product> _products = [];

  List<Product> get products => _products;
  void initailizeProducts(List<Product> items) {
    _products = List.from(items);
    notifyListeners();
  }

void toggleWishlistById(int productId) {
  final index = _products.indexWhere((p) => p.id == productId);
  if (index != -1) {
    _products[index].wishlisted = !(_products[index].wishlisted ?? false);
    notifyListeners();
  }
}

void toggleCartAddingById(int productId) {
  final index = _products.indexWhere((p) => p.id == productId);
  if (index != -1) {
    _products[index].cartCount = (_products[index].cartCount ?? 0) + 1;
    notifyListeners();
  }
}

void toggleCartSubtractById(int productId) {
  final index = _products.indexWhere((p) => p.id == productId);
  if (index != -1 && (_products[index].cartCount ?? 0) > 0) {
    _products[index].cartCount = _products[index].cartCount! - 1;
    notifyListeners();
  }
}

}
