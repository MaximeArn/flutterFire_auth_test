import 'package:flutter/material.dart';

class CookingAppBar extends StatelessWidget with PreferredSizeWidget{
  const CookingAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: RichText(
          text: TextSpan(
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: "Coo", style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                TextSpan(
                    text: "K",
                    style: TextStyle(color: Theme.of(context).primaryColor),),
                TextSpan(text: "ing", style: TextStyle(color: Theme.of(context).colorScheme.primary)),
              ]),
        ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
