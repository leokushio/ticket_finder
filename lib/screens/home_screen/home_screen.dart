import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ticket_finder/constants/image_strings.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/custom_icons_icons.dart';
import 'package:ticket_finder/providers/search_provider.dart';
import 'package:ticket_finder/screens/empty_pages/discover_page.dart';
import 'package:ticket_finder/screens/empty_pages/hotels_page.dart';
import 'package:ticket_finder/screens/empty_pages/profile_page.dart';
import 'package:ticket_finder/screens/empty_pages/subscriptions.dart';
import 'package:ticket_finder/screens/home_screen/initial_screen.dart';
import 'package:ticket_finder/screens/pick_country_screen/pick_country_screen.dart';
import 'package:ticket_finder/screens/see_all_tickets_screen/see_all_tickets_screen.dart';
import 'package:ticket_finder/x_custom_icons_icons.dart';

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
    searchProvider.initializePrefs();

    final pages = [
      subScreens[searchProvider.subScreenIndex],
      const HotelPage(),
      const DiscoverPage(),
      const Subscriptions(),
      const ProfilePage(),
    ];

    return Scaffold(
      // -- MAIN SCREEN --
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: XSizes.lg, right: XSizes.lg),
          child: pages[searchProvider.currentPageIndex]
        ),
      ),

      /*-----------------Bottom Navigation Bar ---------------------*/

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: searchProvider.currentPageIndex,
        onTap: (value) => searchProvider.changePage(value),
        unselectedItemColor: Colors.grey[50],
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(XCustomIcons.plane_nav, size: XSizes.lg,), label: 'АвиаБилеты'),
          BottomNavigationBarItem(icon: Icon(XCustomIcons.hotel_nav, size: XSizes.lg,), label: 'Отели'),
          BottomNavigationBarItem(icon: Icon(XCustomIcons.discover, size: XSizes.lg,), label: 'Короче'),
          BottomNavigationBarItem(icon: Icon(XCustomIcons.bell_nav, size: XSizes.lg,), label: 'Подписки'),
          BottomNavigationBarItem(icon: Icon(XCustomIcons.profile, size: XSizes.lg,), label: 'Профиль'),
        ]
        ),

        
    );
  }

  
  
}







