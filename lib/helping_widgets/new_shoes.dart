import 'package:flutter/material.dart';

class newshoes extends StatelessWidget {
  const newshoes({
    super.key,
    required this.imageurl,
  });
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.white,
                spreadRadius: 1,
                blurRadius: 0.8,
                offset: Offset(0, 1))
          ],
          borderRadius: BorderRadius.all(Radius.circular(16))),
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.28,
      // child: CachedNetworkImage(
      //     imageUrl:
      //         "https://5.imimg.com/data5/IA/KI/MY-69143008/sm323-9-sparx-white-original-imaezvxwmp6qz6tg.jpeg"),
      child: Image.network(
        imageurl,
        // "https://5.imimg.com/data5/IA/KI/MY-69143008/sm323-9-sparx-white-original-imaezvxwmp6qz6tg.jpeg",
        fit: BoxFit.cover,
      ),
    );
  }
}
