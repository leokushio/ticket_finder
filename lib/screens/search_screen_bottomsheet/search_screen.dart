import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_finder/constants/colors.dart';
import 'package:ticket_finder/constants/image_strings.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/constants/text_strings.dart';
import 'package:ticket_finder/models/recomended_cities_model.dart';
import 'package:ticket_finder/providers/search_provider.dart';
import 'package:ticket_finder/screens/common_widgets/ticket_searchbox.dart';

Future<dynamic> searchScreen(BuildContext context) {
  List<IconData> gridIcons = [
    Icons.keyboard_command_key,
    Icons.language,
    Icons.calendar_month,
    CupertinoIcons.flame_fill
  ];
  List<RecomendedCities> recomendedCities = [
    RecomendedCities(city: XTexts.istanbul, description: XTexts.recomendedCitiesDescription, image: XImages.istanbul),
    RecomendedCities(city: XTexts.sochi, description: XTexts.recomendedCitiesDescription, image: XImages.sochi),
    RecomendedCities(city: XTexts.phuket, description: XTexts.recomendedCitiesDescription, image: XImages.phuket),

  ];
  final searchProvider = Provider.of<SearchProvider>(context, listen: false);
  
  
    return showModalBottomSheet(
      
      context: context, 
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      // isDismissible: false,
      // enableDrag: false,
      builder: (context) => Container(
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
                ),          
              const SizedBox(height: XSizes.spaceBtwSections,),

              // -- GRID VIEW --
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.8
                  ), 
                itemBuilder: (context, index) => Column(
                  
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: XColors.gridColors[index],
                        borderRadius: BorderRadius.circular(XSizes.radiusSm)
                      ),
                      child: Icon(gridIcons[index], size: XSizes.xl,),
                    ),
                    Text(XTexts.gridStrings[index])
                  ],
                )
                ),
              const SizedBox(height: XSizes.spaceBtwSections,),

              // -- LIST OF RECOMENDED LOCATIONS --
              Container(
                decoration: BoxDecoration(
                  color: XColors.grey4,
                  borderRadius: BorderRadius.circular(XSizes.defaultRadius)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(XSizes.md),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: recomendedCities.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ListTile(
                          onTap: () 
                            {
                              context.read<SearchProvider>().changeWhereTo(recomendedCities[index].city);
                              FocusScope.of(context).requestFocus(searchProvider.whereToFocusNode);
                            },
                          dense: true,
                          contentPadding: EdgeInsets.all(1),
                          leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(XSizes.radiusSm),
                              image: DecorationImage(image: Image.asset(recomendedCities[index].image).image, fit: BoxFit.cover)
                            ),
                            // child: Image.asset(XImages.da)
                            ),
                          title: Text(recomendedCities[index].city, style: Theme.of(context).textTheme.labelLarge,),
                          subtitle: Text(recomendedCities[index].description, style: Theme.of(context).textTheme.labelMedium,),
                        ),
                        const Divider(thickness: 1, color: Colors.grey,),
                      ],
                    )
                    ),
                ),
              )

            ],
          ),
        ),
        ),
        
      );
  } 