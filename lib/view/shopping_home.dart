import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/product_cubit/product_cubit.dart';
import 'package:shopping/view/product_grid_item.dart';

import 'add_product.dart';

class ShoppingHome extends StatefulWidget {
  const ShoppingHome({super.key});

  @override
  State<ShoppingHome> createState() => _ShoppingHomeState();
}

class _ShoppingHomeState extends State<ShoppingHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductGridItem(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddProductDialog(context),
        tooltip: 'Add Product',
        backgroundColor: Color.fromARGB(255, 145, 123, 220),
        shape: CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showAddProductDialog(BuildContext context) {
    final productCubit = context.read<ProductCubit>();
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AddProduct(
          onSave: (title, quantity) {
            productCubit.addProduct(title, quantity);
          },
        );
      },
    );
  }
}
