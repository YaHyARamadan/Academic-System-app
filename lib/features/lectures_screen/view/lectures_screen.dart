import 'package:flutter/material.dart';

import '../../../core/widgets/custom_scaffold.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScaffold(
      title: 'Test',
      headerText: "sd",
      bodyWidgets: [
        Container(
          color: Colors.red,
      ),

    ]
    );
  }
}
