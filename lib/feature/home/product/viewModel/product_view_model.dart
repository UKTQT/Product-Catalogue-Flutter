import 'package:flutter/material.dart';

import '../../../../core/base/viewModel/base_view_model.dart';
import '../service/product_service.dart';

class ProductViewModel extends ChangeNotifier with BaseViewModel {
  final ProductService _productService = ProductService();

  ProductViewModel() {}
}
