import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_finder/constants/colors.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/providers/search_provider.dart';

class TopNavBox extends StatelessWidget {
  const TopNavBox({
    super.key,
    required this.searchProvider,
  });

  final SearchProvider searchProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: XColors.grey1),
      child: Padding(
        padding: const EdgeInsets.all(XSizes.sm),
        child: ListTile(
          titleTextStyle: Theme.of(context).textTheme.titleMedium,
          subtitleTextStyle: Theme.of(context).textTheme.displayMedium,
          leading: IconButton(onPressed: ()=> searchProvider.goToPickCountryScreen(), icon: Icon(Icons.arrow_back)),
          title: Text('${searchProvider.whereFromController.text}-${searchProvider.whereToController.text}'),
          subtitle: Text('${DateFormat('dd MMM', 'ru').format(searchProvider.depatureDate)}, 1 пассажир'),
        ),
      ),
    );
  }
}