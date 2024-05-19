
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {

  TextEditingController whereFromController = TextEditingController();
  TextEditingController whereToController = TextEditingController();

  int subScreenIndex = 0;

  FocusNode whereToFocusNode = FocusNode();

  bool readOnly = true;
  bool autoFocus = false;

  DateTime depatureDate = DateTime.now();
  DateTime? returnDate;

  void focusOn (context) {
    FocusScope.of(context).requestFocus(whereToFocusNode);
  }

  void changeWhereTo (String city) {
    whereToController.text = city;
    notifyListeners();
  }
  void clearWhereTo () {
    whereToController.clear();
    notifyListeners();
  }

  void goToPickCountryScreen () {
    subScreenIndex = 1;
    notifyListeners();
  }
  void goToAllTicketsScreen () {
    subScreenIndex = 2;
    notifyListeners();
  }
  void goToHomeScreen () {
    subScreenIndex = 0;
    notifyListeners();
  }

  void readOnlyFalse () {
    readOnly = false;
    notifyListeners();
  }
  void autoFocusTrue() {
    autoFocus = true;
    notifyListeners();
  }
  void swapDestination() {
    var (a, b) = (whereFromController.text, whereToController.text);
    (a, b) = (b, a);
    whereFromController.text = a;
    whereToController.text = b;
  }
  Future<DateTime?> showDepatureDatePicker(BuildContext context) {
    return showDatePicker(
      context: context, 
      // locale: const Locale('ru'),
      firstDate: DateTime.now(), 
      lastDate: DateTime(2100)
      ).then((value)  {
        depatureDate = value!;
        notifyListeners();
        });
  }
  Future<DateTime?> showReturnDatePicker(BuildContext context) {
    return showDatePicker(
      context: context, 
      firstDate: DateTime.now(), 
      lastDate: DateTime(2100)
      ).then((value)  {
        returnDate = value!;
        notifyListeners();
        });
  }
}