import 'package:flutter/material.dart';
import 'device_selection_screen.dart'; // Import the device screen

class RoomSelectionScreen extends StatefulWidget {
  @override
  _RoomSelectionScreenState createState() => _RoomSelectionScreenState();
}

class _RoomSelectionScreenState extends State<RoomSelectionScreen> {
  final List<Map<String, dynamic>> rooms = [
    {'name': 'Living Room', 'image': 'assets/living_room.jpg'},
    {'name': 'Bathroom', 'image': 'assets/bathroom.png'},
    {'name': 'Bedroom', 'image': 'assets/bedroom.jpeg'}, // Placeholder image
    {'name': 'Kitchen', 'image': 'assets/kitchen.jpg'}, // Placeholder image
  ];

  List<String> selectedRooms = [];

  void _selectRoom(String room) {
    setState(() {
      if (selectedRooms.contains(room)) {
        selectedRooms.remove(room);
      } else {
        selectedRooms.add(room);
      }
    });
  }

  void _navigateToElementsScreen() {
    if (selectedRooms.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ElementSelectionScreen(rooms: selectedRooms),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select at least one room.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar: AppBar(
        title: Text('Select Rooms'),
        backgroundColor: Colors.black, // Dark app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Heading
            Text(
              'Select Rooms',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text for dark theme
              ),
            ),
            SizedBox(height: 20),
            // List of Rooms (One room per row with rounded corners)
            Expanded(
              child: ListView.builder(
                itemCount: rooms.length,
                itemBuilder: (context, index) {
                  final room = rooms[index];
                  return GestureDetector(
                    onTap: () => _selectRoom(room['name']),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Rounded corners
                      ),
                      color: selectedRooms.contains(room['name'])
                          ? Colors.grey.shade600 // Grey when selected
                          : Colors
                              .grey.shade900, // Darker grey when not selected
                      margin: EdgeInsets.symmetric(
                          vertical: 10), // Space between cards
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Room Image
                          Container(
                            width: 100,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ), // Rounded corners for image
                              child: Image.asset(
                                room['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Room Name (Without device count)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    room['name'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .white, // White text for dark theme
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
                },
              ),
            ),
            SizedBox(height: 16),
            // Replaced Floating Action Button with Arrow Icon Button
            FloatingActionButton(
              onPressed: _navigateToElementsScreen,
              child: Icon(Icons.arrow_forward), // Arrow icon
              backgroundColor: Colors.grey, // Grey for the dark theme
            ),
          ],
        ),
      ),
    );
  }
}
