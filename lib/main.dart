import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClassroomPage(),
    );
  }
}

class ClassroomPage extends StatelessWidget {
  const ClassroomPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: ListTile(
                    leading: Icon(Icons.bar_chart, color: Colors.white),
                    title: Text('Dashboard',
                        style: TextStyle(color: Colors.white)),
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

          // Main content
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.5, 0.5), // Center of the gradient
                  radius: 1.0, // Gradient size
                  colors: [
                    Color(0x804F4F4F), // Start color rgba(79, 79, 79, 0.5)
                    Color(0x80020204), // End color rgba(2, 2, 4, 0.5)
                  ],
                ),
              ),
              child: Column(
                children: [
                  // Header Image and Welcome Text
                  Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(
                              0.6), // Adjust the opacity to make it slightly dark
                          BlendMode.darken,
                        ),
                        child: Image.network(
                          'https://s3-alpha-sig.figma.com/img/00bc/3266/506beb7663ba405c0b502b5f04449c8b?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=oRmvIbTBCGuOih2cbTBfGSseQp9mNVsoeIUNesxg3-~8c77-4FEXY9fZ-AWMTFHsXiF6ZQjo2i4G8sdP2okVZK6mC7iiqCGoA7vy0MSYDTnPzjcQHoNmdVrwLW0UXRD9K4zf77ohyocub1H2pClrIPMUuvp~TR3~Gp-ivHLMcrqkxn-Nr5BIuAoZDe2O4hZxpD--aVYZ4TesRHD9ALZGoXIBhq6OkugYQMqS5b6WRvbRaengZs13PNycd7bTay3BTV8-ktLb63mHtZJdxHRP6BQ6t7SQ4q5BH1FDs9kfcVTPUxwG86JtKb9pI33cBd1pHZnVmWkO-UiX8UKJEurHzw__', // Your image URL
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          top: 20,
                          right: 20,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.network(
                                'https://s3-alpha-sig.figma.com/img/14ee/0cc2/7b1c26d1ce14f9973bf016f609ea5def?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OY0eHJg2UlXLetg1cGu7VsY9dsOW-eM9nKqIR1moRQkUxFfE07-gmpZBGJuPvVWPbrMf69vTVZLC2F7ehzLjBwi-gn39bEZqiqPu6iGCQqCoSkRM2iawYe4PrjoCJuPmuYjcwcxZnwz9Oxr35u~CEpz4r-o~jRNbIZYzwbE2UOKpCCtYWPcmlvmBVbyGGZw-yztVmoOMepx6ZMB7AF8dvejWNLMV6wYqmzABkDq6FnSjR2JdD7cWqxKBWNJNpsq9bNKzYzwXZlENXT7ZhU7X548Vs5SZmRnCPjLW~eSnY3q-2TDK7QnAGQrnwXH8UBdueiSPEy-7HOkZgxXQ0Dr5Qg__',
                                width: 35,
                                height: 35,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                '300',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              IconButton(
                                icon: const Icon(Icons.settings,
                                    color: Colors.white),
                                onPressed: () {
                                  // Settings button action
                                  print('Settings tapped');
                                },
                              ),
                              IconButton(
                                icon: const CircleAvatar(
                                  radius: 15, // Small round image
                                  backgroundImage: NetworkImage(
                                      'https://s3-alpha-sig.figma.com/img/2a84/34c4/e48d0a875161238a96968a7207361c63?Expires=1729468800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=X0SkQMcwNh40QoQK3AhoLTczv~balO6x37B0uOfUfHKgGdO1jMy2I-mCRMIog51xMmvp~x-rFg2UxnDNp95BJ2emGWpFaFSQAQeC-eFwFM6h9NvJC5WoV0okIJnik4lJ-ddKxFwInhqIGkmq6uTRPJ3eWpYeztNC2JTNd7gk0Gbru3ug08dTK5cjRM5y0YXjhaDe3sBYV8IxGBKC1uhTjwZVbi7PZ517VibK1Vph6u0~cq6XsP9asR4o6kkiD7OSMlHH~ZhGiqYRFBr1Qvm~8LeeyxN8F7rVK11t1d6ZI6gCBWlB0ZXktn5XiRWA1umGoeVhvCeLubyj5nBdbkfSRA__'),
                                ),
                                onPressed: () {
                                  // Profile button action
                                  print('Profile tapped');
                                },
                              ),
                            ],
                          )),
                      const Positioned(
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
                  const SizedBox(height: 30),
                  // Upload Section

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text(
                          'Upload your content to create new classrooms',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          color: Colors.transparent,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              // White slim border
                              color: Colors.white,
                              width: 0.5, // Slim border
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: double.infinity,
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                const Text('Upload your content here',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey)),
                                Icon(Icons.upload_file,
                                    size: 50, color: Colors.grey[600]),
                                const SizedBox(height: 10),
                                const Text(
                                  'Click or Drag PDF, PPT, TXT, or DOCX to generate questions (Max 50MB)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 20),
                                Card(
                                  color: const Color(0xFFFB7171),
                                  child: InkWell(
                                    onTap: () {
                                      // Add functionality for file upload
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
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
    ));
  }
}
