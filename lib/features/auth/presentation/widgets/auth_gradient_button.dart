
import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';



class AuthGradientButton extends StatelessWidget {
  final String buttonText;



  const AuthGradientButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        gradient: LinearGradient(colors: [
          AppColor.gradient1,
          AppColor.gradient2


        ], begin: Alignment.bottomLeft, end:  Alignment.topRight)
      ),


      child: ElevatedButton(


        onPressed: (){}, child:
      Text(buttonText, style:  TextStyle(fontWeight:  FontWeight.w600, fontSize: 17),),

        style: ElevatedButton.styleFrom(fixedSize: Size(395, 55), backgroundColor: AppColor.transparentColor,
        shadowColor: AppColor.transparentColor),



      ),

    );
  }
}
