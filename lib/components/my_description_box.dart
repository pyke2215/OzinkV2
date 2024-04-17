import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    //text style
    var myPrimaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var mySecondaryTextStyle =
    TextStyle(color: Theme.of(context).colorScheme.primary);

    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 25),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "đ1000",
                  style: myPrimaryTextStyle,
                ),
                Text(
                  "Phí ship",
                  style: mySecondaryTextStyle,
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "15-30 phút",
                  style: myPrimaryTextStyle,
                ),
                Text(
                  "Thời gian giao hàng",
                  style: mySecondaryTextStyle,
                ),
              ],
            )
          ],
        )
      )
    );
  }
}
