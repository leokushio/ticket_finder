// To parse this JSON data, do
//
//     final offersModel = offersModelFromJson(jsonString);

import 'dart:convert';

OffersModel offersModelFromJson(String str) => OffersModel.fromJson(json.decode(str));

String offersModelToJson(OffersModel data) => json.encode(data.toJson());

class OffersModel {
    List<Offer> offers;

    OffersModel({
        required this.offers,
    });

    factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
    };
}

class Offer {
    int id;
    String title;
    String town;
    Price price;

    Offer({
        required this.id,
        required this.title,
        required this.town,
        required this.price,
    });

    factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        title: json["title"],
        town: json["town"],
        price: Price.fromJson(json["price"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "town": town,
        "price": price.toJson(),
    };
}

class Price {
    int value;

    Price({
        required this.value,
    });

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
    };
}