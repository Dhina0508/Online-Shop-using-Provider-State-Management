import 'package:flutter/material.dart';
import 'package:online_shop/helping_widgets/new_shoes.dart';
import 'package:online_shop/provider/product_provider.dart';
import 'package:online_shop/screens.dart/sub%20screens/product_by_catelogry.dart';
import 'package:online_shop/helping_widgets/product_card.dart';
import 'package:online_shop/helping_widgets/textstyle.dart';
import 'package:online_shop/model/sneaker_model.dart';
import 'package:online_shop/screens.dart/sub%20screens/product_full_page.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Sneakers>> male,
    required this.tabindex,
  }) : _male = male;

  final Future<List<Sneakers>> _male;
  final int tabindex;

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<Product_Notifier>(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.405,
          child: FutureBuilder<List<Sneakers>>(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                } else {
                  final male = snapshot.data;
                  return ListView.builder(
                      itemCount: male!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final shoe = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            productNotifier.shoeSizes = shoe.sizes;
                            print(productNotifier.shoeSizes);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                        id: shoe.id, category: shoe.category)));
                          },
                          child: ProductCard(
                              price: "Rs: " + shoe.price,
                              category: shoe.category,
                              id: shoe.id,
                              name: shoe.name,
                              image: shoe.imageUrl[0]),
                        );
                        // image:
                        //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcc0c9M7LnEEmgPX2U7x1Wu-YwA10Gq3nQtw&usqp=CAU");
                      });
                }
              }),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Shoes",
                    style: textstyle(24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductByCategory(
                                    tabIndex: tabindex,
                                  )));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Show All",
                          style: textstyle(15, Colors.black, FontWeight.normal),
                        ),
                        Icon(
                          Icons.arrow_right,
                          size: 25,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: FutureBuilder<List<Sneakers>>(
              future: _male,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                } else {
                  final male = snapshot.data;
                  return ListView.builder(
                      itemCount: male!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final shoe = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: newshoes(imageurl: shoe.imageUrl[1]),
                        );
                      });
                }
              }),
        )
      ],
    );
  }
}
