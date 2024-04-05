import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#EFB491'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Do not pay for parking, maintenance and gasoline",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "We will pay for you, all expenses related to the car",
              style: TextStyle(
                  fontSize: 18, color: Colors.white.withOpacity(0.9)),
            ),
          ),
          const SizedBox(height: 38,),
          SvgPicture.asset('assets/Img_car3.svg')
        ],
      ),
    );
  }
}
