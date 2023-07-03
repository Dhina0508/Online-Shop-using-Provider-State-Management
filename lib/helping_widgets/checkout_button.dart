import 'package:flutter/material.dart';
import 'package:online_shop/helping_widgets/textstyle.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
    this.ontap,
    required this.label,
  });
  final void Function()? ontap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.black,
          ),
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Center(
            child: Text(
              label,
              style: textstyle(20, Colors.white, FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
