import 'package:flutter/material.dart';
import 'package:oyo_ui/Widgets/Carousel.dart';

import 'OptionCards.dart';

class MoreInfoPage extends StatelessWidget {
  const MoreInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.red),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH_cdR2kCAXG3fewUIQs3dPaGYAyLzfyEirw&s',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                left: 20,
                top: 30,
                child: ActionButton(
                    icon: Icons.close, color: Colors.black, action: () {Navigator.pop(context);}),
              ),
              Positioned(
                left: 260,
                top: 30,
                child: ActionButton(
                    icon: Icons.favorite_border,
                    color: Colors.black,
                    action: () {}),
              ),
              Positioned(
                left: 300,
                top: 30,
                child: ActionButton(
                    icon: Icons.file_upload_outlined,
                    color: Colors.black,
                    action: () {}),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: SizedBox(
                height: 80,
                child: Carousel(
                    cards: [OverviewCards(), OverviewCards(), OverviewCards()],
                    )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'Mid Range',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox( height: 10,),
                const Text(
                  'OYO Flagship 2807 Shree Stays',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 10,),
                const LikeListTile(
                                  rating: "3.5",
                                  likes: "130",
                                  subtitle: " 96 reviews",
                                  color: Colors.red,
                                ),
                const Text(
                    '4.0 . Check-in rating > Stationary experience'), //Review
                Divider(
                  height: 30,
                  color: Colors.grey.shade200,
                ),
                const Text(
                    '9/1, Arek er Road, Next to Rns Motors, Bannerghatta Road, Bangalore'), //Full location
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View on Map',
                      style: TextStyle(color: Colors.blue),
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Why book this OYO?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: const Text('W'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                        height: 100,
                        child: Column(
                          children: [
                            const Text('Wizard discount available'),
                            Text(
                              'Upto 10% extra discount for Wizard members',
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 10),
                            ),
                          ],
                        ),),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
      bottomSheet: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      '₹573 ',
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '2890',
                      style:
                      const TextStyle(fontSize: 12, decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
                Text(
                  '+₹182 taxes & fees',
                  style:
                  TextStyle(fontSize: 12,color: Colors.blue),
                ),
              ],
            ),
            FilledButton(
              onPressed: () {},
              style:
                  FilledButton.styleFrom(backgroundColor: Colors.red.shade800),
              child: const Text('Book now & pay at hotel',style: TextStyle(fontSize: 12),),
            )
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key,
      required this.color,
      required this.icon,
      required this.action});

  final Color color;
  final IconData icon;
  final Function action;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: color,
          size: 20,
        ),
        onPressed: () {
          action();
        },
      ),
    );
  }
}

class OverviewCards extends StatelessWidget {
  const OverviewCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              shape: BoxShape.rectangle,
              color: Colors.black,
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH_cdR2kCAXG3fewUIQs3dPaGYAyLzfyEirw&s',
              fit: BoxFit.fitWidth,
            ),
          ),
          const Positioned(
            top: 35,
            left: 15,
            child: Text(
              'Reception',
              style: TextStyle(color: Colors.white, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
