import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_finder/constants/colors.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/providers/api_provider.dart';
import 'package:ticket_finder/providers/search_provider.dart';
import 'package:ticket_finder/screens/common_widgets/ticket_searchbox.dart';
import 'package:ticket_finder/screens/home_screen/widgets/offers_section.dart';
import 'package:ticket_finder/screens/search_screen_bottomsheet/search_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({
    super.key,
   
  });


  @override
  Widget build(BuildContext context) {
    final providerAPI = Provider.of<APIProvider>(context);
    providerAPI.getDataFromAPI();
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    return Column(
      children: [
    
        // -- Heading -- 
        const SizedBox(height: XSizes.spaceBtwSections,),
        Text('Поиск Дешевых', style: Theme.of(context).textTheme.titleLarge,),
        Text('авиабилетов', style: Theme.of(context).textTheme.titleLarge,),
        const SizedBox(height: XSizes.spaceBtwSections,),
        
        // -- Search Box
        Container(
           width: double.infinity,
            padding: const EdgeInsets.all(XSizes.md),
            decoration: BoxDecoration(
              color: XColors.grey3,
              borderRadius: BorderRadius.circular(XSizes.defaultRadius)
            ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(XSizes.defaultRadius),
              boxShadow: const [
                BoxShadow(
                  color: XColors.grey2,
                  offset: Offset(0, 5),
                  blurRadius: 2,
                )
              ]
            ),
            child: TicketSearchBox(
              onTap: () {
                searchScreen(context);
                searchProvider.readOnlyFalse();
                searchProvider.autoFocusTrue();
                // FocusScope.of(context).requestFocus(searchProvider.whereToFocusNode);
                },
              showPrefixIcons: false,
              showSurfixClearIcon: false,
              showLeftSearchIcon: true,
              showSurfixSwapIcon: false,
              showLeftBackButton: false,
              whereToAutoFocus: false,
              whereToReadOnly: false,
              onEditingComplete: true,
            ),
          )
          ),
        const SizedBox(height: XSizes.spaceBtwSections,),
    
        // -- Title
        Container(
          width: double.infinity,
          child: Text('Музыкально отлететь', style: Theme.of(context).textTheme.headlineLarge,)
          ),
        const SizedBox(height: XSizes.defaultSpace,),
    
        // -- Horisontal scrollable ListView
        OffersSection(providerAPI: providerAPI)
    
    
      ],
    );
  }
}