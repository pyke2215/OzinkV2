// import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivtute/models/cart_item.dart';
import 'package:fooddelivtute/models/food.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class Restaurant extends ChangeNotifier {
  // user cart
  final List<CartItem> _cart = [];

  // địa chỉ giao hàng
  String _deliveryAddress = "Cao Đẳng Viễn Đông";

  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*

  O P E R A T I O N S

   */

  // add to cart
  void addToCart(Food food) {
    // see if there is a cart item alredy with the same food
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food is the same
      bool isSameFood = item.food == food;

      return isSameFood;
    });

    // if item alrey exist, increase quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(food: food),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // update địa chỉ giao hàng
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*

  H E L P E R S

   */

  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Đây là hóa đơn của bạn:");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln("--------------------");
    receipt.writeln();

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${formatPrice(cartItem.food.price)}");
      receipt.writeln();
    }

    receipt.writeln("--------------------");
    receipt.writeln();
    receipt.writeln("Tổng món: ${getTotalItemCount()}");
    receipt.writeln("Tổng giá: ${formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Giao hàng tới: $deliveryAddress");

    return receipt.toString();
  }

  // format double value into money
  String formatPrice(double price) {
    return '${price.toStringAsFixed(0)} VND';
  }
}
