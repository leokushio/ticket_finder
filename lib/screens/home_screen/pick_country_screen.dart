
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/providers/search_provider.dart';
import 'package:ticket_finder/screens/common_widgets/ticket_searchbox.dart';
import 'package:ticket_finder/screens/home_screen/widgets/ticket_offers_section.dart';

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
        const SizedBox(height: XSizes.spaceBtwSections,),

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
        ),
        const SizedBox(height: XSizes.spaceBtwItems *2,),


//----------Chips ----------
        SingleChildScrollView(
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
        ),
        const SizedBox(height: XSizes.spaceBtwItems * 2,),

        // -- List of Flight Companies --
        const TicketOffersSection(),
        const SizedBox(height: XSizes.spaceBtwSections,),

        // -- Button --
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: (){}, 
            child: Text('Посмотреть все билеты')
            ),
        )
      ],
    );
  }


}