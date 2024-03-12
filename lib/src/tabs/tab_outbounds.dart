///
/// @note This file is stub only. No actual functional widgets are implemented.
///

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../store.dart';

class OutboundsTabWidget extends StatefulWidget {
  const OutboundsTabWidget({super.key});

  @override
  State<OutboundsTabWidget> createState() => _OutboundsTabWidgetState();
}

class _OutboundsTabWidgetState extends State<OutboundsTabWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.outbounds),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(height: dividerHeight),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              initialValue: OutboundsStore.outbounds.first.outboundJsonStub,
              cursorColor: gray,
              style: const TextStyle(color: white),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: white),
                ),
                hintText:
                    AppLocalizations.of(context)!.outboundJsonStubHintText,
                hintStyle: const TextStyle(color: gray),
              ),
              onChanged: (inputString) {
                setState(() {
                  OutboundsStore.outbounds.first.outboundJsonStub = inputString;
                });
              },
            ),
            const Divider(height: dividerHeight),
          ],
        ),
      ),
    );
  }
}
