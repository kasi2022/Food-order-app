import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomIcon{
  final IconData selected,unselected;
  BottomIcon({required this.selected,required this.unselected});
  
}

List<BottomIcon> bottomiconlist=[
  BottomIcon(
    selected: Icons.home_filled,
    unselected: Icons.home_outlined,
  ),
  BottomIcon(
    selected: CupertinoIcons.chat_bubble_text_fill,
    unselected: CupertinoIcons.chat_bubble_text,
  ),
  BottomIcon(
    selected: CupertinoIcons.compass_fill,
    unselected: CupertinoIcons.compass,
  ),
  BottomIcon(
    selected: Icons.person_rounded,
    unselected: Icons.person_outline_rounded,
  ),

];