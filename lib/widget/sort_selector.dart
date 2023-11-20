import 'package:flutter/material.dart';
import 'package:wt_models/wt_models.dart';

class SortSelector<T extends TitleSupport> extends StatefulWidget {
  final List<T> options;
  final Color? backgroundColor;
  final Function(T) onChange;

  const SortSelector({
    required this.options,
    this.backgroundColor,
    required this.onChange,
  });

  @override
  _MyChipGroupState createState() => _MyChipGroupState<T>();
}

class _MyChipGroupState<T extends TitleSupport> extends State<SortSelector<T>> {
  late T selectedValue;

  @override
  void initState() {
    selectedValue = widget.options.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.0,
      children: widget.options.map((option) {
        return InputChip(
          backgroundColor: Colors.transparent,
          // selectedColor: Colors.transparent,
          // disabledColor: Colors.transparent,
          // surfaceTintColor: Colors.transparent,
          // shadowColor: Colors.transparent,
          // color: MaterialStateProperty.all(Colors.transparent),
          label: Text(option.getTitle()),
          selected: selectedValue == option,
          onSelected: (bool selected) {
            if (selected) {
              setState(() {
                selectedValue = option;
              });
              widget.onChange(option);
            }
          },
        );
      }).toList(),
    );
  }
}
