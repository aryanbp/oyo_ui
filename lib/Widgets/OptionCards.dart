
import 'package:flutter/material.dart';

class OptionCards extends StatelessWidget {
  const OptionCards({
    super.key,
    required this.imgUrl,
    required this.cprice,
    required this.oprice,
    required this.discount,
    required this.name,
    required this.location,
    required this.color,
    required this.rating,
    required this.like,
    required this.subtitle,
    required this.sponsor,
    required this.onTap,
    this.width = 200,
  });

  final String imgUrl;
  final String cprice;
  final String oprice;
  final String discount;
  final String name;
  final String location;
  final Color color;
  final String rating;
  final String like;
  final String subtitle;
  final String sponsor;
  final Function onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              onTap();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: width,
                      height: 150,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.red),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                      left: 160,
                      child: LikeButton(onPressed: () {}, color: Colors.red),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                SizedBox(
                    width: width,
                    child: LikeListTile(
                      rating: rating,
                      likes: like,
                      subtitle: sponsor,
                      color: color,
                    )),
                Text(name),
                Text(
                  location,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      '₹'+cprice+" ",
                      style:
                      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      oprice+" ",
                      style:
                      const TextStyle(fontSize: 10, decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      discount +"% OFF",
                      style:
                      const TextStyle(fontSize: 10, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LikeListTile extends StatelessWidget {
  const LikeListTile(
      {super.key,
        required this.rating,
        required this.likes,
        required this.subtitle,
        this.color = Colors.grey});
  final String rating;
  final String likes;
  final String subtitle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          const Icon(Icons.star, color: Colors.red, size: 15),
          const SizedBox(width: 5),
          Text(rating),
          const SizedBox(width: 5),
          Text('($likes)'),
          Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(width: 4, height: 4),
              )),
          Text(subtitle)
        ],
      );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton(
      {super.key, required this.onPressed, this.color = Colors.black12});
  final Function onPressed;
  final Color color;
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          isLiked ? Icons.favorite : Icons.favorite_border,
          color: widget.color,
          size: 15,
        ),
        onPressed: () {
          setState(() {
            isLiked = !isLiked;
          });
          widget.onPressed();
        },
      ),
    );
  }
}