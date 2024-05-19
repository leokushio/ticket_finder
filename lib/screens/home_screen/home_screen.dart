import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:ticket_finder/constants/colors.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/models/api/offers_model.dart';
import 'package:ticket_finder/providers/api_provider.dart';
import 'package:ticket_finder/providers/search_provider.dart';
import 'package:ticket_finder/screens/home_screen/initial_screen.dart';
import 'package:ticket_finder/screens/pick_country_screen/pick_country_screen.dart';
import 'package:ticket_finder/screens/home_screen/widgets/offers_section.dart';
import 'package:ticket_finder/screens/common_widgets/ticket_searchbox.dart';
import 'package:ticket_finder/screens/search_screen_bottomsheet/search_screen.dart';
import 'package:ticket_finder/screens/see_all_tickets_screen/see_all_tickets_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subScreens = [
      const InitialScreen(),
      const PickCountryScreen(),
      const SeeAllTicketsScreen(),
    ];

    final searchProvider = Provider.of<SearchProvider>(context);
    

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: XSizes.lg, right: XSizes.lg),
          child: subScreens[searchProvider.subScreenIndex],
        ),
      ),

      /*-----------------Bottom Navigation Bar ---------------------*/

      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey[50],
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.airplane), label: 'АвиаБилеты'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bed_double_fill), label: 'Отели'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.location_solid), label: 'Короче'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bell_fill), label: 'Подписки'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_fill), label: 'Профиль'),
        ]
        ),
        
    );
  }

  
  
}







