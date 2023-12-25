import 'package:cube_alg_analyser/model/algorithm.dart';
import 'package:cube_alg_analyser/model/last_layer_case.dart';
import 'package:cube_alg_analyser/widget/sticker_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wt_app_scaffold/app_scaffolds.dart';

class LastLayerCaseCard extends ConsumerWidget {
  final LastLayerCase lastLayerCase;

  const LastLayerCaseCard({
    super.key,
    required this.lastLayerCase,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ResponsiveCard(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                lastLayerCase.id,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  ref.read(GoRouterMenuApp.goRouter).push(
                        '/cube',
                        extra: lastLayerCase.algorithms.first.movesString,
                      );
                },
                icon: const Icon(
                  Icons.play_arrow,
                ),
              ),
            ],
          ),
          subtitle: LastLayerAlgorithmWidget(
            algorithm: lastLayerCase.algorithms.first,
          ),
          picture: SizedBox(
            height: 150,
            child: StickerCase(
              stickers: lastLayerCase.stickers,
            ),
          ),
          actions: [
            Text(
              lastLayerCase.group,
              style: textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}

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
        ? VerticalCard(
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
        : HorizontalCard(
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

class HorizontalCard extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Widget? footer;
  final Widget? leading;
  final Widget? trailing;

  const HorizontalCard({
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

class VerticalCard extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Widget? footer;
  final Widget? leading;
  final Widget? trailing;

  const VerticalCard({
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

class LastLayerAlgorithmWidget extends StatelessWidget {
  final Algorithm algorithm;

  const LastLayerAlgorithmWidget({
    super.key,
    required this.algorithm,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: algorithm.moves
          .map(
            (m) => Text(
              m.join(' '),
              style: textTheme.titleMedium,
            ),
          )
          .toList(),
    );
  }
}
