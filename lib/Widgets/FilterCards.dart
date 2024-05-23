
import 'package:flutter/material.dart';

class FilterCards extends StatelessWidget {
  const FilterCards({super.key,required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(

          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: const StadiumBorder(),
          textStyle: const TextStyle(fontSize: 13),
          // padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            const Icon(Icons.keyboard_arrow_down_outlined,),
          ],
        ),
      ),
    );
  }
}