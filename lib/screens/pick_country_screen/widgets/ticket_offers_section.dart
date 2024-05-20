
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ticket_finder/constants/colors.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/constants/text_strings.dart';
import 'package:ticket_finder/providers/api_provider.dart';

class TicketOffersSection extends StatelessWidget {
  const TicketOffersSection ({super.key});

  @override
  Widget build(BuildContext context) {
    final APIProvider providerAPI = Provider.of<APIProvider>(context);
    providerAPI.getTicketOffersDataFromAPI();
    // String subtitle = Theme.of(context).textTheme.displaySmall,
    return Container(
      // height: 500,
      decoration: BoxDecoration(
        color: XColors.grey1,
        borderRadius: BorderRadius.circular(XSizes.defaultRadius)
      ),
      child: Padding( 
        padding: const EdgeInsets.all(XSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(XTexts.directFlights, style: Theme.of(context).textTheme.titleLarge,),

            ListView.builder(
              itemCount: providerAPI.ticketOfferModel.ticketsOffers.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(2),
              itemBuilder: (context, val) {
                String subtitle = providerAPI.ticketOfferModel.ticketsOffers[val].timeRange
                        .toString().replaceAll('[', '').replaceAll(']', '').replaceAll(',', ' ');
                int price = providerAPI.ticketOfferModel.ticketsOffers[val].price.value;
                String title = providerAPI.ticketOfferModel.ticketsOffers[val].title;
                        
                return Column(
                children: [
                  ListTile(
                    onTap: () {},
                    dense: true,
                    contentPadding: const EdgeInsets.all(1),
                    leading: CircleAvatar(backgroundColor: val == 0 ? XColors.red : val==1 ? XColors.blue : Colors.white),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title, style: Theme.of(context).textTheme.displaySmall,),
                        Row(
                          children: [
                            Text(
                              '${NumberFormat.decimalPatternDigits(decimalDigits: 0).format(price).replaceAll(',', ' ')} ${XTexts.ruble}', 
                              style: Theme.of(context).textTheme.displaySmall!.copyWith(color: XColors.blue),),
                            const Icon(CupertinoIcons.right_chevron, size: XSizes.md, color: XColors.blue,)
                          ],
                        ),
                      ],
                    ),
                    subtitle: Text(
                      subtitle.length > 25 ? subtitle.replaceRange(40, subtitle.length, '...')
                      : subtitle, 
                        style: Theme.of(context).textTheme.displaySmall,),
                  ),
                  const Divider(thickness: 1, color: Colors.grey,),
                ],
              );
              }
              ),

          ],
        ),
        ),
    );
  }
}