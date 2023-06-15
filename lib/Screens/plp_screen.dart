import 'package:flutter/material.dart';
import 'home_screen.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({Key? key}) : super(key: key);

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
                  Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Shop for',
                    style: TextStyle(color: Colors.black, fontSize: 12),
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
