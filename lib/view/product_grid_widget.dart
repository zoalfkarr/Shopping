import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/model/product_model.dart';
import 'package:shopping/core/product_cubit/product_cubit.dart';

class ProductGridWidget extends StatelessWidget {
  const new({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.quantity,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 4,
            left: 120,
            child: IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.black),
              onPressed: () {
                _showActionDeleteDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showActionDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text('Do you want to delete?'), SizedBox(width: 5)],
          ),
          content: const Text(
            'Are you sure you want to delete this Product?',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 15),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                context.read<ProductCubit>().deleteProduct(product.id!);
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Deleted successfully.',
                      textAlign: TextAlign.right,
                      // style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
              child: const Text('Delete', style: TextStyle(fontSize: 16)),
            ),
          ],
        );
      },
    );
  }
}
