import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 15,
                    child: Icon(
                      Icons.person,
                      color: Colors.yellow,
                      size: 30.0,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shop for',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text(
                        'Expecting Due in 16 Days',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          actions: icons
              .asMap()
              .entries
              .map(
                (MapEntry map) => buildIcon(map.key),
          )
              .toList(),
        ),
        body: ListView(
          children: [
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(8),
              child: const Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Select a location to see product availability"),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Image.asset("assets/icons/offer.jpg"),
            Image.asset("assets/icons/banner.png"),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 56,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset(
                        "assets/icons/bus.gif",
                      )),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset(
                        "assets/icons/def_toys.jpg",
                      )),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Image.asset(
                        "assets/icons/appstrip.jpg",
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: Text(
                  "Shop By Category",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
            ),
            GridView.builder(
              padding: EdgeInsets.only(left: 5,right: 2),
              itemCount: 100,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.only(right: 3),
                child: Image.asset("assets/icons/gf06.png",),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
            )
          ],
        ));
  }
}

List<IconData> icons = [
  Icons.search,
  Icons.notifications_none,
  Icons.favorite_border_outlined,
  Icons.add_shopping_cart_outlined
];
Widget buildIcon(int index) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Icon(icons[index], color: Colors.grey, size: 25),
  );
}
