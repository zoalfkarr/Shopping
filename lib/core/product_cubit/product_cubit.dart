import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/database/database_helper.dart';
import 'package:shopping/core/model/product_model.dart';
import 'package:shopping/core/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  ProductCubit() : super(ProductInitial()) {
    fetchProduct();
  }

  void fetchProduct() async {
    try {
      emit(ProductLoading());
      final product = await _dbHelper.getProduct();
      emit(ProductLoaded(product));
    } catch (e) {
      emit(ProductError("Failed to fetch Product."));
    }
  }

  void addProduct(String title, String quantity) async {
    try {
      final newProduct = Product(title: title, quantity: quantity);
      await _dbHelper.insertProduct(newProduct);
      fetchProduct();
    } catch (e) {
      emit(ProductError("Failed to add product."));
    }
  }

  void deleteProduct(int id) async {
    try {
      await _dbHelper.deleteProduct(id);
      fetchProduct();
    } catch (e) {
      emit(ProductError("Failed to delete product."));
    }
  }
}
