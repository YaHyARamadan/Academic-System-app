import 'package:flutter/material.dart';
import 'package:gradu/core/style/my_text_style.dart';
import 'custom_text.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.bodyWidgets,
    required this.title,
    this.headerText,
    this.floatingActionButton,
  });

  final List<Widget> bodyWidgets;
  final Widget? floatingActionButton;
  final String title;
  final String? headerText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton ?? null,
      appBar: AppBar(
        title: CustomText(
          text: title,
          style: MyTextStyle.nunito24size800weight
              .copyWith(fontSize: 30, color: Colors.white),
        ),
        flexibleSpace: Container(
          alignment: Alignment.bottomLeft,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff54BCC7), Color(0xff00A287)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        actions: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(90)),
              gradient: LinearGradient(
                colors: [Color(0xff54BCC7), Color(0xff00A287)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomText(
                    text: headerText ?? 'Default Header',  // Use a default value if null
                    style: MyTextStyle.nunito24size800weight.copyWith(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomText(
                      text: "INFORMATION TECHNOLOGY",
                      style: MyTextStyle.kanit24Size400Weight
                          .copyWith(color: Colors.white)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: Column(
              children: [
                ...bodyWidgets, const SizedBox(height: 10)],
            ),
          ),
        ],
      ),
    );
  }
}