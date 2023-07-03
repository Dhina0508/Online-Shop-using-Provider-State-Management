import 'package:flutter/material.dart';
import 'package:online_shop/helping_widgets/textstyle.dart';

class StaggerTile extends StatefulWidget {
  StaggerTile(
      {Key? key,
      required this.imageurl,
      required this.name,
      required this.price})
      : super(key: key);
  final String imageurl;
  final String name;
  final String price;

  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.imageurl,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(12),
              height: 90,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: textstyle_ht(20, Colors.black, FontWeight.w700, 1),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.price,
                    style: textstyle_ht(20, Colors.black, FontWeight.w500, 1),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
