///
/// @note This file is stub only. No actual functional widgets are implemented.
///

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../store.dart';

class RulesTabWidget extends StatefulWidget {
  const RulesTabWidget({super.key});

  @override
  State<RulesTabWidget> createState() => _RulesTabWidgetState();
}

class _RulesTabWidgetState extends State<RulesTabWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.dnsRules),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(height: dividerHeight),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              initialValue: DNSRulesStore.rules.first.ruleJsonStub,
              cursorColor: gray,
              style: const TextStyle(color: white),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: white),
                ),
                hintText: AppLocalizations.of(context)!.dnsRuleJsonStubHintText,
                hintStyle: const TextStyle(color: gray),
              ),
              onChanged: (inputString) {
                setState(() {
                  DNSRulesStore.rules.first.ruleJsonStub = inputString;
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
