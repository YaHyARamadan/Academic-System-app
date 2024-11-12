import 'package:flutter/material.dart';
import '../style/my_text_style.dart';

class CustomTextForm extends StatefulWidget {
  final String title;
  final String? hint;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;
  final int? maxNum;
  const CustomTextForm(
      {super.key,
        required this.title,
        this.textEditingController,
        required this.textInputType,
        this.maxNum, this.hint});

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode idFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              widget.title,
              style: MyTextStyle.konkhmer40Size400Weight.copyWith(fontSize: 14)
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            focusNode: FocusNode(),
            controller: widget.textEditingController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Empty Valid';
              }
              return null;
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText:  widget.hint  ?? 'Enter Your ${widget.title} Here',
                hintStyle: MyTextStyle.konkhmer40Size400Weight.copyWith(fontSize: 14),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: Color(0xff11A7A4)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                border:  const OutlineInputBorder(
                  borderSide: BorderSide(width: 1,color: Color(0xff11A7A4)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                focusedBorder:  const OutlineInputBorder(
                  borderSide: BorderSide(width: 2,color: Color(0xff11A7A4)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                )
            ),
            keyboardType: widget.textInputType,
            maxLength: widget.maxNum,
          ),
        ],
      ),
    );
  }
}
