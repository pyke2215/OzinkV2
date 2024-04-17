import 'package:flutter/material.dart';
import 'package:fooddelivtute/models/food.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.food,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // decrease button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: onDecrement,
              child: Icon(
                Icons.remove,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          // quantity count
          Container(
            decoration: BoxDecoration(
              border: Border(
                left:
                    BorderSide(width: 2.0, color: Colors.white), // border trái
                right:
                    BorderSide(width: 2.0, color: Colors.white), // border phải
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              width: 25,
              child: Center(
                  child: Text(
                quantity.toString(),
              )),
            ),
          ),

          // increase button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: onIncrement,
              child: Icon(
                Icons.add,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
