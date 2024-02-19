import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import 'screens.dart';

const primaryColor = Color.fromARGB(255, 91, 162, 255);
const canvasColor = Color.fromARGB(255, 34, 60, 71);
const scaffoldBackgroundColor = Color.fromARGB(255, 7, 39, 46);
const accentCanvasColor = Color.fromARGB(255, 62, 88, 97);
const white = Colors.white;
final actionColor = const Color.fromARGB(255, 95, 139, 167).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/flutter_logo.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: getTitleByIndex(0),
        ),
        SidebarXItem(
          icon: Icons.event_note,
          label: getTitleByIndex(1),
        ),
        SidebarXItem(
          icon: Icons.dns,
          label: getTitleByIndex(2),
        ),
        SidebarXItem(
          icon: Icons.inbox,
          label: getTitleByIndex(3),
        ),
        SidebarXItem(
          icon: Icons.outbox,
          label: getTitleByIndex(4),
        ),
        SidebarXItem(
          icon: Icons.alt_route,
          label: getTitleByIndex(5),
        ),
        SidebarXItem(
          icon: Icons.security_update_warning,
          label: getTitleByIndex(6),
        ),
        SidebarXItem(
          iconWidget: const FlutterLogo(size: 20),
          label: getTitleByIndex(7),
        ),
      ],
    );
  }
}
