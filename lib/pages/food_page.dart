import 'package:flutter/material.dart';
import 'package:fooddelivtute/components/my_button.dart';
import 'package:fooddelivtute/models/food.dart';
import 'package:fooddelivtute/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage({
    super.key,
    required this.food,
  });

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // method to add to cart
  void addToCart(Food food) {
    // Close the current food page to go back to menu
    Navigator.pop(context);
    // Add to cart
    context.read<Restaurant>().addToCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // scaffold
        Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      // food image
                      ClipRRect(
                        child: Container(
                          height: 260,
                          width: 300,
                          child: Image.network(
                            widget.food.imagePath,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // food name
                            Text(
                              widget.food.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),

                            // food price
                            Text(
                              '\$${widget.food.price}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),

                            const SizedBox(height: 10),

                            // food description
                            Text(widget.food.description),

                            const SizedBox(height: 10),

                            Divider(
                                color: Theme.of(context).colorScheme.secondary),

                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // nút thêm vào giỏ hàng
                MyButton(
                  onTap: () => addToCart(widget.food),
                  text: "Thêm vào giỏ hàng",
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        // nút back
        // back button
        SafeArea(
          child: Opacity(
            opacity: 0.8,
            child: Container(
              margin: const EdgeInsets.only(left: 15, top: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ), // BoxDecoration
              child: IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
