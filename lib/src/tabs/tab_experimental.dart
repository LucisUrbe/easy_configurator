import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../store.dart';
import 'experimental/cache_file.dart';

class ExperimentalTabWidget extends StatefulWidget {
  const ExperimentalTabWidget({super.key});

  @override
  State<ExperimentalTabWidget> createState() => _ExperimentalTabWidgetState();
}

class _ExperimentalTabWidgetState extends State<ExperimentalTabWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    return Scaffold(
      // appBar: AppBar(title: const Text('Log')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: ConfigStore.checkedCacheFile,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.checkedCacheFile = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.cacheFile,
                style: const TextStyle(color: white),
              ),
            ),
            ConfigStore.checkedCacheFile
                ? ListTile(
                    title: Text(AppLocalizations.of(context)!.cacheFile),
                    titleTextStyle: const TextStyle(color: white),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CacheFileWidget(),
                        ),
                      );
                    },
                  )
                : Container(),
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: ConfigStore.checkedClashAPI,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.checkedClashAPI = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.clashAPI,
                style: const TextStyle(color: white),
              ),
            ),
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: ConfigStore.checkedV2RayAPI,
              onChanged: (bool? value) {
                setState(() {
                  ConfigStore.checkedV2RayAPI = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.v2RayAPI,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.v2RayAPISubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            const Divider(height: dividerHeight),
          ],
        ),
      ),
    );
  }
}
