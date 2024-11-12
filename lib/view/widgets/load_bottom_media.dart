import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LoadMediaIcons extends StatelessWidget {
  const LoadMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('images/insta.png'))),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/facebook.png'))),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('images/twitter.png'))),
            ),
            const SizedBox(
              width: 10.0,
            ),
          ],
        )),
      ],
    );
  }
}
