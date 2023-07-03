// import 'dart:convert';

// List<Sneakers> sneakersFromJson(String str) =>
//     List<Sneakers>.from(json.decode(str).map((x) => Sneakers.fromJson(x)));

// class Sneakers {
//   final String id;
//   final String name;
//   final String category;
//   final String imageUrl;
//   final String oldPrice;
//   final String price;

//   Sneakers({
//     required this.id,
//     required this.name,
//     required this.category,
//     required this.imageUrl,
//     required this.oldPrice,
//     required this.price,
//   });

//   factory Sneakers.fromJson(Map<String, dynamic> json) => Sneakers(
//         id: json["id"],
//         name: json["name"],
//         category: json["category"],
//         imageUrl: json["imageUrl"],
//         oldPrice: json["oldPrice"],
//         price: json["price"],
//       );
// }

import 'dart:convert';

List<Sneakers> sneakersFromJson(String str) =>
    List<Sneakers>.from(json.decode(str).map((x) => Sneakers.fromJson(x)));

class Sneakers {
  final String id;
  final String name;
  final String category;
  final List<String> imageUrl;
  final String oldPrice;
  final List<dynamic> sizes;
  final String price;
  final String description;
  final String title;

  Sneakers({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.oldPrice,
    required this.sizes,
    required this.price,
    required this.description,
    required this.title,
  });

  factory Sneakers.fromJson(Map<String, dynamic> json) => Sneakers(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        oldPrice: json["oldPrice"],
        sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
        price: json["price"],
        description: json["description"],
        title: json["title"],
      );
}

//json file
//  [{
//      "id": "0",
//      "name": "NexMart - Sneakers",
//      "category": "NOP",
//      "imageUrl": "https://m.media-amazon.com/images/I/81S-ekaE+vS._AC_UL320_.jpg",
//      "oldPrice": "1899",
//      "price": "799"
//    },
//    {
//      "id": "1",
//      "name": "Asian - Men Bouncer",
//      "category": "Men",
//      "oldPrice": "999",
//      "imageUrl": "https://m.media-amazon.com/images/I/61hMQOHmEIL._AC_UL320_.jpg",
//      "price": "719"
//    },
//    {
//      "id": "2",
//      "name": "Indain Sport Sparx",
//      "category": "Men",
//      "imageUrl": "https://m.media-amazon.com/images/I/81b9Eh286BL._AC_UL320_.jpg",
//      "oldPrice": "1349",
//      "price": "944"
//    },
//    {
//      "id": "3",
//      "name": "Ethics Bounce",
//      "category": "Men",
//      "imageUrl": "https://m.media-amazon.com/images/I/61U-R3-znNL._AC_UL320_.jpg",
//      "oldPrice": "999",
//      "price": "469"
//    },
//    {
//      "id": "4",
//      "name": "Sparx Elite",
//      "category": "men",
//      "imageUrl": "https://m.media-amazon.com/images/I/81Ud8DjRbXL._AC_UL320_.jpg",
//      "oldPrice": "849",
//      "price": "760"
//    },
//    {
//      "id": "5",
//      "name": "Asian Smart Sneaker",
//      "category": "Men",
//      "imageUrl": "https://m.media-amazon.com/images/I/71M5-l4H-aL._AC_UL320_.jpg",
//      "oldPrice": "599",
//      "price": "449"
//    },
//    {
//      "id": "6",
//      "name": "Reebok Bezz",
//      "category": "Men",
//      "imageUrl": "https://m.media-amazon.com/images/I/71OEHq3M-9L._AC_UL320_.jpg",
//      "oldPrice": "2799",
//      "price": "1196"
//    },
//    {
//      "id": "7",
//      "name": "Sparx- Sneakers",
//      "category": "Men",
//      "imageUrl": "https://m.media-amazon.com/images/I/81iRr9yEzxL._AC_UL320_.jpg",
//      "oldPrice": "1049",
//      "price": "890"
//    },
//    {
//      "id": "8",
//      "name": "Reebok Sneakers",
//      "category": "Men",
//      "imageUrl": "https://m.media-amazon.com/images/I/81iqNypAS-L._AC_UL320_.jpg",
//      "oldPrice": "3699",
//      "price": "999"
//    },
//    {
//      "id": "9",
//      "name": "Paragon Sneakers",
//      "category": "Men",
//      "imageUrl": "https://m.media-amazon.com/images/I/61Uu4ZpqCDL._AC_UL320_.jpg",
//      "oldPrice": "1499",
//      "price": "719"
//    }
//  ]