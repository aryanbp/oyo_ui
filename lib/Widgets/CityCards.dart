
import 'package:flutter/material.dart';

class CityCards extends StatelessWidget {
  const CityCards({super.key,required this.name,required this.img});

  final String name;
  final String img;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              // padding: const EdgeInsets.all(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              img,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(name),
        ],
      ),
    );
  }
}