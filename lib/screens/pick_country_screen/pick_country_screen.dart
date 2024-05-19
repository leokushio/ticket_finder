
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/constants/text_strings.dart';
import 'package:ticket_finder/providers/search_provider.dart';
import 'package:ticket_finder/screens/common_widgets/ticket_searchbox.dart';
import 'package:ticket_finder/screens/pick_country_screen/widgets/ticket_offers_section.dart';
import 'package:ticket_finder/screens/pick_country_screen/widgets/chips.dart';

class PickCountryScreen extends StatefulWidget {
  const PickCountryScreen({super.key});

  @override
  State<PickCountryScreen> createState() => _PickCountryScreenState();
}

class _PickCountryScreenState extends State<PickCountryScreen> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    return Column(
      children: [
        const SizedBox(height: XSizes.spaceBtwSections *2,),

        // -- Search Box -- 
        TicketSearchBox(
          showPrefixIcons: false, 
          showSurfixClearIcon: true, 
          showLeftSearchIcon: false,
          showSurfixSwapIcon: true,
          showLeftBackButton: true,
          whereToAutoFocus: false,
          whereToReadOnly: true,
          onEditingComplete: false,
          isHomeScreen: false,
        ),
        const SizedBox(height: XSizes.spaceBtwItems *2,),


//----------Chips ----------
        XChips(searchProvider: searchProvider),
        const SizedBox(height: XSizes.spaceBtwItems * 2,),

        // -- List of Flight Companies --
        const TicketOffersSection(),
        const SizedBox(height: XSizes.spaceBtwSections,),

        // -- Button --
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => context.read<SearchProvider>().goToAllTicketsScreen(), 
            child: const Text(XTexts.seeAllTickets)
            ),
        )
      ],
    );
  }


}

