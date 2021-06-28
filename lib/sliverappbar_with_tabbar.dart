import 'package:flutter/material.dart';

class SliverAppBarWithTabBar extends StatefulWidget {
  @override
  _SliverAppBarWithTabBarState createState() => _SliverAppBarWithTabBarState();
}

class _SliverAppBarWithTabBarState extends State<SliverAppBarWithTabBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  pinned: false,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Goa', textScaleFactor: 1),
                    background: Image.asset(
                      'assets/images/beach.png',
                      fit: BoxFit.fill,
                    ),
                    stretchModes: [StretchMode.zoomBackground],
                  ),
                  //collapsedHeight: 100,
                ),
                SliverPersistentHeader(
                  delegate: MySliverPersistentHeaderDelegate(
                    TabBar(
                      tabs: [
                        Tab(icon: Icon(Icons.flight)),
                        Tab(icon: Icon(Icons.directions_transit)),
                        Tab(icon: Icon(Icons.directions_car)),
                      ],
                    ),
                  ),
                  pinned: false,
                ),
              ];
            },
            body: TabBarView(
              children: [
                Icon(Icons.flight, size: 350),
                Icon(Icons.directions_transit, size: 350),
                Icon(Icons.directions_car, size: 350),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistentHeaderDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(MySliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
