
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityCards extends StatelessWidget {
  const CityCards({super.key,required this.name,required this.img});

  final String name;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:20.0),
      child: SizedBox(
        height: 100,
        width: 65,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: EdgeInsets.zero,
                elevation: 0,
                // padding: const EdgeInsets.all(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                img,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(name,style: const TextStyle(fontSize: 12),),
          ],
        ),
      ),
    );
  }
}