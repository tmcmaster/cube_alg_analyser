import 'package:flutter/material.dart';

class ResponsiveCard extends StatelessWidget {
  final Widget? picture;
  final Widget? title;
  final Widget? subtitle;
  final List<Widget>? tags;
  final List<Widget>? actions;
  final Axis orientation;

  const ResponsiveCard({
    super.key,
    this.picture,
    this.title,
    this.subtitle,
    this.actions,
    this.tags,
    this.orientation = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return orientation == Axis.vertical
        ? _VerticalCard(
            header: title,
            leading: subtitle,
            body: picture,
            trailing: tags == null
                ? null
                : Wrap(
                    alignment: WrapAlignment.center,
                    children: tags!,
                  ),
            footer: actions == null
                ? null
                : Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: actions!,
                  ),
          )
        : _HorizontalCard(
            header: title,
            leading: picture,
            body: subtitle,
            trailing: tags == null
                ? null
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: tags!,
                  ),
            footer: actions == null
                ? null
                : Wrap(
                    alignment: WrapAlignment.spaceAround,
                    children: actions!,
                  ),
          );
  }
}

class _HorizontalCard extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Widget? footer;
  final Widget? leading;
  final Widget? trailing;

  const _HorizontalCard({
    super.key,
    this.header,
    this.body,
    this.footer,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (leading != null) leading!,
        if (body != null || header != null || footer != null)
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (header != null) header!,
                if (body != null) body!,
                if (footer != null) footer!,
              ],
            ),
          ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class _VerticalCard extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Widget? footer;
  final Widget? leading;
  final Widget? trailing;

  const _VerticalCard({
    super.key,
    this.header,
    this.body,
    this.footer,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (header != null) header!,
          if (leading != null) leading!,
          if (body != null) body!,
          if (trailing != null) trailing!,
          if (footer != null) footer!,
        ],
      ),
    );
  }
}
