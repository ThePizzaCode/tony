import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/url.dart';
import '../models/product_model.dart';

class Products with ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> sortedProducts = [];

  bool loading = true;
  String errorMessage = '';

  getProducts(String token) async {
    loading = true;
    notifyListeners();

    final response = await http.get(
      Uri.parse('${AppURL.baseURL}/products?storeID=0'),
      headers: authHeader(token),
    );

    loading = false;
    notifyListeners();

    final body = json.decode(response.body);
    if (response.statusCode == 200) {
      products = [];
      for (int i = 0; i < body.length; i++) {
        products.add(ProductModel.fromJSON(body[i]));
      }
      notifyListeners();
    } else {
      errorMessage = 'eroare';
      notifyListeners();
    }
  }

  sortProductsTag(String tag) {
    List<ProductModel> res = [];
    for (int i = 0; i < products.length; i++) {
      final p = products[i];
      if (p.tags.contains(tag)) {
        res.add(p);
      }
    }
    sortedProducts = res;
    notifyListeners();
  }

  ProductModel getProduct(String id) {
    for (int i = 0; i < products.length; i++) {
      final p = products[i];
      if (p.id == id) {
        return p;
      }
    }
    throw Exception('product not found');
  }
}
