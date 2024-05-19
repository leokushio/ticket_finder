import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ticket_finder/constants/sizes.dart';
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
              labelStyle: Theme.of(context).textTheme.displaySmall,
              label: Text(
                searchProvider.returnDate == null ? 'обратно'
                : DateFormat('dd MMM, EEE', 'ru').format(searchProvider.returnDate!)
                ), 
              avatar: const Icon(Icons.add), 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(width: XSizes.spaceBtwItems * 2,),
    
          GestureDetector(
            onTap: () => context.read<SearchProvider>().showDepatureDatePicker(context),
            child: Chip(
              labelStyle: Theme.of(context).textTheme.displaySmall,
              label: Text(DateFormat('dd MMM, EEE', 'ru').format(searchProvider.depatureDate)), 
              // avatar: Icon(Icons.add), 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(width: XSizes.spaceBtwItems * 2,),
    
          GestureDetector(
            onTap: (){},
            child: Chip(
              labelStyle: Theme.of(context).textTheme.displaySmall,
              label: const Text('1,эконом'), 
              avatar: const Icon(Icons.person), 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(width: XSizes.spaceBtwItems * 2,),
    
          GestureDetector(
            onTap: (){},
            child: Chip(
              label: const Text('обратно'), 
              avatar: const Icon(Icons.tune), 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(width: XSizes.spaceBtwItems * 2,),
        
        ],
      ),
    );
  }
}