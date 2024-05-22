
import 'package:flutter/cupertino.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key, required this.cards,required this.fraction});
  final List<Widget> cards;
  final double fraction;
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final double carouselItemMargin = 5;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: widget.fraction);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        itemCount: widget.cards.length,
        onPageChanged: (int position) {},
        itemBuilder: (BuildContext context, int position) {
          return imageSlider(position);
        });
  }

  Widget imageSlider(int position) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, widget) {
        return Center(child: widget);
      },
      child: widget.cards[position],
    );
  }
}