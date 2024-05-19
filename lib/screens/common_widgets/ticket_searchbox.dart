import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket_finder/constants/colors.dart';
import 'package:ticket_finder/constants/sizes.dart';
import 'package:ticket_finder/constants/text_strings.dart';
import 'package:ticket_finder/providers/search_provider.dart';

class TicketSearchBox extends StatelessWidget {
  TicketSearchBox({
    super.key,
    this.onTap,
    required this.onEditingComplete,
    required this.showPrefixIcons,
    required this.showSurfixClearIcon,
    required this.showSurfixSwapIcon,
    required this.showLeftSearchIcon,
    required this.showLeftBackButton,
    required this.whereToAutoFocus,
    required this.whereToReadOnly,
    required this.isHomeScreen,
  });
   void Function()? onTap = (){};
   final bool onEditingComplete;
   final bool showPrefixIcons;
   final bool showSurfixClearIcon;
   final bool showSurfixSwapIcon;
   final bool showLeftSearchIcon;
   final bool showLeftBackButton;
   final bool whereToAutoFocus;
   final bool whereToReadOnly;
   final bool isHomeScreen;

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    final bool readOnly = Provider.of<SearchProvider>(context).readOnly;
    final bool autoFocus = Provider.of<SearchProvider>(context).autoFocus;

    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.all(XSizes.md),
      decoration: BoxDecoration(
        color: isHomeScreen ? XColors.grey4 : XColors.grey3,
        borderRadius: BorderRadius.circular(XSizes.defaultRadius),
    ),
    child: Row(
      children: [

        // -- Left ICON Button -- Search
        if(showLeftSearchIcon)
        const Padding(
          padding: EdgeInsets.only(right: XSizes.md),
          child: Icon(CupertinoIcons.search),
        ),
        // -- back
        if(showLeftBackButton)
        Padding(
          padding: const EdgeInsets.only(right: XSizes.md),
          child: IconButton(
            onPressed: ()=> searchProvider.goToHomeScreen(),
            icon: const Icon(CupertinoIcons.arrow_left)
            ),
        ),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- Where From ----------------------------------------
              TextFormField(   
                controller: searchProvider.whereFromController, 
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  final RegExp russian = RegExp(r'^[\u0400-\u04FF]+');
                  if (russian.hasMatch(value!) || searchProvider.whereFromController.text.isEmpty ){
                    return null;
                  } else {
                    return 'По Русский';
                  }
                },
                onChanged: (String whereFrom) => searchProvider.saveToPrefs(whereFrom),             
                style: Theme.of(context).textTheme.titleMedium,
                decoration: InputDecoration(
                  prefixIcon: showPrefixIcons ? const Padding(
                    padding: EdgeInsets.only(bottom: 10, right: 25),
                    child: Icon(CupertinoIcons.airplane),
                  ) : null,
                  prefixIconConstraints: BoxConstraints.tight(const Size(30, 15)),
                  isDense: true,
                  hintText: XTexts.whereFromHint,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(5),
                   suffixIcon: showSurfixSwapIcon ? IconButton(
                    onPressed: () => context.read<SearchProvider>().swapDestination(), 
                    icon: const Icon(Icons.swap_vert),
                  
                    )
                    : null,
                    suffixIconConstraints: BoxConstraints.tight(const Size(30, 25)),          
                ),
              ),          
              
              const Divider(thickness: 1, color: XColors.grey6,),

              // -- Where To ----------------------------
              TextFormField(
                autofocus: autoFocus,
                readOnly: readOnly,
                focusNode: searchProvider.whereToFocusNode,
                
                onTap: onTap, 
                onEditingComplete: () {
                  if(onEditingComplete) {
                    context.read<SearchProvider>().goToPickCountryScreen();
                    Navigator.pop(context);
                  }
                  
                  
                },
                controller: searchProvider.whereToController,
                                
                style: Theme.of(context).textTheme.titleMedium,
                decoration: InputDecoration(
                 prefixIcon: showPrefixIcons ? const Padding(
                    padding: EdgeInsets.only(bottom: 10, right: 25),
                    child: Icon(CupertinoIcons.search),
                  ) : null,
                  prefixIconConstraints: BoxConstraints.tight(const Size(30, 15)),
                  isDense: true,
                  hintText: XTexts.whereToHint,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(5),
                  suffixIcon: showSurfixClearIcon ? IconButton(
                    onPressed: () => context.read<SearchProvider>().clearWhereTo(), 
                    icon: const Icon(Icons.clear),
                  
                    )
                    : null,
                    suffixIconConstraints: BoxConstraints.tight(const Size(30, 25)),
                  
                ),
              ),
            ],
          ),
        )
      ],
    ),
    );
  }
}