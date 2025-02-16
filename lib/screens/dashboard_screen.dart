import 'package:flutter/material.dart';
import 'package:pm2/components/componen_stat.dart';
import 'package:pm2/components/movie_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    StatisticScreen(),
    StatisticScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Film',
          ),
        ],
      ),
    );
  }
}

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Statistik Anda',
                style: TextStyle(
                  fontSize: isSmallScreen ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: buildStatCard('Total Ditonton', 120,
                                  const Color.fromARGB(255, 72, 255, 0))),
                          SizedBox(width: isSmallScreen ? 10 : 20),
                          Expanded(
                              child: buildStatCard('Total Favorit', 50,
                                  const Color.fromARGB(255, 243, 23, 96))),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: buildStatCard('Watch Later', 30,
                                  const Color.fromARGB(255, 180, 75, 15))),
                          SizedBox(width: isSmallScreen ? 10 : 20),
                          Expanded(
                              child: buildStatCard(
                                  'Belum Ditonton', 20, Colors.grey)),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 40),
              Text(
                'Rekomendasi Film',
                style: TextStyle(
                  fontSize: isSmallScreen ? 20 : 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: screenHeight * 0.4,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(20),
                  children: [
                    MovieCard(
                        title: 'Solo Leveling',
                        imagePath: 'assets/images/anime-solo-leveling.jpg'),
                    MovieCard(
                        title: 'One Piece',
                        imagePath: 'assets/images/one-piece.jpg'),
                    MovieCard(
                        title: 'Godfather',
                        imagePath: 'assets/images/godfather.jpg'),
                    MovieCard(
                        title: 'Transformers',
                        imagePath: 'assets/images/transformer.jpg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
