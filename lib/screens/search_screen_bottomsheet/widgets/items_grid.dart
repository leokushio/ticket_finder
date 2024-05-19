import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_finder/constants/colors.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/constants/text_strings.dart';

class ItemsGrid extends StatelessWidget {
  const ItemsGrid({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    List<IconData> gridIcons = [
    Icons.keyboard_command_key,
    Icons.language,
    Icons.calendar_month,
    CupertinoIcons.flame_fill
  ];
    return GridView.builder(
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
      );
  }
} 