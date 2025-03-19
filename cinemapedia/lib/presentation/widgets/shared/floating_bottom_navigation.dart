import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';


// class FloatingBottomNavigation extends StatelessWidget {
//   FloatingBottomNavigation({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//           backgroundColor: Colors.black,
//         ),
//         body: BottomBar(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Card(
//               elevation: 10,
//               child: Container(
//                 height: 46,
//                 child: TextField(
//                   // style: Theme.of(context).textTheme.subtitle2,
//                   maxLines: 1,
//                   minLines: 1,
//                   textCapitalization: TextCapitalization.sentences,
//                   cursorColor: Theme.of(context).primaryColor,
//                   decoration: InputDecoration(
//                     suffixIcon: Icon(Icons.search),
//                     contentPadding: const EdgeInsets.all(16),
//                     // hintStyle: Theme.of(context).textTheme.subtitle2,
//                     hintText: 'Search...',
//                     border: InputBorder.none,
//                     // labelStyle: Theme.of(context).textTheme.subtitle2,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           fit: StackFit.expand,
//           borderRadius: BorderRadius.circular(12),
//           duration: Duration(milliseconds: 300),
//           curve: Curves.decelerate,
//           showIcon: false,
//           width: MediaQuery.of(context).size.width - 32,
//           barColor: Colors.transparent,
//           start: 20,
//           end: 0,
//           offset: 10,
//           barAlignment: Alignment.bottomCenter,
//           hideOnScroll: true,
//           body: (context, controller) => Container(
//             height: 100,
//             width: 200,
//             color: Colors.red,
//             child: ListView.builder(
//               itemCount: 200,
//               itemBuilder: (context, index) => Center(child: Text('data')),)
//             ),
//         ),
//       ),
//     );
//   }
// }

