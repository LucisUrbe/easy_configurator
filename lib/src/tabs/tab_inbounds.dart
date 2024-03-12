///
/// @note This file is stub only. No actual functional widgets are implemented.
///

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../store.dart';

class InboundsTabWidget extends StatefulWidget {
  const InboundsTabWidget({super.key});

  @override
  State<InboundsTabWidget> createState() => _InboundsTabWidgetState();
}

class _InboundsTabWidgetState extends State<InboundsTabWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.inbounds),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(height: dividerHeight),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              initialValue: InboundsStore.inbounds.first.inboundJsonStub,
              cursorColor: gray,
              style: const TextStyle(color: white),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: white),
                ),
                hintText: AppLocalizations.of(context)!.inboundJsonStubHintText,
                hintStyle: const TextStyle(color: gray),
              ),
              onChanged: (inputString) {
                setState(() {
                  InboundsStore.inbounds.first.inboundJsonStub = inputString;
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
