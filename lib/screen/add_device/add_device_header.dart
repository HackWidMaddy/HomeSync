import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homesync/theme/homesync_text_styles.dart';
import 'package:intl/intl.dart';

class AddDeviceHeader extends StatelessWidget {
  AddDeviceHeader({super.key});

  final String date = DateFormat('MMMM dd, yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: (MediaQuery.sizeOf(context).height / 10) + 15,
      width: double.infinity,
      decoration: const BoxDecoration(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            decoration: const BoxDecoration(),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  height: 100,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Search ',
                          style: HomeSyncTextStyles.homeSyncSubTitle),
                      Text(
                        '3 New Devices',
                        style: GoogleFonts.montserrat(
                            fontSize: MediaQuery.sizeOf(context).width / 30,
                            color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
