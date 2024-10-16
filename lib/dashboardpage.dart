import 'package:flutter/material.dart';
import 'classroomdetails.dart'; // Reference to ClassroomDetailsPage
import 'classroom.dart'; // Reference for ClassRoomPage and created classrooms

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch the classrooms from ClassRoomPage's static createdClassrooms list
    final createdClassrooms = ClassroomData.instance.createdClassrooms;
    return Scaffold(
        body: Container(
      // Apply the gradient to the entire screen
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
          // Sidebar
          Container(
            width: 250,
            color: const Color(0xFF2C2C2C),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align elements to the left
              children: [
                // Logo with Text Row
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
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
                      const SizedBox(width: 25), // Space between logo and text
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: ListTile(
                    leading: Icon(Icons.add_circle, color: Colors.white),
                    title: Text('Create New Classroom',
                        style: TextStyle(color: Colors.white)),
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
                        color: const Color(0xFF4F4F4F), // Dark background color
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
            child: Column(
              children: [
                // Existing header code...
                const Text(
                  "Jake's Dashboard",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Text(
                  '${createdClassrooms.length} Classrooms Created',
                  style: const TextStyle(color: Colors.white),
                ),
                // Dropdown to select classroom
                DropdownButton<String>(
                  dropdownColor:
                      const Color(0xFF2C2C2C), // Background color for dropdown
                  hint: const Text(
                    'Select Classroom',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: null,
                  items: createdClassrooms.map((classroom) {
                    return DropdownMenuItem<String>(
                      value: classroom['name'],
                      child: Text(
                        classroom['name'],
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (selectedClassroom) {
                    // Navigate to ClassroomDetailsPage when a classroom is selected
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassroomDetailsPage(
                          name: selectedClassroom!,
                          description: createdClassrooms.firstWhere((c) =>
                              c['name'] == selectedClassroom)['description'],
                          categories: createdClassrooms.firstWhere((c) =>
                              c['name'] ==
                              selectedClassroom)['selectedCategories'],
                          maxCapacity: createdClassrooms.firstWhere((c) =>
                              c['name'] == selectedClassroom)['maxCapacity'],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
