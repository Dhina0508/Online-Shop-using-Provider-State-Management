import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive/hive.dart';
import 'package:ionicons/ionicons.dart';
import 'package:online_shop/helping_widgets/checkout_button.dart';
import 'package:online_shop/helping_widgets/textstyle.dart';
import 'package:online_shop/model/sneaker_model.dart';
import 'package:online_shop/provider/product_provider.dart';
import 'package:online_shop/screens.dart/cart_screen.dart';
import 'package:online_shop/services/helper.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key, required this.id, required this.category})
      : super(key: key);
  final String id;
  final String category;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getshoe();
  }

  final _cartBox = Hive.box('cart_box');
  final PageController pageController = PageController();
  late Future<Sneakers> _sneakers;
  void getshoe() {
    if (widget.category == "Men's Running") {
      _sneakers = Helper().getMaleSneakersById(widget.id);
    } else if (widget.category == "Women's Running") {
      _sneakers = Helper().getFeamleSneakersById(widget.id);
    } else {
      _sneakers = Helper().getKidSneakersById(widget.id);
    }
  }

  Future<void> _createCart(Map<String, dynamic> newCart) async {
    await _cartBox.add(newCart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Sneakers>(
          future: _sneakers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error ${snapshot.error}");
            } else {
              final sneaker = snapshot.data;

              return Consumer<Product_Notifier>(
                  builder: (context, product_Notifier, child) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      leadingWidth: 0,
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                product_Notifier.shoeSizes.clear();
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                            GestureDetector(
                              onTap: null,
                              child: Icon(
                                Ionicons.ellipsis_horizontal,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      pinned: true,
                      floating: true,
                      backgroundColor: Colors.transparent,
                      expandedHeight: MediaQuery.of(context).size.height,
                      flexibleSpace: FlexibleSpaceBar(
                          background: Stack(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width,
                              child: PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: sneaker!.imageUrl.length,
                                  controller: pageController,
                                  onPageChanged: (page) {
                                    product_Notifier.activePage = page;
                                  },
                                  itemBuilder: (context, int index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.39,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          // color: Colors.grey.shade300,
                                          child: Image.network(
                                            sneaker.imageUrl[index],
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Positioned(
                                          child: Icon(
                                            Icons.favorite_outline,
                                            color: Colors.grey,
                                          ),
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.12,
                                          right: 20,
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            right: 0,
                                            left: 0,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.3,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: List<Widget>.generate(
                                                  sneaker.imageUrl.length,
                                                  (index) => Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal: 4,
                                                        ),
                                                        child: CircleAvatar(
                                                          radius: 4,
                                                          backgroundColor:
                                                              product_Notifier.activepage !=
                                                                      index
                                                                  ? Colors.grey
                                                                      .shade400
                                                                  : Colors
                                                                      .black,
                                                        ),
                                                      )),
                                            )),
                                      ],
                                    );
                                  })),
                          Positioned(
                              bottom: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.645,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          sneaker.name,
                                          style: textstyle(30, Colors.black,
                                              FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              sneaker.category,
                                              style: textstyle(15, Colors.grey,
                                                  FontWeight.w500),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            RatingBar.builder(
                                              initialRating: 4,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 22,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 1.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 18,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Rs: " + sneaker.price,
                                              style: textstyle(24, Colors.black,
                                                  FontWeight.w700),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Colors",
                                                  style: textstyle(
                                                      15,
                                                      Colors.black,
                                                      FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                CircleAvatar(
                                                  radius: 6,
                                                  backgroundColor: Colors.grey,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                CircleAvatar(
                                                  radius: 6,
                                                  backgroundColor: Colors.red,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Select sizes",
                                                  style: textstyle(
                                                      15,
                                                      Colors.black,
                                                      FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "View size guide",
                                                  style: textstyle(
                                                      15,
                                                      Colors.grey,
                                                      FontWeight.w500),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              height: 40,
                                              child: ListView.builder(
                                                  itemCount: product_Notifier
                                                      .shoeSizes.length,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  padding: EdgeInsets.zero,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final sizes =
                                                        product_Notifier
                                                            .shoeSizes[index];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8),
                                                      child: ChoiceChip(
                                                        checkmarkColor:
                                                            Colors.transparent,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        60)),
                                                        side: BorderSide(
                                                            color: Colors.black,
                                                            width: 1,
                                                            style: BorderStyle
                                                                .solid),
                                                        disabledColor:
                                                            Colors.white,
                                                        selectedColor:
                                                            Colors.black,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 8),
                                                        label: Text(
                                                          sizes['size'],
                                                          style: textstyle(
                                                              15,
                                                              sizes['isSelected']
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black,
                                                              FontWeight.w500),
                                                        ),
                                                        selected:
                                                            sizes['isSelected'],
                                                        onSelected: (newstate) {
                                                          if (product_Notifier
                                                              .sizes
                                                              .contains(sizes[
                                                                  'size'])) {
                                                            product_Notifier
                                                                .sizes
                                                                .remove(sizes[
                                                                    'size']);
                                                          } else {
                                                            product_Notifier
                                                                .sizes
                                                                .add(sizes[
                                                                    'size']);
                                                          }
                                                          print(product_Notifier
                                                              .sizes);
                                                          setState(() {
                                                            product_Notifier
                                                                .toggleCheck(
                                                                    index);
                                                          });
                                                        },
                                                      ),
                                                    );
                                                  }),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Divider(
                                          color: Colors.black,
                                          indent: 10,
                                          endIndent: 10,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          child: Text(
                                            sneaker.title,
                                            style: textstyle(21, Colors.black,
                                                FontWeight.w700),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          sneaker.description,
                                          textAlign: TextAlign.justify,
                                          maxLines: 4,
                                          style: textstyle(13, Colors.grey,
                                              FontWeight.normal),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 12),
                                            child: CheckoutButton(
                                              label: "Add to Cart",
                                              ontap: () async {
                                                _createCart({
                                                  "id": sneaker.id,
                                                  "name": sneaker.name,
                                                  "category": sneaker.category,
                                                  "imageUrl":
                                                      sneaker.imageUrl[0],
                                                  "price": sneaker.price,
                                                  "sizes":
                                                      product_Notifier.sizes,
                                                  "qty": 1
                                                });
                                                product_Notifier.sizes.clear();
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Cart_Screen()));
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      )),
                      snap: false,
                    )
                  ],
                );
              });
            }
          }),
    );
  }
}
