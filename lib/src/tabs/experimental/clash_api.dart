import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../store.dart';

class ClashAPIWidget extends StatefulWidget {
  const ClashAPIWidget({super.key});

  @override
  State<ClashAPIWidget> createState() => _ClashAPIWidgetState();
}

class _ClashAPIWidgetState extends State<ClashAPIWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.cacheFile),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(height: dividerHeight),
          ],
        ),
      ),
    );
  }
}
