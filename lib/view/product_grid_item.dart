import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/product_cubit/product_cubit.dart';
import 'package:shopping/core/product_cubit/product_state.dart';
import 'package:shopping/view/product_grid_widget.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          if (state.product.isEmpty) {
            return const Center(child: Text("No product added yet."));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 0.85,
            ),
            itemCount: state.product.length,
            itemBuilder: (context, index) {
              return ProductGridWidget(product: state.product[index]);
            },
          );
        }
        return const Center(child: Text("Welcome to Shopping App"));
      },
    );
  }
}
