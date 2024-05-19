// To parse this JSON data, do
//
//     final ticketOfferModel = ticketOfferModelFromJson(jsonString);

import 'dart:convert';

TicketOfferModel ticketOfferModelFromJson(String str) => TicketOfferModel.fromJson(json.decode(str));

String ticketOfferModelToJson(TicketOfferModel data) => json.encode(data.toJson());

class TicketOfferModel {
    List<TicketsOffer> ticketsOffers;

    TicketOfferModel({
        required this.ticketsOffers,
    });

    factory TicketOfferModel.fromJson(Map<String, dynamic> json) => TicketOfferModel(
        ticketsOffers: List<TicketsOffer>.from(json["tickets_offers"].map((x) => TicketsOffer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tickets_offers": List<dynamic>.from(ticketsOffers.map((x) => x.toJson())),
    };
}

class TicketsOffer {
    int id;
    String title;
    List<String> timeRange;
    Price price;

    TicketsOffer({
        required this.id,
        required this.title,
        required this.timeRange,
        required this.price,
    });

    factory TicketsOffer.fromJson(Map<String, dynamic> json) => TicketsOffer(
        id: json["id"],
        title: json["title"],
        timeRange: List<String>.from(json["time_range"].map((x) => x)),
        price: Price.fromJson(json["price"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "time_range": List<dynamic>.from(timeRange.map((x) => x)),
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
