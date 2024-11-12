import 'package:flutter/material.dart';

class PageDot extends StatelessWidget {
  const PageDot({
    super.key,
    required int pageIndex,
  }) : _pageIndex = pageIndex;

  final int _pageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: _pageIndex == 0
                ? const Color(0xff11A7A4)
                : const Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: _pageIndex == 1
                ? const Color(0xff11A7A4)
                : const Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        const SizedBox(width: 5),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: _pageIndex == 2
                ? const Color(0xff11A7A4)
                : const Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ],
    );
  }
}
