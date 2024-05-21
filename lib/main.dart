import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OYO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'OYO'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'oyo.png',
          width: 50,
        ),
      ),
      drawer: const Drawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //Search Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(50)),
                child: TextField(
                  cursorHeight: 25,
                  maxLines: null,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10.0),
                    border: InputBorder.none,
                    icon: const Icon(Icons.search),
                    hintText:
                        'Mumbai\n${DateFormat.MMMd().format(DateTime.now())} - ${DateFormat.MMMd().format(DateTime.now().add(const Duration(days: 1)))}',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                      child: Carousel(cards: [FilterCards(), FilterCards(),FilterCards(),FilterCards()])),
                  // OptionCards(
                  //     imgUrl:
                  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH_cdR2kCAXG3fewUIQs3dPaGYAyLzfyEirw&s',
                  //     price: 'OYO FlagShip',
                  //     name: 'OYO Royal Homes',
                  //     location: 'Bannerghatta Road, Bangalore',
                  //     color: Colors.green,
                  //     onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedFontSize: 10,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: 'Free Stays',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_center_outlined),
            label: 'Need Help',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CityCards extends StatelessWidget {
  const CityCards({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
      ),
      child: SizedBox(
        width: 50,
        height: 50,
        child: Image.asset(
          'oyo.png',
        ),
      ),
    );
  }
}

class FilterCards extends StatelessWidget {
  const FilterCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.all(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Sort'),
            IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
          ],
        ),
      ),
    );
  }
}

class OptionCards extends StatelessWidget {
  const OptionCards({
    super.key,
    required this.imgUrl,
    required this.price,
    required this.name,
    required this.location,
    required this.color,
    required this.onTap,
    this.width = 400,
  });

  final String imgUrl;
  final String price;
  final String name;
  final String location;
  final Color color;
  final Function onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                        color: Colors.red),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      imgUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 340,
                    top: 10,
                    child: LikeButton(onPressed: () {}, color: Colors.red),
                  ),
                ],
              ),
              SizedBox(
                  width: width,
                  child: LikeListTile(
                    rating: "3.5",
                    likes: "130",
                    subtitle: " W",
                    color: color,
                  )),
              const SizedBox(
                height: 5,
              ),
              Text(name),
              Text(
                location,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                price,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
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
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      subtitle: Row(
        children: [
          const Icon(Icons.star, color: Colors.red, size: 25),
          const SizedBox(width: 5),
          Text(rating),
          const SizedBox(width: 10),
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
      ),
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
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          isLiked ? Icons.favorite : Icons.favorite_border,
          color: widget.color,
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

class Carousel extends StatefulWidget {
  const Carousel({super.key, required this.cards});
  final List<Widget> cards;
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final double carouselItemMargin = 16;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.3);
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
        return Container(
          // margin: EdgeInsets.all(carouselItemMargin),
          child: Center(child: widget),
        );
      },
      child: widget.cards[position],
    );
  }
}