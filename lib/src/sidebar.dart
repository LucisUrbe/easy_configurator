import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import 'colors.dart';

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
      items: generateSidebarXItems(context),
    );
  }
}

List<SidebarXItem> generateSidebarXItems(BuildContext context) {
  List<IconData> icons = [
    Icons.home,
    Icons.event_note,
    Icons.dns,
    Icons.timer,
    Icons.inbox,
    Icons.outbox,
    Icons.alt_route,
    Icons.security_update_warning,
    Icons.info_outline,
  ];
  List<SidebarXItem> items = [];
  // Widget defaultIcon = const FlutterLogo(size: 20);
  for (var i = 0; i < icons.length; i++) {
    items.add(SidebarXItem(
      icon: icons[i],
      label: getTitleByIndex(i, context),
    ));
  }
  return items;
}

String getTitleByIndex(int index, BuildContext context) {
  var titles = [
    AppLocalizations.of(context)!.home,
    AppLocalizations.of(context)!.log,
    AppLocalizations.of(context)!.dns,
    AppLocalizations.of(context)!.ntp,
    AppLocalizations.of(context)!.inbounds,
    AppLocalizations.of(context)!.outbounds,
    AppLocalizations.of(context)!.route,
    AppLocalizations.of(context)!.experimental,
    AppLocalizations.of(context)!.about,
  ];
  if (index >= titles.length) {
    return AppLocalizations.of(context)!.notFound;
  } else {
    return titles[index];
  }
}
