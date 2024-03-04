import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../store.dart';

class ServersTabWidget extends StatefulWidget {
  const ServersTabWidget({super.key});

  @override
  State<ServersTabWidget> createState() => _ServersTabWidgetState();
}

class _ServersTabWidgetState extends State<ServersTabWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    const divider = Divider(height: dividerHeight);
    List<Widget> serversList = [];
    if (DNSServersStore.servers.isNotEmpty) {
      for (int index = 0; index < DNSServersStore.servers.length; index += 1) {
        serversList.add(
          ListTile(
            key: Key('$index'),
            title: Text(DNSServersStore.servers[index].tag),
            titleTextStyle: const TextStyle(color: white),
            trailing: ReorderableDragStartListener(
              index: index,
              child: const Icon(
                Icons.drag_handle,
                color: white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ServerTabWidget(index: index),
                ),
              ).then((_) => setState(() {}));
            },
          ),
        );
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.dnsServers),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            divider,
            if (serversList.isNotEmpty)
              ReorderableListView(
                buildDefaultDragHandles: false,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                children: serversList,
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    // final Widget item = serversList.removeAt(oldIndex);
                    // serversList.insert(newIndex, item);
                    final DNSServerStore actualItem =
                        DNSServersStore.servers.removeAt(oldIndex);
                    DNSServersStore.servers.insert(newIndex, actualItem);
                  });
                },
              ),
            if (serversList.isNotEmpty) divider,
            ListTile(
              title: Text(AppLocalizations.of(context)!.dnsServersAdd),
              titleTextStyle: const TextStyle(color: white),
              trailing: const Icon(
                Icons.add,
                color: white,
              ),
              onTap: () {
                setState(() {
                  final newItem = DNSServerStore();
                  newItem.tag = 'New Item';
                  DNSServersStore.servers.add(newItem);
                });
              },
            ),
            divider,
            ListTile(
              title: Text(AppLocalizations.of(context)!.dnsServersDelete),
              titleTextStyle: const TextStyle(color: white),
              trailing: const Icon(
                Icons.delete,
                color: white,
              ),
              onTap: () {
                if (DNSServersStore.servers.isNotEmpty) {
                  setState(() {
                    final _ = DNSServersStore.servers.removeLast();
                  });
                }
              },
            ),
            divider,
          ],
        ),
      ),
    );
  }
}

class ServerTabWidget extends StatefulWidget {
  final int index;
  const ServerTabWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<ServerTabWidget> createState() => _ServerTabWidgetState();
}

class _ServerTabWidgetState extends State<ServerTabWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.dnsServer),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(height: dividerHeight),
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSServersStore.servers[widget.index].checkedTag,
              onChanged: (bool? value) {
                setState(() {
                  DNSServersStore.servers[widget.index].checkedTag = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.dnsServerTag,
                style: const TextStyle(color: white),
              ),
            ),
            DNSServersStore.servers[widget.index].checkedTag
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue:
                              DNSServersStore.servers[widget.index].tag,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .dnsServerTagHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              DNSServersStore.servers[widget.index].tag =
                                  inputString;
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
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSServersStore.servers[widget.index].checkedAddress,
              onChanged: (bool? value) {
                setState(() {
                  DNSServersStore.servers[widget.index].checkedAddress = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.dnsServerAddress,
                style: const TextStyle(color: white),
              ),
            ),
            DNSServersStore.servers[widget.index].checkedAddress
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue:
                              DNSServersStore.servers[widget.index].address,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .dnsServerAddressHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              DNSServersStore.servers[widget.index].address =
                                  inputString;
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
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSServersStore.servers[widget.index].checkedAR,
              onChanged: (bool? value) {
                setState(() {
                  DNSServersStore.servers[widget.index].checkedAR = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.dnsServerAR,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.dnsServerARSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            DNSServersStore.servers[widget.index].checkedAR
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: DNSServersStore
                              .servers[widget.index].addressResolver,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .dnsServerARHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              DNSServersStore.servers[widget.index]
                                  .addressResolver = inputString;
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
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSServersStore.servers[widget.index].checkedAS,
              onChanged: (bool? value) {
                setState(() {
                  DNSServersStore.servers[widget.index].checkedAS = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.dnsServerAS,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.dnsServerASSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            DNSServersStore.servers[widget.index].checkedAS
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          value: DNSServersStore
                              .servers[widget.index].addressStrategy,
                          items: DNSServersStore
                              .servers[widget.index].strategyList
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: white),
                              ),
                            );
                          }).toList(),
                          onChanged: (selectedValue) {
                            setState(() {
                              DNSServersStore.servers[widget.index]
                                  .addressStrategy = selectedValue!;
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
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSServersStore.servers[widget.index].checkedStrategy,
              onChanged: (bool? value) {
                setState(() {
                  DNSServersStore.servers[widget.index].checkedStrategy =
                      value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.dnsServerStrategy,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.dnsServerStrategySubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            DNSServersStore.servers[widget.index].checkedStrategy
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          value: DNSServersStore.servers[widget.index].strategy,
                          items: DNSServersStore
                              .servers[widget.index].strategyList
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: white),
                              ),
                            );
                          }).toList(),
                          onChanged: (selectedValue) {
                            setState(() {
                              DNSServersStore.servers[widget.index].strategy =
                                  selectedValue!;
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
            CheckboxListTile(
              hoverColor: gray,
              activeColor: actionColor,
              controlAffinity: ListTileControlAffinity.leading,
              value: DNSServersStore.servers[widget.index].checkedDetour,
              onChanged: (bool? value) {
                setState(() {
                  DNSServersStore.servers[widget.index].checkedDetour = value!;
                });
              },
              title: Text(
                AppLocalizations.of(context)!.dnsServerDetour,
                style: const TextStyle(color: white),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.dnsServerDetourSubtitle,
                style: const TextStyle(color: gray),
              ),
            ),
            DNSServersStore.servers[widget.index].checkedDetour
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue:
                              DNSServersStore.servers[widget.index].detour,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .dnsServerDetourHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              DNSServersStore.servers[widget.index].detour =
                                  inputString;
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
