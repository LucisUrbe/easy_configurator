import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import 'sidebar.dart';
import 'tabs.dart';

class ScreensWidget extends StatelessWidget {
  const ScreensWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = getTitleByIndex(controller.selectedIndex, context);
        switch (controller.selectedIndex) {
          case 0:
            return const HomeWidget();
          case 8:
            return ListView.builder(
              itemCount: 5,
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).canvasColor,
                  boxShadow: const [BoxShadow()],
                ),
                child: Center(
                  child: Text(
                    index.toString(),
                    style: const TextStyle(color: white),
                  ),
                ),
              ),
            );
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
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
