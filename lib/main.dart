import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClassroomPage(),
    );
  }
}

class ClassroomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          // Sidebar
          Container(
            width: 250,
            color: Color(0xFF2E2E33),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align elements to the left
              children: [
                // Logo with Text Row
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
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
                          SizedBox(height: 5), // Space between logo and text
                          Text(
                            'CLASSROOM',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 5, // Small font size for 'CLASSROOM'
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 25), // Space between logo and text
                      // "KOTC CLASSROOM" Header Text
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the start
                          children: [
                            Text(
                              'KOTC CLASSROOM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
                ListTile(
                  title: Text('Menu',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: Icon(Icons.bar_chart, color: Colors.white),
                  title:
                      Text('Dashboard', style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  leading: Icon(Icons.add_circle, color: Colors.white),
                  title: Text('Create New Classroom',
                      style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  leading: Icon(Icons.people, color: Colors.white),
                  title: Text('My Classrooms',
                      style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  leading: Image.network(
                    'https://static.vecteezy.com/system/resources/previews/010/366/172/original/crown-icon-transparent-free-png.png',
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  ),
                  title: Text('Premium', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  color: Colors.blueGrey,
                  width: 150,
                  child: Row(
                    children: [
                      Image.asset(
                        'images/logo.png',
                        width: 25,
                        height: 25,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the start
                          children: [
                            Text(
                              'Switch to KOTC',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
              ],
            ),
          ),

          // Main content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Header Image and Welcome Text
                  Stack(
                    children: [
                      Image.network(
                        'https://s3-alpha-sig.figma.com/img/00bc/3266/506beb7663ba405c0b502b5f04449c8b?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=oRmvIbTBCGuOih2cbTBfGSseQp9mNVsoeIUNesxg3-~8c77-4FEXY9fZ-AWMTFHsXiF6ZQjo2i4G8sdP2okVZK6mC7iiqCGoA7vy0MSYDTnPzjcQHoNmdVrwLW0UXRD9K4zf77ohyocub1H2pClrIPMUuvp~TR3~Gp-ivHLMcrqkxn-Nr5BIuAoZDe2O4hZxpD--aVYZ4TesRHD9ALZGoXIBhq6OkugYQMqS5b6WRvbRaengZs13PNycd7bTay3BTV8-ktLb63mHtZJdxHRP6BQ6t7SQ4q5BH1FDs9kfcVTPUxwG86JtKb9pI33cBd1pHZnVmWkO-UiX8UKJEurHzw__', // Background image path
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 20,
                        bottom: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome to KOTC Classroom!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'In this KOTC classroom, you can plug in your content such as \nsyllabus of your course or any other studying materials to get \ncontent back in a testable format using our gamified framework',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  // Upload Section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Upload your content to create new classrooms',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Icon(Icons.cloud_upload,
                                    size: 50, color: Colors.grey[600]),
                                SizedBox(height: 10),
                                Text('Upload your content here',
                                    style: TextStyle(fontSize: 18)),
                                SizedBox(height: 10),
                                Text(
                                  'Click or Drag PDF, PPT, TXT, or DOCX to generate questions (Max 50MB)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 20),
                                Card(
                                  color: Color(0xFFFB7171),
                                  child: InkWell(
                                    onTap: () {
                                      // Add functionality for file upload
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        'Search from your device',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
