// To parse this JSON data, do
//
//     final allTicketsModel = allTicketsModelFromJson(jsonString);

import 'dart:convert';

AllTicketsModel allTicketsModelFromJson(String str) => AllTicketsModel.fromJson(json.decode(str));

String allTicketsModelToJson(AllTicketsModel data) => json.encode(data.toJson());

class AllTicketsModel {
    List<Ticket> tickets;

    AllTicketsModel({
        required this.tickets,
    });

    factory AllTicketsModel.fromJson(Map<String, dynamic> json) => AllTicketsModel(
        tickets: List<Ticket>.from(json["tickets"].map((x) => Ticket.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tickets": List<dynamic>.from(tickets.map((x) => x.toJson())),
    };
}

class Ticket {
    int id;
    String? badge;
    Price price;
    String providerName;
    String company;
    Arrival departure;
    Arrival arrival;
    bool hasTransfer;
    bool hasVisaTransfer;
    Luggage luggage;
    HandLuggage handLuggage;
    bool isReturnable;
    bool isExchangable;

    Ticket({
        required this.id,
        this.badge,
        required this.price,
        required this.providerName,
        required this.company,
        required this.departure,
        required this.arrival,
        required this.hasTransfer,
        required this.hasVisaTransfer,
        required this.luggage,
        required this.handLuggage,
        required this.isReturnable,
        required this.isExchangable,
    });

    factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        id: json["id"],
        badge: json["badge"],
        price: Price.fromJson(json["price"]),
        providerName: json["provider_name"],
        company: json["company"],
        departure: Arrival.fromJson(json["departure"]),
        arrival: Arrival.fromJson(json["arrival"]),
        hasTransfer: json["has_transfer"],
        hasVisaTransfer: json["has_visa_transfer"],
        luggage: Luggage.fromJson(json["luggage"]),
        handLuggage: HandLuggage.fromJson(json["hand_luggage"]),
        isReturnable: json["is_returnable"],
        isExchangable: json["is_exchangable"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "badge": badge,
        "price": price.toJson(),
        "provider_name": providerName,
        "company": company,
        "departure": departure.toJson(),
        "arrival": arrival.toJson(),
        "has_transfer": hasTransfer,
        "has_visa_transfer": hasVisaTransfer,
        "luggage": luggage.toJson(),
        "hand_luggage": handLuggage.toJson(),
        "is_returnable": isReturnable,
        "is_exchangable": isExchangable,
    };
}

class Arrival {
    Town town;
    DateTime date;
    Airport airport;

    Arrival({
        required this.town,
        required this.date,
        required this.airport,
    });

    factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        town: townValues.map[json["town"]]!,
        date: DateTime.parse(json["date"]),
        airport: airportValues.map[json["airport"]]!,
    );

    Map<String, dynamic> toJson() => {
        "town": townValues.reverse[town],
        "date": date.toIso8601String(),
        "airport": airportValues.reverse[airport],
    };
}

enum Airport {
    AER,
    VKO
}

final airportValues = EnumValues({
    "AER": Airport.AER,
    "VKO": Airport.VKO
});

enum Town {
    EMPTY,
    TOWN
}

final townValues = EnumValues({
    "Сочи": Town.EMPTY,
    "Москва": Town.TOWN
});

class HandLuggage {
    bool hasHandLuggage;
    String? size;

    HandLuggage({
        required this.hasHandLuggage,
        this.size,
    });

    factory HandLuggage.fromJson(Map<String, dynamic> json) => HandLuggage(
        hasHandLuggage: json["has_hand_luggage"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "has_hand_luggage": hasHandLuggage,
        "size": size,
    };
}

class Luggage {
    bool hasLuggage;
    Price? price;

    Luggage({
        required this.hasLuggage,
        this.price,
    });

    factory Luggage.fromJson(Map<String, dynamic> json) => Luggage(
        hasLuggage: json["has_luggage"],
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
    );

    Map<String, dynamic> toJson() => {
        "has_luggage": hasLuggage,
        "price": price?.toJson(),
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
