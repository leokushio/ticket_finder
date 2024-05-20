import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ticket_finder/constants/colors.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/constants/text_strings.dart';
import 'package:ticket_finder/providers/search_provider.dart';

class XChips extends StatelessWidget {
  const XChips({
    super.key,
    required this.searchProvider,
  });

  final SearchProvider searchProvider;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: ()=> context.read<SearchProvider>().showReturnDatePicker(context),
            child: Chip(
              side: BorderSide.none,
              backgroundColor: XColors.grey3,
              labelStyle: Theme.of(context).textTheme.displaySmall,
              label: Text(
                searchProvider.returnDate == null ? XTexts.obratno
                : DateFormat('dd MMM, EEE', 'ru').format(searchProvider.returnDate!)
                ), 
              avatar: const Icon(Icons.add, color: XColors.grey6,), 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(width: XSizes.spaceBtwItems * 2,),
    
          GestureDetector(
            onTap: () => context.read<SearchProvider>().showDepatureDatePicker(context),
            child: Chip(
              side: BorderSide.none,
              backgroundColor: XColors.grey3,
              labelStyle: Theme.of(context).textTheme.displaySmall,
              label: Text(DateFormat('dd MMM, EEE', 'ru').format(searchProvider.depatureDate)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(width: XSizes.spaceBtwItems * 2,),
    
          GestureDetector(
            onTap: (){},
            child: Chip(
              side: BorderSide.none,
              backgroundColor: XColors.grey3,
              labelStyle: Theme.of(context).textTheme.displaySmall,
              label: const Text(XTexts.econom), 
              avatar: const Icon(Icons.person, color: XColors.grey6,), 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(width: XSizes.spaceBtwItems * 2,),
    
          GestureDetector(
            onTap: (){},
            child: Chip(
              side: BorderSide.none,
              backgroundColor: XColors.grey3,
              labelStyle: Theme.of(context).textTheme.displaySmall,
              label: const Text(XTexts.filters), 
              avatar: const Icon(Icons.tune, color: XColors.grey6,), 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(width: XSizes.spaceBtwItems * 2,),
        
        ],
      ),
    );
  }
}