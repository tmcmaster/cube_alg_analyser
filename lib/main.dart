import 'package:cube_alg_analyser/screen/landing_page.dart';
import 'package:cube_alg_analyser/screen/settings_screen.dart';
import 'package:cube_alg_analyser/screen/test_cube_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wt_app_scaffold/app_scaffolds.dart';
import 'package:wt_app_scaffold/models/app_styles.dart';

void main() {
  runMyApp(
    withAppScaffold(
      appDefinition: CubeAlgAnaliser.definition,
      appDetails: CubeAlgAnaliser.details,
      appStyles: CubeAlgAnaliser.styles,
    ),
  );
}

mixin CubeAlgAnaliser {
  static final details = Provider<AppDetails>(
    name: 'App Details',
    (ref) => AppDetails(
      title: 'Cube Algorithm Analyser',
      subTitle: '',
      iconPath: 'assets/wt_logo.png',
    ),
  );

  static final definition = Provider<AppDefinition>(
    name: 'App Definition',
    (ref) => AppDefinition.from(
      appTitle: 'Cube Algorithm Analyser',
      appName: 'CubeAlgorithmAnalyser',
      swipeEnabled: true,
      includeAppBar: true,
      appDetailsProvider: details,
      applicationType: ApplicationType.goRouterMenu,
      pages: [
        PageDefinition(
          title: 'Landing Page',
          icon: FontAwesomeIcons.cube,
          debug: false,
          builder: (_, __, ___) => const LandingPage(),
          primary: true,
          scaffoldType: ScaffoldType.transparentCard,
        ),
        PageDefinition(
          title: 'Settings',
          icon: Icons.settings,
          primary: true,
          scaffoldType: ScaffoldType.transparentCard,
          builder: (context, __, ___) => const SettingsScreen(),
        ),
        PageDefinition(
          title: 'Test',
          icon: FontAwesomeIcons.triangleExclamation,
          primary: true,
          scaffoldType: ScaffoldType.transparentCard,
          builder: (context, __, ___) => const TestCubePage(),
        ),
      ],
    ),
  );

  static final styles = Provider<AppStyles>(
    name: 'AppTwo Styles',
    (ref) => GoRouterMenuApp.styles,
  );
}
