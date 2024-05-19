
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ticket_finder/constants/colors.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/providers/api_provider.dart';
import 'package:ticket_finder/providers/search_provider.dart';
import 'package:ticket_finder/screens/see_all_tickets_screen/widgets/all_tickets_list.dart';
import 'package:ticket_finder/screens/see_all_tickets_screen/widgets/top_nav_box.dart';

class SeeAllTicketsScreen extends StatelessWidget {
  const SeeAllTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    final providerAPI = Provider.of<APIProvider>(context);
    providerAPI.getAllTicketsDataFromAPI();

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: XSizes.spaceBtwSections,),

        // -- TOP NAVIGATION BOX --
        TopNavBox(searchProvider: searchProvider),
        
        // -- ALL TICKETS LIST --
        AllTicketsList(providerAPI: providerAPI)
      ],
    );
  }
}



