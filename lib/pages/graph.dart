import 'package:flutter/material.dart';

class EnergyAnalysisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home energy analysis'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black87, // Darker shade
                Colors.black54, // Lighter shade
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Year/Month toggle
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text('Year',
                              style: TextStyle(color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text('Month',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                      isSelected: [true, false],
                      onPressed: (int index) {},
                    ),
                  ],
                ),
                SizedBox(height: 16.0),

                // YTD Energy Use
                Text(
                  'YTD ENERGY USE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '2,838 kW/h',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    color: Colors.white, // Change color for contrast
                  ),
                ),
                SizedBox(height: 24.0),

                // Bar chart for energy categories with animation
                EnergyBarChart(),
                SizedBox(height: 24.0),

                // Energy use details
                EnergyTile(
                  icon: Icons.thermostat_outlined,
                  title: 'Heating avg (year)',
                  amount: '1,950 kW/h',
                  color: Colors.tealAccent[400] ?? Colors.tealAccent,
                ),
                EnergyTile(
                  icon: Icons.opacity_outlined,
                  title: 'Water heating avg (year)',
                  amount: '630 kW/h',
                  color: Colors.lightBlueAccent[400] ?? Colors.lightBlueAccent,
                ),
                EnergyTile(
                  icon: Icons.kitchen_outlined,
                  title: 'Appliances avg (year)',
                  amount: '220 kW/h',
                  color: Colors.orangeAccent ?? Colors.orange,
                ),
                EnergyTile(
                  icon: Icons.lightbulb_outline,
                  title: 'Lighting avg (year)',
                  amount: '157 kW/h',
                  color: Colors.yellowAccent[700] ?? Colors.yellowAccent,
                ),

                // New section for Solar and Grid goals
                SizedBox(height: 16.0),
                GoalTile(
                  icon: Icons.settings_outlined,
                  title: 'Solar goal (%)',
                  amount: '80%',
                  color: Colors.tealAccent[400] ?? Colors.tealAccent,
                ),
                GoalTile(
                  icon: Icons.network_cell_outlined,
                  title: 'Grid goal (%)',
                  amount: '20%',
                  color: Colors.redAccent[100] ?? Colors.redAccent,
                ),

                ComparisonTile(
                  title: 'You used 10% less than last week',
                  amount: '-10%',
                  gradientColors: [
                    Colors.black87, // Darker shade
                    Colors.black45, // Lighter shade
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Bar chart widget for the energy categories with animation
class EnergyBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end, // Align bars at the bottom
      children: [
        EnergyBar(
            label: 'Heating',
            finalHeight: 180,
            color: Colors.tealAccent[400] ?? Colors.tealAccent,
            value: '1,873 kW/h'),
        EnergyBar(
            label: 'Water heating',
            finalHeight: 100,
            color: Colors.lightBlueAccent[400] ?? Colors.lightBlueAccent,
            value: '539 kW/h'),
        EnergyBar(
            label: 'Appliances',
            finalHeight: 80,
            color: Colors.orangeAccent ?? Colors.orange,
            value: '170 kW/h'),
        EnergyBar(
            label: 'Lighting',
            finalHeight: 60,
            color: Colors.yellowAccent[700] ?? Colors.yellowAccent,
            value: '114 kW/h'),
        EnergyBar(
            label: 'Other',
            finalHeight: 45,
            color: Colors.purpleAccent[400] ?? Colors.purpleAccent,
            value: '85 kW/h'),
        EnergyBar(
            label: 'Cooling',
            finalHeight: 30,
            color: Colors.lightGreenAccent ?? Colors.lightGreen,
            value: '57 kW/h'),
      ],
    );
  }
}

// Animated bar widget for the bar chart
class EnergyBar extends StatelessWidget {
  final String label;
  final double finalHeight; // Final height of the bar after animation
  final Color color;
  final String value;

  const EnergyBar({
    Key? key,
    required this.label,
    required this.finalHeight,
    required this.color,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.end, // Align bars and labels at the bottom
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: finalHeight),
          duration:
              Duration(seconds: 2), // Adjust the duration of the animation
          builder: (context, height, child) {
            return Container(
              height: height,
              width: 40,
              color: color,
            );
          },
        ),
        SizedBox(height: 4),
        Text(label,
            style: TextStyle(
                fontSize: 12,
                color: Colors.white)), // Change text color for contrast
        Text(value, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

// Widget for energy consumption tiles
class EnergyTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String amount;
  final Color color;

  const EnergyTile(
      {Key? key,
      required this.icon,
      required this.title,
      required this.amount,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(title,
          style:
              TextStyle(color: Colors.white)), // Change text color for contrast
      trailing: Text(amount,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white)), // Change text color for contrast
    );
  }
}

// Widget for goal tiles (Solar and Grid goal)
class GoalTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String amount;
  final Color color;

  const GoalTile(
      {Key? key,
      required this.icon,
      required this.title,
      required this.amount,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: Colors.black, // Changed background to black
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title,
            style: TextStyle(
                color:
                    Colors.white)), // Optional: Change text color for contrast
        trailing: Text(amount,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color:
                    Colors.white)), // Optional: Change text color for contrast
      ),
    );
  }
}

// Widget for comparison with last week (with gradient background)
class ComparisonTile extends StatelessWidget {
  final String title;
  final String amount;
  final List<Color> gradientColors;

  const ComparisonTile(
      {Key? key,
      required this.title,
      required this.amount,
      required this.gradientColors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.greenAccent[400],
            child: Icon(Icons.trending_down, color: Colors.white),
          ),
          title: Text(title, style: TextStyle(color: Colors.white)),
          trailing: Text(amount,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
    );
  }
}
