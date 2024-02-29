import 'package:easy_configurator/src/tabs/experimental/clash_api.dart';
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
              value: ExpConfigStore.cacheFile,
              onChanged: (bool? value) {
                setState(() {
                  ExpConfigStore.cacheFile = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.cacheFile,
                style: const TextStyle(color: white),
              ),
            ),
            ExpConfigStore.cacheFile
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
              value: ExpConfigStore.clashAPI,
              onChanged: (bool? value) {
                setState(() {
                  ExpConfigStore.clashAPI = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.clashAPI,
                style: const TextStyle(color: white),
              ),
            ),
            ExpConfigStore.clashAPI
                ? ListTile(
                    title: Text(AppLocalizations.of(context)!.clashAPI),
                    titleTextStyle: const TextStyle(color: white),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ClashAPIWidget(),
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
              value: ExpConfigStore.v2RayAPI,
              onChanged: (bool? value) {
                setState(() {
                  ExpConfigStore.v2RayAPI = value!;
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
