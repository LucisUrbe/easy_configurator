import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../store.dart';

class FakeIPTabWidget extends StatefulWidget {
  const FakeIPTabWidget({super.key});

  @override
  State<FakeIPTabWidget> createState() => _FakeIPTabWidgetState();
}

class _FakeIPTabWidgetState extends State<FakeIPTabWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.dnsFakeIP),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(height: dividerHeight),
            CheckboxListTile(
              enabled: false,
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSCheckedStore.fakeIP,
              onChanged: (_) {},
              title: Text(
                AppLocalizations.of(context)!.dnsFakeIPEnabled,
                style: const TextStyle(color: white),
              ),
            ),
            DNSCheckedStore.fakeIP
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                            isExpanded: true,
                            value: DNSFakeIPStore.enabledDropdownValue,
                            items:
                                DNSFakeIPStore.enabledList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(color: white),
                                ),
                              );
                            }).toList(),
                            onChanged: (selectedValue) {
                              if (selectedValue == 'false') {
                                setState(() {
                                  DNSFakeIPStore.enabled = false;
                                  DNSFakeIPStore.enabledDropdownValue =
                                      selectedValue!;
                                });
                              }
                              if (selectedValue == 'true') {
                                setState(() {
                                  DNSFakeIPStore.enabled = true;
                                  DNSFakeIPStore.enabledDropdownValue =
                                      selectedValue!;
                                });
                              }
                            }),
                      ),
                      const VerticalDivider(
                        width: 20.0,
                      ),
                    ],
                  )
                : Container(),
            const Divider(height: dividerHeight),
            DNSCheckedStore.fakeIP
                ? CheckboxListTile(
                    enabled: false,
                    hoverColor: gray,
                    activeColor: actionColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: DNSCheckedStore.fakeIP,
                    onChanged: (_) {},
                    title: Text(
                      AppLocalizations.of(context)!.dnsFakeIP4Range,
                      style: const TextStyle(color: white),
                    ),
                  )
                : Container(),
            DNSCheckedStore.fakeIP
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: DNSFakeIPStore.inet4Range,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .dnsFakeIP4RangeHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              DNSFakeIPStore.inet4Range = inputString;
                            });
                          },
                        ),
                      ),
                      const VerticalDivider(
                        width: 20.0,
                      ),
                    ],
                  )
                : Container(),
            const Divider(height: dividerHeight),
            DNSCheckedStore.fakeIP
                ? CheckboxListTile(
                    enabled: false,
                    hoverColor: gray,
                    activeColor: actionColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: DNSCheckedStore.fakeIP,
                    onChanged: (_) {},
                    title: Text(
                      AppLocalizations.of(context)!.dnsFakeIP6Range,
                      style: const TextStyle(color: white),
                    ),
                  )
                : Container(),
            DNSCheckedStore.fakeIP
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: DNSFakeIPStore.inet6Range,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .dnsFakeIP6RangeHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              DNSFakeIPStore.inet6Range = inputString;
                            });
                          },
                        ),
                      ),
                      const VerticalDivider(
                        width: 20.0,
                      ),
                    ],
                  )
                : Container(),
            const Divider(height: dividerHeight),
          ],
        ),
      ),
    );
  }
}
