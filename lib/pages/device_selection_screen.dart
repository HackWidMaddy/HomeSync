import 'package:flutter/material.dart';

class ElementSelectionScreen extends StatefulWidget {
  final List<String> rooms;

  ElementSelectionScreen({required this.rooms});

  @override
  _ElementSelectionScreenState createState() => _ElementSelectionScreenState();
}

class _ElementSelectionScreenState extends State<ElementSelectionScreen> {
  // Devices available in the rooms
  final Map<String, List<String>> roomDevices = {
    'Hall': ['Lights', 'Fan', 'TV'],
    'Bathroom': ['Lights', 'Heater', 'Shower'],
    'Bedroom': ['Lights', 'Fan', 'AC', 'TV'],
    'Kitchen': ['Oven', 'Fridge', 'Microwave'],
    'Study Room': ['Lights', 'Fan', 'Computer'],
  };

  // Track quantity for each device in each room
  final Map<String, Map<String, int>> selectedDeviceQuantities = {};

  @override
  void initState() {
    super.initState();
    // Initialize device quantities for each room as 0
    widget.rooms.forEach((room) {
      selectedDeviceQuantities[room] = {
        for (var device in roomDevices[room]!) device: 0
      };
    });
  }

  void _incrementQuantity(String room, String device) {
    setState(() {
      selectedDeviceQuantities[room]![device] =
          (selectedDeviceQuantities[room]![device]! + 1);
    });
  }

  void _decrementQuantity(String room, String device) {
    setState(() {
      if (selectedDeviceQuantities[room]![device]! > 0) {
        selectedDeviceQuantities[room]![device] =
            (selectedDeviceQuantities[room]![device]! - 1);
      }
    });
  }

  // Function to handle the Next button press
  void _onNextPressed() {
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background
      appBar: AppBar(
        title: Text(
          'Select Devices',
          style: TextStyle(
            color: Colors.white, // White text for dark theme
          ),
        ),
        backgroundColor: Colors.black, // Dark app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: widget.rooms.length,
          itemBuilder: (context, index) {
            final room = widget.rooms[index];
            final devices = roomDevices[room]!;

            return Card(
              color: Colors.grey.shade900, // Dark background for cards
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      room,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // White text for dark theme
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Select items in $room:',
                      style: TextStyle(color: Colors.white), // White text
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: devices.map((device) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              device,
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              children: [
                                // Decrement button
                                IconButton(
                                  icon: Icon(Icons.remove, color: Colors.white),
                                  onPressed: () =>
                                      _decrementQuantity(room, device),
                                ),
                                // Display current quantity
                                Text(
                                  '${selectedDeviceQuantities[room]![device]}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                // Increment button
                                IconButton(
                                  icon: Icon(Icons.add, color: Colors.white),
                                  onPressed: () =>
                                      _incrementQuantity(room, device),
                                ),
                              ],
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: _onNextPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Customize button color
              padding: EdgeInsets.symmetric(vertical: 12),
              textStyle: TextStyle(fontSize: 18),
            ),
            child: Text('Next'),
          ),
        ),
      ),
    );
  }
}
