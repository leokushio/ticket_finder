import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_finder/constants/colors.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/constants/text_strings.dart';
import 'package:ticket_finder/providers/api_provider.dart';

class AllTicketsList extends StatelessWidget {
  const AllTicketsList({
    super.key,
    required this.providerAPI,
  });

  final APIProvider providerAPI;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: providerAPI.allTicketsModel.tickets.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      
      itemBuilder: (context, val) {
        DateTime depature = providerAPI.allTicketsModel.tickets[val].departure.date;
        DateTime arival = providerAPI.allTicketsModel.tickets[val].arrival.date;
        Duration travelTime = arival.difference(depature);
        String? badge = providerAPI.allTicketsModel.tickets[val].badge;
        bool hasTransfer = providerAPI.allTicketsModel.tickets[val].hasTransfer;
        int price =providerAPI.allTicketsModel.tickets[val].price.value;
    
        return Padding(
          padding: const EdgeInsets.only(bottom: XSizes.defaultSpace),
          child: Badge(
            backgroundColor: XColors.blue,
            textColor: Colors.white,
            largeSize: 24,
            textStyle: Theme.of(context).textTheme.displaySmall,
            label: badge == null ? const Text('') : Text(badge),
            isLabelVisible: badge == null ? false : true,
            // padding: EdgeInsets.all(XSizes.sm),
            offset: const Offset(-330, -10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: XColors.grey1,
                borderRadius: BorderRadius.circular(XSizes.defaultRadius)
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(XSizes.md, XSizes.lg, XSizes.md, XSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      style: Theme.of(context).textTheme.headlineLarge,
                      '${NumberFormat.decimalPatternDigits(decimalDigits: 0).format(price).replaceAll(',', ' ')} ${XTexts.ruble}',
                      ),
                    // const SizedBox(height: XSizes.spaceBtwItems,),
                    ListTile(
                      contentPadding: const EdgeInsets.all(1),
                      leading: const CircleAvatar(backgroundColor: XColors.red, radius: 12,),
                      titleTextStyle: Theme.of(context).textTheme.displaySmall,
                      subtitleTextStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: XColors.grey6),
                      title: Row(
                        children: [
                          Text(DateFormat('hh:mm').format(providerAPI.allTicketsModel.tickets[val].departure.date)),
                          const Text('-'),
                          Text(DateFormat('hh:mm').format(providerAPI.allTicketsModel.tickets[val].arrival.date)),
                          const SizedBox(width: XSizes.spaceBtwItems,),
                          Text('${travelTime.inHours % 24}.${travelTime.inMinutes % 60}ч в пути ${hasTransfer? '/ Без пересадок' : ''}'),                
                        ],                       
                      ),
                      subtitle: Text('${providerAPI.allTicketsModel.tickets[val].departure.airport.name}      ${providerAPI.allTicketsModel.tickets[val].arrival.airport.name}'),
                    )
                  ],
                ),
                ),
            ),
          ),
        );
      }
      );
  }
}