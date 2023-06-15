import 'package:flutter/material.dart';
import 'home_screen.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
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
                  Image.asset(
                    "assets/images/firstcry-logo.png",
                    width: 50,
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
              height: 30.0,
              color: Colors.white,
              child: Text(
                "Dresses & Skirts",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              color: Colors.grey[300],
              height: 40,
              padding: EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),
                      Text("Select a location to see product availability"),
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(20, (index) {
                  return GridCard(
                    imageURL: 'https://img.freepik.com/free-photo/blue-t-shirt_125540-727.jpg?w=1480&t=st=1686823333~exp=1686823933~hmac=f7fc6152edd472b4e55f6e1d05dc81ba515df50746946997f9d6c2f9c6a9a222',
                    title: 'Shirt $index',
                    price: 20.00 + index,
                    discountedPrice: 15.00 + index
                  );
                }),
              ),
            ),
          ],
        ));
  }
}


class GridCard extends StatelessWidget {
  final String imageURL;
  final String title;
  final double price;
  final double discountedPrice;

  const GridCard({
    Key? key,
    required this.imageURL,
    required this.title,
    required this.price,
    required this.discountedPrice
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Image.network(imageURL, height: 130,),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.only(left: 8),
            width: double.infinity,
            color: Colors.white70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 12),
                ),
                SizedBox(height: 4.0),
                Text(
                  'Price: \u{20B9} ${price.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Discounted Price: \$${discountedPrice.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
