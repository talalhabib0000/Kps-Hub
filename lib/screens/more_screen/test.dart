import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kps_hub/screens/screens.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with TickerProviderStateMixin {
  AnimationController? animationController;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Column(
              children: [
                AppBar(
                  title: const Text(
                    'testing',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Expanded(
                    child: NestedScrollView(
                        controller: _scrollController,
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return [
                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                              return Column(
                                children: [
                                  CarouselSlider(
                                    items: [
                                      Container(
                                        margin: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://via.placeholder.com/350x150"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://via.placeholder.com/350x150"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                                "https://via.placeholder.com/350x150"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                    options: CarouselOptions(
                                      height: 380.0,
                                      enlargeCenterPage: true,
                                      autoPlay: true,
                                      aspectRatio: 16 / 9,
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      enableInfiniteScroll: true,
                                      autoPlayAnimationDuration:
                                          const Duration(milliseconds: 800),
                                      viewportFraction: 0.8,
                                    ),
                                  )
                                ],
                              );
                            }, childCount: 1)),
                            SliverPersistentHeader(
                              pinned: true,
                              floating: true,
                              delegate: ContestTabHeader(getFilterBarUI()),
                            ),
                          ];
                        },
                        body: Container(
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.0,
                                  mainAxisSpacing: 4.0,
                                  crossAxisSpacing: 4.0,
                                ),
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  const int count = 10;
                                  final Animation<double> animation =
                                      Tween<double>(begin: 0.0, end: 1.0)
                                          .animate(CurvedAnimation(
                                              parent: animationController!,
                                              curve: Interval(
                                                  (1 / count) * index, 1.0,
                                                  curve:
                                                      Curves.fastOutSlowIn)));
                                  animationController?.forward();
                                  return Container(
                                    color: Colors.blueGrey[300],
                                    child: Center(
                                      child: Text(
                                        'Item $index',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                    ),
                                  );
                                }))))
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget getFilterBarUI() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              color: Colors.red,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(0, -2),
                    blurRadius: 8.0),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.yellow,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
            child: Row(
              children: <Widget>[
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '530 hotels found',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) =>
                                const HomeScreen(),
                            fullscreenDialog: true),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: const <Widget>[
                          Text(
                            'Filter',
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Divider(
            height: 1,
          ),
        )
      ],
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  ContestTabHeader(
    this.searchUI,
  );
  final Widget searchUI;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
