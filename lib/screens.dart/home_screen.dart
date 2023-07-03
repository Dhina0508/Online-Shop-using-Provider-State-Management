import 'package:flutter/material.dart';
import 'package:online_shop/helping_widgets/main_widgets.dart';
import 'package:online_shop/helping_widgets/textstyle.dart';
import 'package:online_shop/model/sneaker_model.dart';
import 'package:online_shop/services/helper.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
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
              child: Container(
                padding: EdgeInsets.only(left: 8, bottom: 15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Athletics Shoes",
                      style:
                          textstyle_ht(35, Colors.white, FontWeight.bold, 1.5),
                    ),
                    Text("Collection",
                        style: textstyle_ht(
                            35, Colors.white, FontWeight.bold, 1.2)),
                    SizedBox(
                      height: 20,
                    ),
                    TabBar(
                        padding: EdgeInsets.zero,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        controller: _tabController,
                        //dividerColor: Colors.transparent,
                        isScrollable: true,
                        labelColor: Colors.white,
                        labelStyle:
                            textstyle(24, Colors.white, FontWeight.bold),
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
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25),
              child: Container(
                padding: EdgeInsets.only(left: 12),
                child: TabBarView(controller: _tabController, children: [
                  HomeWidget(male: _male, tabindex: 0),
                  HomeWidget(male: _female, tabindex: 1),
                  HomeWidget(
                    male: _kid,
                    tabindex: 2,
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
