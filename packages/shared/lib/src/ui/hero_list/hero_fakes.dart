// ignore_for_file: public_member_api_docs

part of './hero_list.dart';

@visibleForTesting
HeroList fakeHeroList() => HeroList(
      onRefresh: _fakeRefresh,
      flexibleSpaceBar: _fakeFlexibleSpaceBar,
      doubledList: fakeDoubledSliverList(),
    );

const _fakeFlexibleSpaceBar = FlexibleSpaceBar(
  title: Text(
    'SliverAppBar',
    textAlign: TextAlign.left,
  ),
  background: FlutterLogo(),
);

RefreshCallback get _fakeRefresh => () {
      return Future<void>.delayed(const Duration(seconds: 3));
    };
