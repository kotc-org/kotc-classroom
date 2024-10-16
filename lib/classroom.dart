import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'classroomdetails.dart';
import 'dashboardpage.dart';

void main() {
  runApp(const ClassRoomApp());
}

class ClassRoomApp extends StatelessWidget {
  const ClassRoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KOTC Classroom',
      theme: ThemeData.dark(),
      home: const ClassRoomPage(),
    );
  }
}

class ClassRoomPage extends StatefulWidget {
  const ClassRoomPage({super.key});
  @override
  _ClassRoomPageState createState() => _ClassRoomPageState();
}

class ClassroomData {
  // Private constructor
  ClassroomData._privateConstructor();

  static final ClassroomData instance = ClassroomData._privateConstructor();

  // List to store created classrooms
  List<Map<String, dynamic>> createdClassrooms = [];
}

class _ClassRoomPageState extends State<ClassRoomPage> {
  final TextEditingController classroomNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  int maxCapacity = 0;
  List<Map<String, dynamic>> uploadedFiles = [];
  final Map<String, List<String>> categories = {
    'Math': ['Algebra', 'Geometry', 'Calculus'],
    'Science': ['Physics', 'Chemistry', 'Biology'],
    'History': ['World History', 'American History', 'European History'],
    'Language': ['English', 'Spanish', 'French'],
    'Arts': ['Music', 'Drawing', 'Painting']
  };
  Map<String, List<String>> selectedCategories = {};

  void toggleCategory(String category, String subcategory, bool isSelected) {
    setState(() {
      if (isSelected) {
        if (selectedCategories[category] == null) {
          selectedCategories[category] = [];
        }
        selectedCategories[category]!.add(subcategory);
      } else {
        selectedCategories[category]?.remove(subcategory);
        if (selectedCategories[category]?.isEmpty ?? true) {
          selectedCategories.remove(category);
        }
      }
    });
  }

  void createClassroom() {
    if (classroomNameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        maxCapacity <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter all details!')),
      );
      return;
    }

    final newClassroom = {
      'name': classroomNameController.text,
      'description': descriptionController.text,
      'selectedCategories': Map<String, List<String>>.from(selectedCategories),
      'maxCapacity': maxCapacity,
    };

    setState(() {
      ClassroomData.instance.createdClassrooms
          .add(newClassroom); // Add to classrooms list
    });

    classroomNameController.clear();
    descriptionController.clear();
    selectedCategories.clear();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClassroomDetailsPage(
          name: newClassroom['name'] as String,
          description: newClassroom['description'] as String,
          categories:
              newClassroom['selectedCategories'] as Map<String, List<String>>,
          maxCapacity: newClassroom['maxCapacity'] as int,
        ),
      ),
    );
    print(ClassroomData.instance.createdClassrooms.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
                            builder: (context) => const DashboardPage()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: ListTile(
                    leading: const Icon(Icons.add_circle, color: Colors.white),
                    title: const Text('Create New Classroom',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClassRoomPage()),
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
          // Main content (classroom creation form)
          Expanded(
            child: Container(
              color: const Color(0xFF242424),
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Text Column (with both texts)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Create New Classroom',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                    height: 8), // Space between the texts
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      maxWidth:
                                          600), // Adjust width for wrapping
                                  child: const Text(
                                    'Create new classrooms to start collaborating and learning. It will take less than 10 minutes to finish creating your classroom',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                    softWrap: true, // Wrap text
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Invite Friends Icon next to the texts
                          const SizedBox(
                              width:
                                  10), // Add some space between texts and the icon
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape
                                  .circle, // Ensures the border follows the circular shape
                              border: Border.all(
                                color: Colors.grey, // Border color
                                width: 2.0, // Border width
                              ),
                            ),
                            child: const CircleAvatar(
                              radius: 30, // Set the size of the circle
                              backgroundColor: Color(
                                  0xFF2C2C2C), // Background color of the circle
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Aligns items in the center
                                children: [
                                  Icon(Icons.add,
                                      color: Colors.grey,
                                      size: 30), // Plus icon
                                  Text(
                                    'Invite',
                                    style: TextStyle(
                                      color: Colors.grey, // Text color
                                      fontSize:
                                          10, // Small font size to fit in the circle
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Upload Files',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                  onTap: () async {
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: [
                                        'pdf',
                                        'doc',
                                        'txt',
                                        'ppt'
                                      ],
                                    );

                                    if (result != null) {
                                      PlatformFile file = result.files.first;

                                      // Add file details to the list
                                      setState(() {
                                        uploadedFiles.add({
                                          'name': file.name,
                                          'size': file.size,
                                          'extension': file.extension,
                                        });
                                      });
                                    }
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
                      SizedBox(height: 20),
                      //Classroom name
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Classroom name',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      TextField(
                        controller: classroomNameController,
                        maxLength: 15,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Classroom Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      //Classroom description
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Classroom Description',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      TextField(
                        controller: descriptionController,
                        maxLength: 200,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Classroom Description',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      //categories
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      // Category ExpansionTiles
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categories.keys.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 3 categories per row
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) {
                          String category = categories.keys.elementAt(index);
                          List<String> subcategories = categories[category]!;

                          return Card(
                            color: const Color(0xFF333333),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    category,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Divider(color: Colors.white),
                                  Expanded(
                                    child: ListView(
                                      shrinkWrap: true,
                                      children:
                                          subcategories.map((subcategory) {
                                        return CheckboxListTile(
                                          title: Text(
                                            subcategory,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          value: selectedCategories[category] !=
                                                  null &&
                                              selectedCategories[category]!
                                                  .contains(subcategory),
                                          onChanged: (isSelected) {
                                            toggleCategory(category,
                                                subcategory, isSelected!);
                                          },
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          activeColor: Colors.blue,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      //capacity
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Maximum Capacity allowed in Classroom',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),

                      const SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Maximum capacity allowed in classroom',
                          border: OutlineInputBorder(),
                        ),
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {
                          // Parse the input value and update maxCapacity
                          if (value.isNotEmpty) {
                            maxCapacity = int.tryParse(value) ??
                                0; // Use 0 if parsing fails
                          } else {
                            maxCapacity = 0; // Reset if input is empty
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      //create and cancel buttons
                      Container(
                        width: double.infinity,
                        child: Card(
                          color: const Color(0xFFFB7171),
                          child: InkWell(
                            onTap: () async {
                              createClassroom(); //create the classroom
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'Create',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Card(
                          color: const Color(0xFF9B9B9B),
                          child: InkWell(
                            onTap: () {
                              createClassroom();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
