import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_candidate/utility/device.dart';
// import 'package:homes/widget/nuemorphic_wid/get/nuemorphic_button.dart';
import 'package:homesync/widget/nuemorphic_widget/nuemorphic_button.dart';

class NuemorphicCard extends StatelessWidget {
  const NuemorphicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return NuemorphicButton(
      height: 200,
      width: double.infinity,
      function: () {},
      surfaceColor: Colors.white,
      shadowColor: Colors.grey[100],
      curveType: CurveType.concave,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'hello world',
            style:
                GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.red)),
          ),
        ),
      ),
    );
  }
}
