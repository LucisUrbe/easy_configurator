import 'dart:io';
import 'dart:convert';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../colors.dart';
import '../store_map.dart';
import '../map_store.dart';

class HomeTabWidget extends StatefulWidget {
  const HomeTabWidget({super.key});

  @override
  State<HomeTabWidget> createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(height: dividerHeight),
            ListTile(
              title: Text(AppLocalizations.of(context)!.homeGenerateConfig),
              titleTextStyle: const TextStyle(color: white),
              trailing: const Icon(
                Icons.import_export,
                color: white,
              ),
              onTap: () async {
                // set state here if needed
                if (Platform.isWindows ||
                    Platform.isMacOS ||
                    Platform.isLinux) {
                  final String? outputFile = await FilePicker.platform.saveFile(
                    dialogTitle: 'Please select an output file:',
                    fileName: 'config.json',
                  );
                  final File file = File(outputFile!);
                  await file.writeAsString(jsonEncode(buildConfig()));
                }
              },
            ),
            const Divider(height: dividerHeight),
            ListTile(
              title: Text(AppLocalizations.of(context)!.homeLoadConfig),
              titleTextStyle: const TextStyle(color: white),
              trailing: const Icon(
                Icons.import_export,
                color: white,
              ),
              onTap: () async {
                // set state here if needed
                if (Platform.isWindows ||
                    Platform.isMacOS ||
                    Platform.isLinux) {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();
                  if (result != null) {
                    File file = File(result.files.single.path!);
                    final jsonString = await file.readAsString();
                    const JsonDecoder decoder = JsonDecoder();
                    final Map<String, dynamic> jsonObject =
                        decoder.convert(jsonString);
                    loadConfig(jsonObject);
                  }
                }
              },
            ),
            const Divider(height: dividerHeight),
          ],
        ),
      ),
    );
  }
}
