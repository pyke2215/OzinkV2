import 'package:flutter/material.dart';
import 'package:fooddelivtute/components/my_quantity_selector.dart';
import 'package:fooddelivtute/models/cart_item.dart';
import 'package:fooddelivtute/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatefulWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  _MyCartTitleState createState() => _MyCartTitleState();
}

class _MyCartTitleState extends State<MyCartTile> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.cartItem.food.price * widget.cartItem.quantity;
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.cartItem.food.imagePath,
                      height: 100,
                      width: 110,
                      fit: BoxFit.fill,
                    ),
                  ),

                  const SizedBox(width: 15),
                  // name and price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // food name
                        Text(
                          widget.cartItem.food.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 1),

                        // food price
                        Text(
                          '\$${totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),

                        const SizedBox(height: 5),
                        // incre or decre quantity
                        QuantitySelector(
                          quantity: widget.cartItem.quantity,
                          food: widget.cartItem.food,
                          onDecrement: () {
                            setState(() {
                              restaurant.removeFromCart(widget.cartItem);
                            });
                          },
                          onIncrement: () {
                            setState(() {
                              restaurant.addToCart(widget.cartItem.food);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
