

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ticket_finder/models/api/offers_model.dart';
import 'package:http/http.dart' as http;
import 'package:ticket_finder/models/api/ticket_offers_model.dart';

class APIProvider extends ChangeNotifier{

  static const offersURL =
    'https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd';

  static const ticketOffersURL =
    'https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017';

  bool isLoadingOffers = true;
  bool isLoadingTicketOffers = true;
  String error = '';
  OffersModel offersModel = OffersModel(offers: []);
  TicketOfferModel ticketOfferModel = TicketOfferModel(ticketsOffers: []);

  getDataFromAPI() async{
    try {
      Response response = await http.get(Uri.parse(offersURL));
      if (response.statusCode == 200) {
        offersModel = offersModelFromJson(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
       error = e.toString();
    }
    isLoadingOffers = false;
    notifyListeners();
  }
  getTicketOffersDataFromAPI() async{
    try {
      Response response = await http.get(Uri.parse(ticketOffersURL));
      if (response.statusCode == 200) {
        ticketOfferModel = ticketOfferModelFromJson(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
       error = e.toString();
    }
    isLoadingTicketOffers = false;
    notifyListeners();
  }
}