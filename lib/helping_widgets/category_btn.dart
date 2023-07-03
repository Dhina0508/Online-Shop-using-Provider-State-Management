import 'package:flutter/material.dart';
import 'package:online_shop/helping_widgets/textstyle.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {Key? key,
      this.onpress,
      required this.buttonclr,
      required this.label_name})
      : super(key: key);
  final void Function()? onpress;
  final Color buttonclr;
  final String label_name;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpress,
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.24,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: buttonclr, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(9))),
        child: Center(
          child: Text(
            label_name,
            style: textstyle(14, buttonclr, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
