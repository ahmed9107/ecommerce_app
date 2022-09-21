import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final double currentPage;
  final int dotsNumber;
  const DotsIndicator(
      {Key? key, required this.currentPage, required this.dotsNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          dotsNumber,
          (index) => AnimatedContainer(
            margin: const EdgeInsets.only(right: 5),
            duration: const Duration(milliseconds: 500),
            width: currentPage == index ? 20 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: currentPage == index
                ? Theme.of(context).primaryColor
                : Colors.grey[350],
              borderRadius: BorderRadius.circular(10)),
          ))
      ],
    );
  }
}