//STATE FULL WIDEGET
class FloatingBottomNavigation extends StatefulWidget {
  FloatingBottomNavigation({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  FloatingBottomNavigationState createState() => FloatingBottomNavigationState();
}

//ONFLOATING ACCTION BUTTON

// class FloatingBottomNavigationState extends State<FloatingBottomNavigation> with SingleTickerProviderStateMixin {
//   late int currentPage;
//   late TabController tabController;
//   final List<Color> colors = [
//     Colors.yellow,
//     Colors.red,
//     Colors.green,
//     Colors.blue,
//     Colors.pink,
//   ];

//   @override
//   void initState() {
//     currentPage = 0;
//     tabController = TabController(length: 5, vsync: this);
//     tabController.animation?.addListener(
//       () {
//         final value = tabController.animation!.value.round();
//         if (value != currentPage && mounted) {
//           changePage(value);
//         }
//       },
//     );
//     super.initState();
//   }

//   void changePage(int newPage) {
//     setState(() {
//       currentPage = newPage;
//     });
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Color unselectedColor = colors[currentPage].computeLuminance() < 0.5 ? Colors.black : Colors.white;
//     final Color unselectedColorReverse = colors[currentPage].computeLuminance() < 0.5 ? Colors.white : Colors.black;

//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//           backgroundColor: Colors.black,
//         ),
//         body: BottomBar(
//           clip: Clip.none,
//           child: Stack(
//             alignment: Alignment.center,
//             clipBehavior: Clip.none,
//             children: [
//               TabBar(
//                 indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
//                 controller: tabController,
//                 indicator: UnderlineTabIndicator(
//                     borderSide: BorderSide(
//                       color: currentPage <= 4 ? colors[currentPage] : unselectedColor,
//                       width: 4,
//                     ),
//                     insets: EdgeInsets.fromLTRB(16, 0, 16, 8)),
//                 tabs: [
//                   SizedBox(
//                     height: 55,
//                     width: 40,
//                     child: Center(
//                         child: Icon(
//                       Icons.home,
//                       color: currentPage == 0 ? colors[0] : unselectedColor,
//                     )),
//                   ),
//                   SizedBox(
//                     height: 55,
//                     width: 40,
//                     child: Center(
//                       child: Icon(
//                         Icons.search,
//                         color: currentPage == 1 ? colors[1] : unselectedColor,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 55,
//                     width: 40,
//                     child: Center(
//                       child: Icon(
//                         Icons.add,
//                         color: currentPage == 2 ? colors[2] : unselectedColorReverse,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 55,
//                     width: 40,
//                     child: Center(
//                       child: Icon(
//                         Icons.favorite,
//                         color: currentPage == 3 ? colors[3] : unselectedColor,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 55,
//                     width: 40,
//                     child: Center(
//                       child: Icon(
//                         Icons.settings,
//                         color: currentPage == 4 ? colors[4] : unselectedColor,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Positioned(
//                 top: -25,
//                 child: FloatingActionButton(
//                   onPressed: () {},
//                   child: Icon(Icons.add),
//                 ),
//               )
//             ],
//           ),
//           fit: StackFit.expand,
//           icon: (width, height) => Center(
//             child: IconButton(
//               padding: EdgeInsets.zero,
//               onPressed: null,
//               icon: Icon(
//                 Icons.arrow_upward_rounded,
//                 color: unselectedColor,
//                 size: width,
//               ),
//             ),
//           ),
//           borderRadius: BorderRadius.circular(500),
//           duration: Duration(milliseconds: 500),
//           curve: Curves.decelerate,
//           showIcon: true,
//           width: MediaQuery.of(context).size.width * 0.8,
//           barColor: colors[currentPage].computeLuminance() > 0.5 ? Colors.black : Colors.white,
//           start: 2,
//           end: 0,
//           offset: 10,
//           barAlignment: Alignment.bottomCenter,
//           iconHeight: 30,
//           iconWidth: 30,
//           reverse: false,
//           hideOnScroll: true,
//           scrollOpposite: false,
//           onBottomBarHidden: () {},
//           onBottomBarShown: () {},
//           body: (context, controller) => TabBarView(
//             controller: tabController,
//             dragStartBehavior: DragStartBehavior.down,
//             physics: const BouncingScrollPhysics(),
//             children: colors
//                 .map(
//                   (e) => Container(
//                     height: 100,
//                     width: 200,
//                     color: e,
//                     child: Center(child: Text('data'))),
//                 )
//                 .toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }

class FloatingBottomNavigationState extends State<FloatingBottomNavigation> with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink,
  ];

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation?.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color unselectedColor = colors[currentPage].computeLuminance() < 0.5 ? Colors.black : Colors.white;
    final Color unselectedColorReverse = colors[currentPage].computeLuminance() < 0.5 ? Colors.white : Colors.black;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.black,
        ),
        body: BottomBar(
          clip: Clip.none,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              TabBar(
                indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                controller: tabController,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: currentPage <= 4 ? colors[currentPage] : unselectedColor,
                      width: 4,
                    ),
                    insets: EdgeInsets.fromLTRB(16, 0, 16, 8)),
                tabs: [
                  SizedBox(
                    height: 55,
                    width: 40,
                    child: Center(
                        child: Icon(
                      Icons.home,
                      color: currentPage == 0 ? colors[0] : unselectedColor,
                    )),
                  ),
                  SizedBox(
                    height: 55,
                    width: 40,
                    child: Center(
                      child: Icon(
                        Icons.search,
                        color: currentPage == 1 ? colors[1] : unselectedColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 40,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: currentPage == 2 ? colors[2] : unselectedColorReverse,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 40,
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: currentPage == 3 ? colors[3] : unselectedColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 40,
                    child: Center(
                      child: Icon(
                        Icons.settings,
                        color: currentPage == 4 ? colors[4] : unselectedColor,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: -25,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
          fit: StackFit.expand,
          icon: (width, height) => Center(
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: null,
              icon: Icon(
                Icons.home,
                color: unselectedColor,
                size: width,
              ),
            ),
          ),
          borderRadius: BorderRadius.circular(500),
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
          showIcon: true,
          width: MediaQuery.of(context).size.width * 0.8,
          barColor: colors[currentPage].computeLuminance() > 0.5 ? Colors.black : Colors.white,
          start: 2,
          end: 0,
          offset: 10,
          barAlignment: Alignment.bottomCenter,
          iconHeight: 30,
          iconWidth: 30,
          reverse: false,
          hideOnScroll: true,
          scrollOpposite: false,
          onBottomBarHidden: () {},
          onBottomBarShown: () {},
          body: (context, controller) => TabBarView(
            controller: tabController,
            dragStartBehavior: DragStartBehavior.down,
            physics: const BouncingScrollPhysics(),
            children: colors
                .map(
                  (e) => InfiniteListPage(
                  key: ValueKey('infinite_list_key#${e.toString()}'),
                  controller: controller,
                  color: e,
                ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}


class InfiniteListPage extends StatelessWidget {
  final Color color;
  final ScrollController controller;
  const InfiniteListPage(
      {required this.color, required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      // reverse: true,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {},
          tileColor: color,
          title: Text("$index"),
        );
      },
    );
  }
}