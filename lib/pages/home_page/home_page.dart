import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  int selectedFoodType = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              child: Center(
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(IconlyLight.search, color: Colors.grey)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Icon(IconlyLight.location),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "9 West 46th Street, New York City",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    Container(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          foodType(
                              imagePath: "soda.png",
                              selectedItem: 1,
                              foodType: 'Drinks'),
                          const SizedBox(
                            width: 20,
                          ),
                          foodType(
                              imagePath: "turkey.png",
                              selectedItem: 2,
                              foodType: 'Food'),
                          const SizedBox(
                            width: 20,
                          ),
                          foodType(
                              imagePath: "cupcake.png",
                              selectedItem: 3,
                              foodType: 'Cake'),
                          const SizedBox(
                            width: 20,
                          ),
                          foodType(
                              imagePath: "soda.png",
                              selectedItem: 4,
                              foodType: 'Drinks'),
                          const SizedBox(
                            width: 20,
                          ),
                          foodType(
                              imagePath: "popcorn.png",
                              selectedItem: 5,
                              foodType: 'Snack'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodType({
    required String imagePath,
    required int selectedItem,
    required String foodType,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFoodType = selectedItem;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            //padding: const EdgeInsets.only(right: 15, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selectedFoodType == selectedItem
                  ? Colors.orange
                  : Colors.grey.shade200,
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Image(
                  image: AssetImage('assets/icons/$imagePath'),
                  color: selectedFoodType == selectedItem
                      ? Colors.white
                      : Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            foodType,
            style: const TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
