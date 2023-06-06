import 'package:detail_page/src/blocks/details/detail_bloc.dart';
import 'package:detail_page/src/ui/detail_page_state_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shared/shared_helpers.dart';

/// Detail page for movies and tv shows
class DetailPage extends StatelessWidget {
  /// Init with Detail page bloc
  const DetailPage(this.bloc, {super.key});

  /// nodoc
  final DetailBloc bloc;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => bloc),
        ],
        child: _buildView(context),
      );

  Widget _buildView(BuildContext context) {
    if (_useLargeScreenLayout(context) == false) {
      return PlatformScaffold(
        body: _buildCore(context),
      );
    } else {
      return PlatformScaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: _getGradientColors(context),
                ),
              ),
            ),
            Center(
              child: FractionallySizedBox(
                widthFactor: _largeScreenLayoutWidthMultiplier(context),
                // heightFactor: _largeScreenLayoutHeightMultiplier,
                child: _buildCore(context),
              ),
            )
          ],
        ),
      );
    }
  }

  Widget _buildCore(BuildContext context) {
    return BlocConsumer<DetailBloc, DetailState>(
      builder: buildWidgetWithState,
      listener: (context, state) {},
    );
  }
}

bool _useLargeScreenLayout(BuildContext context) =>
    MediaQuery.of(context).size.width > 550;

double _largeScreenLayoutWidthMultiplier(BuildContext context) {
  switch (getTshirtSizeFor(context)) {
    case TshirtSize.S:
      return 1;
    case TshirtSize.M:
      return 0.8;
    case TshirtSize.L:
      return 0.65;
  }
}

List<Color> _getGradientColors(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark
        ? const [
            Colors.black54,
            Colors.black,
          ]
        : const [
            Colors.white70,
            Colors.white,
          ];
