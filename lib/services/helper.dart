import 'package:flutter/services.dart' as the_bundle;
import 'package:online_shop/model/sneaker_model.dart';

class Helper {
  Future<List<Sneakers>> getMaleSneakers() async {
    final data = await the_bundle.rootBundle.loadString("json/male.json");

    final malelist = sneakersFromJson(data);

    return malelist;
  }

  Future<List<Sneakers>> getFemaleSneakers() async {
    final data = await the_bundle.rootBundle.loadString("json/female.json");

    final femalelist = sneakersFromJson(data);

    return femalelist;
  }

  Future<List<Sneakers>> getKidSneakers() async {
    final data = await the_bundle.rootBundle.loadString("json/kid.json");

    final kidlist = sneakersFromJson(data);

    return kidlist;
  }

//single male
  Future<Sneakers> getMaleSneakersById(String id) async {
    final data = await the_bundle.rootBundle.loadString("json/male.json");

    final malelist = sneakersFromJson(data);

    final sneaker = malelist.firstWhere((Sneakers) => Sneakers.id == id);

    return sneaker;
  }

  Future<Sneakers> getFeamleSneakersById(String id) async {
    final data = await the_bundle.rootBundle.loadString("json/female.json");

    final femalelist = sneakersFromJson(data);

    final sneaker = femalelist.firstWhere((Sneakers) => Sneakers.id == id);

    return sneaker;
  }

  Future<Sneakers> getKidSneakersById(String id) async {
    final data = await the_bundle.rootBundle.loadString("json/kid.json");

    final kidlist = sneakersFromJson(data);

    final sneaker = kidlist.firstWhere((Sneakers) => Sneakers.id == id);

    return sneaker;
  }
}
