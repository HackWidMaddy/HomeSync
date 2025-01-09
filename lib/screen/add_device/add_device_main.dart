import 'package:flutter/material.dart';
import 'package:homesync/screen/add_device/add_device_header.dart';
import 'package:homesync/theme/homesync_text_styles.dart';

import 'package:homesync/theme/homesync_theme.dart';
import 'package:homesync/widget/nuemorphic_widget/nuemorphic_button.dart';

class AddDeviceMain extends StatefulWidget {
  const AddDeviceMain({super.key});

  @override
  State<AddDeviceMain> createState() => _AddDeviceMainState();
}

class _AddDeviceMainState extends State<AddDeviceMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: homeSyncTheme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              AddDeviceHeader(),
              const SizedBox(height: 30),
              Row(
                children: [
                  Column(
                    children: [
                      NuemorphicButton(
                        function: () {},
                        surfaceColor: homeSyncTheme.primaryColor,
                        shadowColor: homeSyncTheme.primaryColor,
                        height: 200,
                        width: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/dashboard_images/vacuum.png'),
                              const SizedBox(height: 15),
                              Text(
                                'Bork V530',
                                style: HomeSyncTextStyles.homeSyncTitle
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Vacuum Cleaner',
                                style: HomeSyncTextStyles.homeSyncTitle
                                    .copyWith(fontSize: 12, color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      NuemorphicButton(
                        function: () {},
                        surfaceColor: homeSyncTheme.primaryColor,
                        shadowColor: homeSyncTheme.primaryColor,
                        height: 200,
                        width: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  'assets/dashboard_images/speaker.png'),
                              const SizedBox(height: 15),
                              Text(
                                'Xiaomi DEM-F600',
                                style: HomeSyncTextStyles.homeSyncTitle
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Humidifier',
                                style: HomeSyncTextStyles.homeSyncTitle
                                    .copyWith(fontSize: 12, color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      NuemorphicButton(
                        function: () {},
                        surfaceColor: homeSyncTheme.primaryColor,
                        shadowColor: homeSyncTheme.primaryColor,
                        height: 200,
                        width: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/dashboard_images/light.png'),
                              const SizedBox(height: 15),
                              Text(
                                'LIFX LED Light',
                                style: HomeSyncTextStyles.homeSyncTitle
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Smart Bulb',
                                style: HomeSyncTextStyles.homeSyncTitle
                                    .copyWith(fontSize: 12, color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                  'assets/dashboard_images/devicenotfound.png'),
                              const SizedBox(height: 15),
                              Text(
                                'Not found\n  device?',
                                style: HomeSyncTextStyles.homeSyncTitle
                                    .copyWith(fontWeight: FontWeight.normal),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Select Manually',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 178, 103),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 100),
              NuemorphicButton(
                width: 400,
                function: () {},
                shadowColor: Color.fromARGB(255, 255, 178, 103),
                surfaceColor: Color.fromARGB(255, 255, 178, 103),
                child: Center(
                    child: Text(
                  'Add Device',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
