import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homesync/theme/homesync_text_styles.dart';

class HomeSyncAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;

  const HomeSyncAppBar({super.key, required this.title, required this.height});

  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.of(context).canPop();
    return AppBar(
      title: null,
      centerTitle: true,
      leading: canPop
          ? Padding(
              padding: EdgeInsets.only(top: (height - kToolbarHeight)),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
              ),
            )
          : null,
      flexibleSpace: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 33, 29, 29),
          ),
          child: Center(
            child: Text(
              title,
              style: HomeSyncTextStyles.homeSyncTitle,
            ),
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
