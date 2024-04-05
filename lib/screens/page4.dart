import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#95B6FF'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "29 car models: from Skoda Octavia to Porsche 911",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Choose between regular car models or exclusive ones",
              style: TextStyle(
                  fontSize: 18, color: Colors.white.withOpacity(0.9)),
            ),
          ),
          const SizedBox(height: 38,),
          SvgPicture.asset('assets/Img_car4.svg')
        ],
      ),
    );
  }
}
