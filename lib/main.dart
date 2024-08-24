import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.33, // Display three items at a time
    );

    // Set up the timer for auto-sliding
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.menu),
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  // Add navigation drawer here
                },
              ),
              Image.asset(
                'assets/ss.png', // Replace with your logo asset
                height: 100, // Adjust logo size
                width: 100,
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                    iconSize: 20,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    color: Colors.white,
                    iconSize: 20,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    color: Colors.white,
                    iconSize: 20,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Centered Best Seller Title
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'BEST SELLER',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 150, // Adjust the height as needed
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 3, // Display three best sellers
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                            ),
                            child: Image.asset(
                              'assets/jersey${index + 1}.png', // Replace with your image assets
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text('Best Seller ${index + 1}'),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Main Jersey Images
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(), // Disable grid scrolling
                  itemCount: 7, // Total number of jerseys
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two jerseys per row
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75, // Adjusts the height/width ratio
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: 1.0),
                              ),
                              child: Image.asset(
                                'assets/jersey${index + 1}.png', // Replace with your image assets
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Jersey ${index + 1}',
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Categories Section
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'CATEGORIES',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Disable grid scrolling
                itemCount: 9, // Total number of categories
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Three categories per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.0, // Adjusts the height/width ratio
                ),
                itemBuilder: (context, index) {
                  // Array of category names
                  final categoryNames = [
                    'International Fan Version',
                    'Fan Version Kit 24/25',
                    'Fan Version 23/24',
                    'Player Version 23/24',
                    'Player Version 24/25',
                    'International Player Version',
                    'Retro Jerseys',
                    'Retro Kit',
                    'Fan Version 23/24',
                  ];

                  // Array of category images
                  final categoryImages = [
                    'assets/argcopamstr.png', // Argentina
                    'assets/utdpv24.png', // Manchester United
                    'assets/arsian.png', // Manchester United
                    'assets/livhopv23.png', // Replace with your image assets
                    'assets/livhopv24.png', // Replace with your image assets
                    'assets/francehome24.png', // Replace with your image assets
                    'assets/barca2015.png', // Replace with your image assets
                    'assets/livretro.png', // Replace with your image assets
                    'assets/newcmstr.png', // Replace with your image assets
                  ];

                  return Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                            ),
                            child: Image.asset(
                              categoryImages[index], // Category image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            categoryNames[index], // Category name
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
