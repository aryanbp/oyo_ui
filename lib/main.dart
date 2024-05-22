import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Widgets/Carousel.dart';
import 'Widgets/CityCards.dart';
import 'Widgets/FilterCards.dart';
import 'Widgets/OptionCards.dart';

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
          'assets/oyo.png',
          width: 50,
        ),
      ),
      drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Search Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(50)),
              child: TextField(
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
             //City Box
             const SizedBox(
               width: double.infinity,
               height: 85,
               child:Carousel(fraction: 0.3,cards: [CityCards(name: 'Nearby', img: 'https://static.thenounproject.com/png/1054386-200.png',),CityCards(name: 'Mumbai',img: 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSOaOZNTf_nNNs2L3E5kXBQVhpKm60j9AGCE0HPYJFq0qPoqWPY',),CityCards(name: 'All cities', img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXMW2QRWgOfPNEIYNGEyUFNp8kNA5I-jEikw&s')]),
             ),
             //Filter Box
             SizedBox(
               width: double.infinity,
               height: 80,
                 child: Row(
                   children: [
                     const SizedBox(height:80,width:290,child: Carousel(fraction: 0.3,cards: [FilterCards(name:'Sort'), FilterCards(name: 'Locality'),FilterCards(name: 'Price'),FilterCards(name: 'Trending',), FilterCards(name: 'Categories')])),
                     IconButton(onPressed: (){}, icon: const Icon(Icons.control_camera))
                   ],
                 )),
             const Text('Handpicked for you',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            const SizedBox(
              height: 10,
            ),
            //Option Box
            SizedBox(
               width: double.infinity,
               height: 300,
               child: Carousel(fraction:0.5,cards:[
                 OptionCards(
                   imgUrl:
                   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH_cdR2kCAXG3fewUIQs3dPaGYAyLzfyEirw&s',
                   cprice: '573',
                   oprice:'2950',
                   discount:'75',
                   name: 'OYO Royal Homes',
                   location: 'Bannerghatta Road, Bangalore',
                   color: Colors.green,
                   onTap: () {print('tabbed/');}),
               ]
               ),
             ),
          ],
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
//
// class CardFb1 extends StatelessWidget {
//   final Widget item;
//
//   const CardFb1({required this.item, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Import the NFT Hero for animations
//         // Navigator.push(
//         //     context, MaterialPageRoute(builder: (_) => NftHero(item: item)));
//       },
//       child: Container(
//         width: MediaQuery.of(context).size.width / 1,
//         padding: const EdgeInsets.all(20.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5.0),
//           border: Border.all(color: Colors.grey),
//           boxShadow: [
//             BoxShadow(
//                 offset: const Offset(10, 20),
//                 blurRadius: 10,
//                 spreadRadius: 0,
//                 color: Colors.grey.withOpacity(.05)),
//           ],
//         ),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   item.name,
//                   style: const TextStyle(color: Colors.white),
//                 ),
//                 Text(
//                   item.username,
//                   style: const TextStyle(color: Colors.grey),
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             Hero(
//               tag: item.imgUrl,
//               child: Image.network(
//                 item.imgUrl,
//                 fit: BoxFit.cover,
//                 height: MediaQuery.of(context).size.height / 3.75,
//               ),
//             ),
//             const SizedBox(
//               height: 25.0,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   item.time,
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   item.price,
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold),
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: const [
//                 Text(
//                   "Remaining Time",
//                   style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w300),
//                 ),
//                 Text(
//                   "Highest Bid",
//                   style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w300),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }