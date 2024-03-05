import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import 'colors.dart';
import 'sidebar.dart';
import 'tabs/tab_home.dart';
import 'tabs/tab_log.dart';
import 'tabs/tab_dns.dart';
import 'tabs/tab_ntp.dart';
import 'tabs/tab_experimental.dart';

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
            return const HomeTabWidget();
          case 1:
            return const LogTabWidget();
          case 2:
            return const DNSTabWidget();
          case 3:
            return const NTPTabWidget();
          case 7:
            return const ExperimentalTabWidget();
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
