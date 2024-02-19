import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import 'screens.dart';
import 'sidebar.dart';

class MainApp extends StatelessWidget {
  MainApp({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '@appTitle',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    foregroundColor: white,
                    backgroundColor: canvasColor,
                    title: const Text('Easy Configurator'),
                    leading: IconButton(
                      onPressed: () {
                        if (!Platform.isAndroid && !Platform.isIOS) {
                          _controller.setExtended(true);
                        }
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: SidebarWidget(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) SidebarWidget(controller: _controller),
                Expanded(
                  child: Center(
                    child: ScreensWidget(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
