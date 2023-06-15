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
          actions: _icons
              .asMap()
              .entries
              .map(
                (MapEntry map) => _buildIcon(map.key),
              )
              .toList(),
        ),
        body: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                  ),
                  Text("Select a location to see product availability")
                ],
              ),
            ),
          ],
        ));
  }
}

List<IconData> _icons = [
  Icons.search,
  Icons.notifications_none,
  Icons.favorite_border_outlined,
  Icons.add_shopping_cart_outlined
];
Widget _buildIcon(int index) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Icon(_icons[index], color: Colors.grey, size: 25),
  );
}
