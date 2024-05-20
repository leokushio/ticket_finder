import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_finder/providers/api_provider.dart';
import 'package:ticket_finder/providers/search_provider.dart';
import 'package:ticket_finder/screens/empty_pages/complex_path.dart';
import 'package:ticket_finder/screens/empty_pages/hot_ticket_page.dart';
import 'package:ticket_finder/screens/empty_pages/weekend_page.dart';
import 'package:ticket_finder/screens/home_screen/home_screen.dart';
import 'package:ticket_finder/utils/theme/theme.dart';

void main() {

  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => APIProvider()),
      ChangeNotifierProvider(
        create: (context) => SearchProvider()),
    ],
    child: const MainApp()),
  );
    
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      theme: XAppTheme.darkTheme,
      home: const HomeScreen(),
      routes: {
        '/home_page':(context) => const HomeScreen(),
        '/complex_path_page':(context) => const ComplexPathPage(),
        '/weekend_page':(context) => const WeekendPage(),
        '/hot_ticket_page':(context) => const HotTicketPage(),
      },
    );
  }
}
