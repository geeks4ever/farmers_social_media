
import 'package:flutter/material.dart';

class HomeFeed extends StatefulWidget {
  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed>
    with SingleTickerProviderStateMixin {
  final TrackingScrollController scrollController = TrackingScrollController();
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SafeArea(
        child: DefaultTabController(
          length: 4,
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: SliverAppBar(
                      pinned: false,
                      brightness: Brightness.light,
                      backgroundColor: Colors.white,
                      title: Text(
                        'FarmerSocial ',
                        style: const TextStyle(
                          color: Color(0xFF1777F2),
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1.2,
                        ),
                      ),
                      centerTitle: false,
                      floating: true,
                      actions: [
                        IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.black,
                          iconSize: 25.0,
                          onPressed: () => print('Search'),
                        ),
                        IconButton(
                          icon: Icon(Icons.message),
                          color: Colors.black,
                          iconSize: 25.0,
                          onPressed: () => print('Messenger'),
                        ),
                      ],
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        controller: controller,
                        labelColor: Color(0xFF1777F2),
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(icon: Icon(Icons.home, size: 25)),
                          Tab(icon: Icon(Icons.ondemand_video, size: 25)),
                          Tab(icon: Icon(Icons.notifications, size: 25)),
                          Tab(icon: Icon(Icons.menu, size: 25)),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                controller: controller,
                children: [
                  Center(
                    child: Text('Homefeed'),
                  ),
                  Center(
                    child: Text('Videos'),
                  ),
                  Center(
                    child: Text('Notification'),
                  ),
                  Center(
                    child: Text('Morer'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
