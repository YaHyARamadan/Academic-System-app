import 'package:flutter/material.dart';
import 'package:gradu/core/style/my_text_style.dart';
import 'package:gradu/core/widgets/pdf_viewer.dart';
import 'custom_text.dart';

class CustomCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final String? pdfPath;
  final String? titleAppbar;
  final GestureTapCallback? onTap;

  final double scale;

  const CustomCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.scale,
    this.pdfPath,
    this.titleAppbar,  this.onTap,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: const Color(0xffC7C9C9),
        child: ListTile(
          onTap: widget.onTap,
          trailing: CustomText(
            text: widget.title,
            style: MyTextStyle.nunito24size800weight,
          ),
          title: Container(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              widget.imagePath,
              scale: widget.scale,
            ),
          ),
        ),
      ),
    );
  }
}
