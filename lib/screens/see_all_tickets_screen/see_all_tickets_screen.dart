import 'package:flutter/material.dart';
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
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - kBottomNavigationBarHeight -  130,
              child: AllTicketsList(providerAPI: providerAPI)
              ),

            Positioned(
              bottom: 10,
              // right: MediaQuery.of(context).size.width /2,
              child: SegmentedButton(
                style: const ButtonStyle(
                  backgroundColor:MaterialStatePropertyAll(XColors.blue),
                  ),
                segments: [
                  ButtonSegment(value: 'Фильтр', icon: const Icon(Icons.tune, color: Colors.white,), label: Text('Фильтр', style: Theme.of(context).textTheme.labelLarge,) ),
                  ButtonSegment(value: 'График цен', icon: const Icon(Icons.bar_chart, color: Colors.white,),label: Text('График цен', style: Theme.of(context).textTheme.labelLarge,) ),
                ], 
                selected: const {'1'}
              ),
            ),
          ],
        ),     
      ],
    );
  }
}




