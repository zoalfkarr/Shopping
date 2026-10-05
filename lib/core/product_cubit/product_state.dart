import 'package:shopping/core/model/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> product;
  ProductLoaded(this.product);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
