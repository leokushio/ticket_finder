
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/providers/search_provider.dart';
import 'package:ticket_finder/screens/common_widgets/ticket_searchbox.dart';
import 'package:ticket_finder/screens/search_screen_bottomsheet/widgets/items_grid.dart';
import 'package:ticket_finder/screens/search_screen_bottomsheet/widgets/recomended_locations_box.dart';

Future<dynamic> searchScreen(BuildContext context) {

  final searchProvider = Provider.of<SearchProvider>(context, listen: false);

    return showModalBottomSheet( 
      context: context, 
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Padding(
          padding: const EdgeInsets.only(left: XSizes.lg, right: XSizes.lg),
          child: Column(
            children: [
              TicketSearchBox(
                showPrefixIcons: true, 
                showSurfixClearIcon: true, 
                showLeftSearchIcon: false,
                showSurfixSwapIcon: false, 
                showLeftBackButton: false,
                whereToAutoFocus: false,
                whereToReadOnly: false,
                onEditingComplete: true,
                isHomeScreen: false,
                ),          
              const SizedBox(height: XSizes.spaceBtwSections,),

              // -- GRID VIEW --
              const ItemsGrid(),
              const SizedBox(height: XSizes.spaceBtwSections,),

              // -- LIST OF RECOMENDED LOCATIONS --
              RecomendedLocationsBox(searchProvider: searchProvider)

            ],
          ),
        ),
        ),
        
      );
  }



