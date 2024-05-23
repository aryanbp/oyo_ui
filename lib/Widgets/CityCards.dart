
import 'package:flutter/material.dart';

class CityCards extends StatelessWidget {
  const CityCards({super.key,required this.name,required this.img});

  final String name;
  final String img;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 110,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              elevation: 0,
              // padding: const EdgeInsets.all(10),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              img,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(name,style: const TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}