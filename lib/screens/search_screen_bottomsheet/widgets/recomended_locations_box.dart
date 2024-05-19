import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_finder/constants/colors.dart';
import 'package:ticket_finder/constants/image_strings.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/constants/text_strings.dart';
import 'package:ticket_finder/models/recomended_cities_model.dart';
import 'package:ticket_finder/providers/search_provider.dart';

class RecomendedLocationsBox extends StatelessWidget {
  const RecomendedLocationsBox({
    super.key,
    required this.searchProvider,
  });
  final SearchProvider searchProvider;

  @override
  Widget build(BuildContext context) {
    List<RecomendedCities> recomendedCities = [
    RecomendedCities(city: XTexts.istanbul, description: XTexts.recomendedCitiesDescription, image: XImages.istanbul),
    RecomendedCities(city: XTexts.sochi, description: XTexts.recomendedCitiesDescription, image: XImages.sochi),
    RecomendedCities(city: XTexts.phuket, description: XTexts.recomendedCitiesDescription, image: XImages.phuket),

  ];
    return Container(
      decoration: BoxDecoration(
        color: XColors.grey3,
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
                contentPadding: const EdgeInsets.all(1),
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
    );
  }
}