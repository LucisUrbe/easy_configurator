import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../store.dart';

class RuleSetsTabWidget extends StatefulWidget {
  const RuleSetsTabWidget({super.key});

  @override
  State<RuleSetsTabWidget> createState() => _RuleSetsTabWidgetState();
}

class _RuleSetsTabWidgetState extends State<RuleSetsTabWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    const divider = Divider(height: dividerHeight);
    List<Widget> ruleSetsList = [];
    if (RouteRuleSetsStore.ruleSet.isNotEmpty) {
      for (int index = 0;
          index < RouteRuleSetsStore.ruleSet.length;
          index += 1) {
        ruleSetsList.add(
          ListTile(
            key: Key('$index'),
            title: Text(RouteRuleSetsStore.ruleSet[index].tag),
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
                  builder: (context) => RuleSetTabWidget(index: index),
                ),
              ).then((_) => setState(() {}));
            },
          ),
        );
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.routeRuleSet),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            divider,
            if (ruleSetsList.isNotEmpty)
              ReorderableListView(
                buildDefaultDragHandles: false,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                children: ruleSetsList,
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final RouteRuleSetStore actualItem =
                        RouteRuleSetsStore.ruleSet.removeAt(oldIndex);
                    RouteRuleSetsStore.ruleSet.insert(newIndex, actualItem);
                  });
                },
              ),
            if (ruleSetsList.isNotEmpty) divider,
            ListTile(
              title: Text(AppLocalizations.of(context)!.dnsServersAdd),
              titleTextStyle: const TextStyle(color: white),
              trailing: const Icon(
                Icons.add,
                color: white,
              ),
              onTap: () {
                setState(() {
                  final newItem = RouteRuleSetStore();
                  newItem.tag = AppLocalizations.of(context)!.newItem;
                  RouteRuleSetsStore.ruleSet.add(newItem);
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
                if (RouteRuleSetsStore.ruleSet.isNotEmpty) {
                  setState(() {
                    final _ = RouteRuleSetsStore.ruleSet.removeLast();
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

class RuleSetTabWidget extends StatefulWidget {
  final int index;

  const RuleSetTabWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<RuleSetTabWidget> createState() => _RuleSetTabWidgetState();
}

class _RuleSetTabWidgetState extends State<RuleSetTabWidget> {
  @override
  Widget build(BuildContext context) {
    const dividerHeight = 5.0;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.routeRuleSetSingular),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Divider(height: dividerHeight),
            ListTile(
              hoverColor: gray,
              title: Text(
                AppLocalizations.of(context)!.routeRuleSetType,
                style: const TextStyle(color: white),
              ),
            ),
            Row(
              children: [
                const VerticalDivider(
                  width: 20.0,
                ),
                Expanded(
                  child: DropdownButton(
                      isExpanded: true,
                      value: RouteRuleSetsStore.ruleSet[widget.index].type,
                      items: RouteRuleSetsStore.ruleSet[widget.index].typeList
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
                          RouteRuleSetsStore.ruleSet[widget.index].type =
                              selectedValue!;
                          if (selectedValue == 'local') {
                            RouteRuleSetsStore
                                .ruleSet[widget.index].checkedPath = true;
                            RouteRuleSetsStore
                                .ruleSet[widget.index].checkedURL = false;
                            RouteRuleSetsStore
                                .ruleSet[widget.index].checkedDowDet = false;
                            RouteRuleSetsStore
                                .ruleSet[widget.index].checkedUpdInv = false;
                          }
                          if (selectedValue == 'remote') {
                            RouteRuleSetsStore
                                .ruleSet[widget.index].checkedPath = false;
                            RouteRuleSetsStore
                                .ruleSet[widget.index].checkedURL = true;
                            RouteRuleSetsStore
                                .ruleSet[widget.index].checkedDowDet = true;
                            RouteRuleSetsStore
                                .ruleSet[widget.index].checkedUpdInv = true;
                          }
                        });
                      }),
                ),
                const VerticalDivider(
                  width: 20.0,
                ),
              ],
            ),
            const Divider(height: dividerHeight),
            ListTile(
              hoverColor: gray,
              title: Text(
                AppLocalizations.of(context)!.routeRuleSetTag,
                style: const TextStyle(color: white),
              ),
            ),
            Row(
              children: [
                const VerticalDivider(
                  width: 20.0,
                ),
                Expanded(
                  child: TextFormField(
                    initialValue: RouteRuleSetsStore.ruleSet[widget.index].tag,
                    cursorColor: gray,
                    style: const TextStyle(color: white),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: white),
                      ),
                      hintText:
                          AppLocalizations.of(context)!.routeRuleSetTagHintText,
                      hintStyle: const TextStyle(color: gray),
                    ),
                    onChanged: (inputString) {
                      setState(() {
                        RouteRuleSetsStore.ruleSet[widget.index].tag =
                            inputString;
                      });
                    },
                  ),
                ),
                const VerticalDivider(
                  width: 20.0,
                ),
              ],
            ),
            const Divider(height: dividerHeight),
            ListTile(
              hoverColor: gray,
              title: Text(
                AppLocalizations.of(context)!.routeRuleSetFormat,
                style: const TextStyle(color: white),
              ),
            ),
            Row(
              children: [
                const VerticalDivider(
                  width: 20.0,
                ),
                Expanded(
                  child: DropdownButton(
                      isExpanded: true,
                      value: RouteRuleSetsStore.ruleSet[widget.index].format,
                      items: RouteRuleSetsStore.ruleSet[widget.index].formatList
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
                          RouteRuleSetsStore.ruleSet[widget.index].format =
                              selectedValue!;
                        });
                      }),
                ),
                const VerticalDivider(
                  width: 20.0,
                ),
              ],
            ),
            const Divider(height: dividerHeight),
            RouteRuleSetsStore.ruleSet[widget.index].checkedPath
                ? ListTile(
                    hoverColor: gray,
                    title: Text(
                      AppLocalizations.of(context)!.routeRuleSetPath,
                      style: const TextStyle(color: white),
                    ),
                  )
                : Container(),
            RouteRuleSetsStore.ruleSet[widget.index].checkedPath
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue:
                              RouteRuleSetsStore.ruleSet[widget.index].path,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .routeRuleSetPathHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              RouteRuleSetsStore.ruleSet[widget.index].path =
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
            RouteRuleSetsStore.ruleSet[widget.index].checkedURL
                ? ListTile(
                    hoverColor: gray,
                    title: Text(
                      AppLocalizations.of(context)!.routeRuleSetURL,
                      style: const TextStyle(color: white),
                    ),
                  )
                : Container(),
            RouteRuleSetsStore.ruleSet[widget.index].checkedURL
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue:
                              RouteRuleSetsStore.ruleSet[widget.index].url,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .routeRuleSetURLHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              RouteRuleSetsStore.ruleSet[widget.index].url =
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
            RouteRuleSetsStore.ruleSet[widget.index].checkedDowDet
                ? ListTile(
                    hoverColor: gray,
                    title: Text(
                      AppLocalizations.of(context)!.routeRuleSetDowDet,
                      style: const TextStyle(color: white),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)!.routeRuleSetDowDetSubtitle,
                      style: const TextStyle(color: gray),
                    ),
                  )
                : Container(),
            RouteRuleSetsStore.ruleSet[widget.index].checkedDowDet
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: RouteRuleSetsStore
                              .ruleSet[widget.index].downloadDetour,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .routeRuleSetDowDetHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              RouteRuleSetsStore.ruleSet[widget.index]
                                  .downloadDetour = inputString;
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
            RouteRuleSetsStore.ruleSet[widget.index].checkedUpdInv
                ? ListTile(
                    hoverColor: gray,
                    title: Text(
                      AppLocalizations.of(context)!.routeRuleSetUpdInv,
                      style: const TextStyle(color: white),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)!.routeRuleSetUpdInvSubtitle,
                      style: const TextStyle(color: gray),
                    ),
                  )
                : Container(),
            RouteRuleSetsStore.ruleSet[widget.index].checkedUpdInv
                ? Row(
                    children: [
                      const VerticalDivider(
                        width: 20.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue: RouteRuleSetsStore
                              .ruleSet[widget.index].updateInterval,
                          cursorColor: gray,
                          style: const TextStyle(color: white),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: white),
                            ),
                            hintText: AppLocalizations.of(context)!
                                .routeRuleSetUpdInvHintText,
                            hintStyle: const TextStyle(color: gray),
                          ),
                          onChanged: (inputString) {
                            setState(() {
                              RouteRuleSetsStore.ruleSet[widget.index]
                                  .updateInterval = inputString;
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
