import 'package:flutter/material.dart';

class PageViewSlide extends StatelessWidget {
  const PageViewSlide({
    super.key,
 required this.imgPath,
  });
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.4,
      decoration:  BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Image.asset(
          imgPath,
          scale: 0.74),
    );
  }
}