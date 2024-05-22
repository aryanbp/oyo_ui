
import 'package:flutter/material.dart';

class FilterCards extends StatelessWidget {
  const FilterCards({super.key,required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          textStyle: TextStyle(fontSize: 12),
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(name),
            const Icon(Icons.arrow_downward,size: 12,),
          ],
        ),
      ),
    );
  }
}