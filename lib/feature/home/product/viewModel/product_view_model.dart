import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/feature/home/product/service/product_service.dart';
import 'package:provider/provider.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductService _productService = ProductService();

  ProductViewModel() {}
}
