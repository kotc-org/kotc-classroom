import 'package:flutter/material.dart';

import 'classroom.dart';
import 'dashboardpage.dart';

class ClassroomDetailsPage extends StatelessWidget {
  final String name;
  final String description;
  final Map<String, List<String>> categories;
  final int maxCapacity;

  const ClassroomDetailsPage({
    Key? key,
    required this.name,
    required this.description,
    required this.categories,
    required this.maxCapacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Rounded edges
          gradient: const RadialGradient(
            center: Alignment(0.5, 0.5),
            radius: 0.8, // Adjust the radius as needed
            colors: [
              Color.fromRGBO(30, 30, 30, 0.9), // Darker shade (nearly black)
              Color.fromRGBO(10, 10, 10, 1.0), // Dark black color
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 250,
              color: const Color(0xFF2C2C2C),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align elements to the left
                children: [
                  // Logo with Text Row
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Row(
                      children: [
                        // Circular Logo with Small "CLASSROOM" Text Underneath
                        Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'images/logo.png', // Logo image path
                                width: 40, // Adjust logo size
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                                height: 5), // Space between logo and text
                            const Text(
                              'CLASSROOM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 7, // Small font size for 'CLASSROOM'
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            width: 25), // Space between logo and text
                        // "KOTC CLASSROOM" Header Text
                        const Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align text to the start
                            children: [
                              Text(
                                'KOTC CLASSROOM',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines:
                                    2, // Allows text to wrap into 2 lines if needed
                                overflow: TextOverflow
                                    .visible, // Ensures overflow is visible
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Menu Items
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: ListTile(
                      title: Text(
                        'Menu',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: ListTile(
                      leading: const Icon(Icons.bar_chart, color: Colors.white),
                      title: const Text('Dashboard',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardPage()),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: ListTile(
                      leading:
                          const Icon(Icons.add_circle, color: Colors.white),
                      title: const Text('Create New Classroom',
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClassRoomPage()),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: ListTile(
                      leading: Icon(Icons.people, color: Colors.white),
                      title: Text('My Classrooms',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: ListTile(
                      leading: Image.network(
                        'https://static.vecteezy.com/system/resources/previews/010/366/172/original/crown-icon-transparent-free-png.png',
                        width: 30,
                        height: 30,
                        color: Colors.white,
                      ),
                      title: const Text('Premium',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Add your functionality here for the button tap
                        print('Switch to KOTC tapped');
                      },
                      child: Container(
                        width: 150, // Set the desired width
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                          color:
                              const Color(0xFF4F4F4F), // Dark background color
                          borderRadius:
                              BorderRadius.circular(10), // Rounded edges
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(5), // Rounded image
                              child: Image.asset(
                                'images/logo.png', // Replace with your image path
                                width: 30,
                                height: 30,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Flexible(
                              child: Text(
                                'Switch to KOTC Main',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow
                                    .ellipsis, // Ensures text doesn't overflow
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name, // Use classroom name here
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      description, // Use description here
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        children: [
                          _buildCard(
                              'Study',
                              'Expand your knowledge with our collection of quality resources',
                              Icons.school,
                              Colors.orange),
                          _buildCard(
                              'Training',
                              'Improve your score with three interactive modes',
                              Icons.lightbulb,
                              Colors.lightBlue),
                          _buildCard(
                              'Review',
                              'Reinforce your knowledge with interactive activities',
                              Icons.book,
                              Colors.redAccent),
                          _buildCard(
                              'Compete',
                              'Players compete against each other aiming for high scores',
                              Icons.sports_kabaddi,
                              Colors.green),
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

  Widget _buildCard(String title, String subtitle, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 40),
            SizedBox(height: 20),
            Text(title,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(subtitle, style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
