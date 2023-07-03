import 'package:flutter/material.dart';
import 'package:online_shop/helping_widgets/category_btn.dart';
import 'package:online_shop/helping_widgets/latest_shoes.dart';
import 'package:online_shop/helping_widgets/textstyle.dart';
import 'package:online_shop/model/sneaker_model.dart';
import 'package:online_shop/services/helper.dart';

class ProductByCategory extends StatefulWidget {
  ProductByCategory({Key? key, required this.tabIndex}) : super(key: key);
  final int tabIndex;

  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this, initialIndex: widget.tabIndex);
  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kid;

  void getmale() {
    _male = Helper().getMaleSneakers();
  }

  void getfemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getkid() {
    _kid = Helper().getKidSneakers();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getmale();
    getfemale();
    getkid();
  }

  List<String> brand = [
    "https://w7.pngwing.com/pngs/375/469/png-transparent-adidas-trefoil-adidas-text-photography-logo.png",
    "https://seeklogo.com/images/U/u-s-polo-assn-logo-17BE53CEF1-seeklogo.com.png",
    "https://seeklogo.com/images/S/sparx-logo-B9ECFE3A4B-seeklogo.com.png",
    "https://static.vecteezy.com/system/resources/thumbnails/010/994/412/small/nike-logo-black-with-name-clothes-design-icon-abstract-football-illustration-with-white-background-free-vector.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
                image: DecorationImage(
                    image: AssetImage("images/bg.jpeg"), fit: BoxFit.fill),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: Icon(
                            Icons.filter_alt_rounded,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  TabBar(
                      padding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      //dividerColor: Colors.transparent,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: textstyle(24, Colors.white, FontWeight.bold),
                      unselectedLabelColor: Colors.grey.withOpacity(0.3),
                      tabs: [
                        Tab(
                          text: "Men shoes",
                        ),
                        Tab(
                          text: "Women Shoes",
                        ),
                        Tab(
                          text: "Kids Shoes",
                        )
                      ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.175,
                  left: 16,
                  right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: TabBarView(controller: _tabController, children: [
                  Latest_shoes(
                    male: _male,
                  ),
                  Latest_shoes(male: _female),
                  Latest_shoes(male: _kid)
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 600;
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white54,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.84,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "FILTER",
                          style: textstyle(35, Colors.black, FontWeight.bold),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Gender",
                          style: textstyle(20, Colors.black, FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            CategoryButton(
                              label_name: "Men",
                              buttonclr: Colors.black,
                            ),
                            CategoryButton(
                              label_name: "Women",
                              buttonclr: Colors.grey,
                            ),
                            CategoryButton(
                              label_name: "Kids",
                              buttonclr: Colors.grey,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Category",
                          style: textstyle(20, Colors.black, FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            CategoryButton(
                              label_name: "Shoes",
                              buttonclr: Colors.black,
                            ),
                            CategoryButton(
                              label_name: "Accessories",
                              buttonclr: Colors.grey,
                            ),
                            CategoryButton(
                              label_name: "Sandals",
                              buttonclr: Colors.grey,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Price",
                          style: textstyle(20, Colors.black, FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Slider(
                            value: _value,
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            thumbColor: Colors.black,
                            max: 5000,
                            divisions: 50,
                            label: _value.toString(),
                            secondaryTrackValue: 2000,
                            secondaryActiveColor: Colors.red.shade300,
                            onChanged: (double value) {}),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Brand",
                          style: textstyle(20, Colors.black, FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          height: 80,
                          child: ListView.builder(
                              itemCount: brand.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: Image.network(
                                      brand[index],
                                      height: 70, fit: BoxFit.fill,
                                      width: 80,
                                      // color: Colors.black,
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
