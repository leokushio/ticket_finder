import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_finder/constants/colors.dart';
import 'package:ticket_finder/constants/image_strings.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/constants/text_strings.dart';
import 'package:ticket_finder/providers/search_provider.dart';

class ItemsGrid extends StatelessWidget {
  const ItemsGrid({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    List gridIcons = [
    Icon(Icons.keyboard_command_key, size: XSizes.xl),
    Icon(Icons.language, size: XSizes.xl),
    Icon(Icons.calendar_month, size: XSizes.xl),
    ImageIcon(Image.asset(XImages.fire).image, size: XSizes.xl),
  ];

    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 20,
        childAspectRatio: 0.8
        ), 
      itemBuilder: (context, index) => GestureDetector(
        onTap: (){
          if(index == 0){
            Navigator.pushNamed(context, '/complex_path_page');
          } else if (index == 1){
            context.read<SearchProvider>().changeWhereTo('Дубай');
            FocusScope.of(context).requestFocus(searchProvider.whereToFocusNode);
          }else if (index == 2){
            Navigator.pushNamed(context, '/weekend_page');
          } else {
            Navigator.pushNamed(context, '/hot_ticket_page');
          }
          
          },
        child: Column(        
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: XColors.gridColors[index],
                borderRadius: BorderRadius.circular(XSizes.radiusSm)
              ),
              child: gridIcons[index],
            ),
            Text(XTexts.gridStrings[index])
          ],
        ),
      )
      );
  }
} 