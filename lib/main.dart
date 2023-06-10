import 'package:flutter/material.dart';
import 'package:bottom_navigation_bar/screens/screen1.dart';
import 'package:bottom_navigation_bar/screens/screen2.dart';
import 'package:bottom_navigation_bar/screens/screen3.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainNavigator(),
    );
  }
}

class MainNavigator extends StatefulWidget {
  const MainNavigator({Key? key}) : super(key: key);

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_selectedIndex].currentState!.maybePop();

        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 90.0,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: '홈',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  void onNext() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Screen22()));
  }

  Map<String, WidgetBuilder> _routeBuilders( BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          const Screen1(),
          Screen2(
            onNext: () => onNext(),
          ),
          const Screen3(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}
