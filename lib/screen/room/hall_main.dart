import 'package:flutter/material.dart';
import 'package:homesync/theme/homesync_text_styles.dart';
import 'package:homesync/theme/homesync_theme.dart';

class HallMain extends StatefulWidget {
  const HallMain({super.key});

  @override
  State<HallMain> createState() => _HallMainState();
}

class _HallMainState extends State<HallMain> {
  bool _isSwitched1 = false;
  bool _isSwitched2 = false;

  // Define the slider values as state variables
  double _mainLightValue = 0.7;
  double _floorLampValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(43, 36, 33, 1),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  'assets/living_room.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: homeSyncTheme.primaryColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '36 %',
                                        style: HomeSyncTextStyles.homeSyncTitle
                                            .copyWith(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 36),
                                      ),
                                      Spacer(),
                                      const Icon(
                                        Icons.water_drop,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Humidifier\nAir',
                                    style: HomeSyncTextStyles.homeSyncTitle
                                        .copyWith(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                            color: Colors.grey),
                                  ),
                                  const SizedBox(height: 18),
                                  Container(
                                    color: Colors.grey,
                                    height: 1,
                                    width: 200,
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        'Mode 2',
                                        style: HomeSyncTextStyles.homeSyncTitle
                                            .copyWith(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                color: Colors.grey),
                                      ),
                                      const Spacer(),
                                      Switch(
                                        activeColor: Colors.amber,
                                        value: _isSwitched1,
                                        onChanged: (value) {
                                          setState(() {
                                            _isSwitched1 = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: homeSyncTheme.primaryColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '73 %',
                                        style: HomeSyncTextStyles.homeSyncTitle
                                            .copyWith(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 36),
                                      ),
                                      Spacer(),
                                      const Icon(
                                        Icons.air,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Purifier\nAir',
                                    style: HomeSyncTextStyles.homeSyncTitle
                                        .copyWith(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                            color: Colors.grey),
                                  ),
                                  const SizedBox(height: 18),
                                  Container(
                                    color: Colors.grey,
                                    height: 1,
                                    width: 200,
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        'Mode 2',
                                        style: HomeSyncTextStyles.homeSyncTitle
                                            .copyWith(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12,
                                                color: Colors.grey),
                                      ),
                                      const Spacer(),
                                      Switch(
                                        activeColor: Colors.amber,
                                        value: _isSwitched2,
                                        onChanged: (value) {
                                          setState(() {
                                            _isSwitched2 = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 150,
                    width: 400,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: homeSyncTheme.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        // First slider row
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Main light',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.light, // Bell icon
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                              thumbColor: Colors.white, // Thumb color
                              activeTrackColor: const Color(0xFFFFB267),
                              inactiveTrackColor: Colors.grey,
                              overlayShape: SliderComponentShape
                                  .noOverlay, // No overlay when dragging
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 12.0)),
                          child: Slider(
                            value: _mainLightValue,
                            onChanged: (value) {
                              setState(() {
                                _mainLightValue = value; // Update slider value
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Second slider row
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Floor lamp',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.lightbulb, // Lamp icon
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            thumbColor: Colors.white, // Thumb color
                            activeTrackColor: Color(
                                0xFFFFB267), // Active track color (orange)
                            inactiveTrackColor:
                                Colors.grey, // Inactive track color
                            overlayShape: SliderComponentShape
                                .noOverlay, // No overlay when dragging
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                          ),
                          child: Slider(
                            value: _floorLampValue, // Use the state value
                            onChanged: (value) {
                              setState(() {
                                _floorLampValue = value; // Update slider value
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
