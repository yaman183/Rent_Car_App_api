import 'package:flutter_riverpod/legacy.dart';
import '../models/cart_item_model.dart';
import '../models/product_model.dart';

class CartNotifier extends StateNotifier<List<CartItemModel>> {
  CartNotifier() : super([]);

  void addItem(ProductModel product) {
    final existingIndex = state.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (existingIndex != -1) {
      increaseQuantity(product.id);
    } else {
      state = [
        ...state,
        CartItemModel(product: product, quantity: 1),
      ];
    }
  }

  void removeItem(int productId) {
    state = state.where((item) => item.product.id != productId).toList();
  }

  void increaseQuantity(int productId) {
    state = [
      for (final item in state)
        if (item.product.id == productId)
          item.copyWith(quantity: item.quantity + 1)
        else
          item,
    ];
  }

  void decreaseQuantity(int productId) {
    state = [
      for (final item in state)
        if (item.product.id == productId)
          if (item.quantity > 1)
            item.copyWith(quantity: item.quantity - 1)
          else
            item
        else
          item,
    ];
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, List<CartItemModel>>((ref) {
  return CartNotifier();
});