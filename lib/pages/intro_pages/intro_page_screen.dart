import 'package:flutter/material.dart';

class IntroPageScreen extends StatelessWidget {
  String myTitle;
  String myContext;
  String imagePath;

  IntroPageScreen({
    super.key,
    required this.myTitle,
    required this.myContext,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Image(
          height: 150,
          width: 150,
          image: AssetImage(imagePath),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          myTitle.toUpperCase(),
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          myContext,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.grey,
            overflow: TextOverflow.ellipsis,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
