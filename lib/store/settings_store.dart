import 'package:wt_settings/wt_settings.dart';

mixin SettingsStore {
  static final annotateAlgorithms = SettingsBoolProviders(
    key: '__ANNOTATE_ALGORITHMS__',
    initialValue: false,
    label: 'Annotate Algorithms',
    hint: 'Add annotations to algorithms',
  );
  static final hidNonAnnotated = SettingsBoolProviders(
    key: '__HIDE_NON_ANNOTATED__',
    initialValue: false,
    label: 'Hi Not-annotated Algorithms',
    hint: 'Hide algorithms that are not annotated',
  );
  static final sequenceMinimum = SettingsIntProviders(
    key: '__SEQUENCES_MINIMUM__',
    none: 2,
    label: 'Sequence Minimum',
    hint: 'Minimum number of sequence replication',
    min: 2,
    max: 10,
  );
  static final sequenceLength = SettingsIntProviders(
    key: '__SEQUENCES_LENGTH__',
    none: 4,
    label: 'Sequence Length',
    hint: 'Length of the repeated sequence',
    min: 4,
    max: 10,
  );
}
