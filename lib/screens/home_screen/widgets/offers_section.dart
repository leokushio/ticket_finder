import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_finder/constants/image_strings.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/constants/text_strings.dart';
import 'package:ticket_finder/providers/api_provider.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({
    super.key,
    required this.providerAPI,
  });

  final APIProvider providerAPI;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: providerAPI.offersModel.offers.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, val) {
          int price =providerAPI.offersModel.offers[val].price.value;

          return Padding(
            padding: const EdgeInsets.only(right: XSizes.lg,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140, width: 140, 
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(XImages.offersImages[val]),
                      fit: BoxFit.cover
                      ),
                    // color: Colors.amber,
                    borderRadius: BorderRadius.circular(XSizes.defaultRadius)
                  ),
                  ),
                const SizedBox(height: XSizes.spaceBtwItems,),
                Text(providerAPI.offersModel.offers[val].title, style: Theme.of(context).textTheme.titleMedium,),
                const SizedBox(height: XSizes.spaceBtwItems,),
                Text(providerAPI.offersModel.offers[val].town),
                const SizedBox(height: XSizes.spaceBtwItems,),
                Row(
                  children: [
                    ImageIcon(Image.asset(XImages.plane).image),
                    // Text(price.length > 3? ' ${price[0]} ${price.substring(1)} ${XTexts.ruble}'),
                    Text('${NumberFormat.decimalPatternDigits(decimalDigits: 0).format(price).replaceAll(',', ' ')} ${XTexts.ruble}')
                  ],
                ),
    
                
               
              ],
            ),
          );
        }
        ),
    );
  }
}