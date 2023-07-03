import 'package:flutter/material.dart';
import 'package:online_shop/helping_widgets/stagger_tile.dart';
import 'package:online_shop/model/sneaker_model.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class Latest_shoes extends StatelessWidget {
  const Latest_shoes({
    super.key,
    required Future<List<Sneakers>> male,
  }) : _male = male;

  final Future<List<Sneakers>> _male;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
        future: _male,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          } else {
            final male = snapshot.data;
            return StaggeredGridView.countBuilder(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 16,
                staggeredTileBuilder: (index) => StaggeredTile.extent(
                    (index % 2 == 0) ? 1 : 1,
                    (index % 4 == 1 || index % 4 == 3)
                        ? MediaQuery.of(context).size.height * 0.36
                        : MediaQuery.of(context).size.height * 0.32),
                itemCount: male!.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final shoe = snapshot.data![index];
                  return StaggerTile(
                      imageurl: shoe.imageUrl[0],
                      name: shoe.name,
                      price: "Rs: " + shoe.price);
                });
          }
        });
  }
}
