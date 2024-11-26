import 'package:food_order_app/utils/images.dart';

class OnBoard{
  final String image,text1,text2;
  OnBoard({
    required this.image,
    required this.text1,
    required this.text2
  });
}
  List<OnBoard> onboards=[
 OnBoard(
    image:Appimages.onbordimg1,
    text1: 'Grab your\nDelicious food !',
    text2: 'Delivery food in your phone',
  ),
  OnBoard(
    image: Appimages.onbordimg2,
    text1: 'Grab your\nDelicious food !',
    text2: 'Delivery food in your phone',
  ),
  OnBoard(
    image: Appimages.onbordimg3,
    text1: 'Grab your\nDelicious food !',
    text2: 'Delivery food in your phone',
  ),  ];
