import 'package:cube_alg_analyser/store/settings_store.dart';
import 'package:flutter/material.dart';
import 'package:wt_app_scaffold/scaffolds/page/bottom_drawer_page/settings_page.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsPage(
      children: [
        SettingsStore.sequenceLength.component,
        SettingsStore.sequenceMinimum.component,
        SettingsStore.annotateAlgorithms.component,
        SettingsStore.hidNonAnnotated.component,
      ],
    );
  }
}
