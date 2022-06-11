import 'package:flutter/material.dart';
import 'package:product_catalogue_flutter/feature/home/product/service/product_service.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/viewModel/base_view_model.dart';

class ProductViewModel extends ChangeNotifier with BaseViewModel {
  final ProductService _productService = ProductService();

  ProductViewModel() {}
}
