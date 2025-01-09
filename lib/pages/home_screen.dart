import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:homesync/screen/room/bathroom_main.dart';
import 'package:homesync/screen/room/bedroom_main.dart';
import 'package:homesync/screen/room/hall_main.dart';
import 'package:homesync/screen/room/kitchen_main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electricity Usage App',
      theme: ThemeData.dark(),
      home: HomeScreen2(),
      // Define the routes for each room
      routes: {
        '/bedroom': (context) => BedroomMain(),
        '/livingroom': (context) => HallMain(),
        '/bathroom': (context) => BathroomMain(),
        '/kitchen': (context) => KitchenMain(),
      },
    );
  }
}

class HomeScreen2 extends StatelessWidget {
  final List<Map<String, String>> rooms = [
    {"name": "Living Room", "devices": "04", "image": "assets/living_room.jpg"},
    {"name": "Bedroom", "devices": "03", "image": "assets/bedroom.jpeg"},
    {"name": "Study Room", "devices": "02", "image": "assets/bathroom.png"},
    {"name": "Kitchen", "devices": "01", "image": "assets/kitchen.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 29, 29),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Harsh 👋',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Welcome to Home',
                        style: TextStyle(color: Colors.white60),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Weather card
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[800],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mostly Cloudy',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Mumbai, India',
                              style: TextStyle(color: Colors.white60),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          '22°C',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WeatherInfo(label: '27°C', title: 'Feels like'),
                        WeatherInfo(label: '4%', title: 'Precipitation'),
                        WeatherInfo(label: '66%', title: 'Humidity'),
                        WeatherInfo(label: '16 km/h', title: 'Wind'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Your Rooms section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Rooms',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 114, 109, 110),
                      shape: StadiumBorder(),
                    ),
                    child: Text('Add'),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Grid of rooms
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: rooms.length + 1, // Add 1 for the '+' button
                  itemBuilder: (context, index) {
                    if (index == rooms.length) {
                      return AddRoomButton();
                    }
                    final room = rooms[index];

                    // Add GestureDetector here to handle on press event
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the respective room page based on room name
                        if (room['name'] == "Bedroom") {
                          Navigator.pushNamed(context, '/bedroom');
                        } else if (room['name'] == "Living Room") {
                          Navigator.pushNamed(context, '/livingroom');
                        } else if (room['name'] == "Study Room") {
                          Navigator.pushNamed(context, '/bathroom');
                        } else if (room['name'] == "Kitchen") {
                          Navigator.pushNamed(context, '/kitchen');
                        }
                      },
                      child: RoomCard(
                        roomName: room['name']!,
                        devices: room['devices']!,
                        imagePath: room['image']!,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Weather Info Widget
class WeatherInfo extends StatelessWidget {
  final String label;
  final String title;

  WeatherInfo({required this.label, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(color: Colors.white60),
        ),
      ],
    );
  }
}

// Room Card Widget
class RoomCard extends StatelessWidget {
  final String roomName;
  final String devices;
  final String imagePath;

  RoomCard(
      {required this.roomName, required this.devices, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circle avatar for the room image
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 10),
          Text(
            roomName,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            '$devices Devices',
            style: TextStyle(color: Colors.white60),
          ),
        ],
      ),
    );
  }
}

// Add Room Button
class AddRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the tap event to add a new room
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[700],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
