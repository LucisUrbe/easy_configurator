import 'package:easy_configurator/src/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

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
        final pageTitle = getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
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

String getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'log';
    case 2:
      return 'dns';
    case 3:
      return 'inbounds';
    case 4:
      return 'outbounds';
    case 5:
      return 'route';
    case 6:
      return 'experimental';
    case 7:
      return 'About';
    default:
      return 'Not Found';
  }
}
