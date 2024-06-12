import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/auth/auth_controller.dart';
import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/shared/theme.dart';
import 'package:flutter_smartbawangv2/state/page/dashboard.dart';
import 'package:flutter_smartbawangv2/state/page/inventory/inventory.dart';
import 'package:flutter_smartbawangv2/state/page/profile_page.dart';
import 'package:flutter_smartbawangv2/state/page/statistic_and_records/statisticpage.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  final User user;
  const MainPage({
    super.key,
    required this.user,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => PageIndexProvider(),
        child: _MainPage(
          user: user,
        ));
  }
}

class _MainPage extends StatefulWidget {
  final User user;
  const _MainPage({required this.user});

  @override
  State<_MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  final AuthController authController = AuthController();
  List<Widget> get pages => [
        DashboardPage(
          user: widget.user,
        ),
        InventoryPage(),
        StatisticPage(),
        ProfileMenuPage(),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Consumer<PageIndexProvider>(
        builder: (context, pageIndexProvider, _) {
          return Container(
            height: 58,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                  spreadRadius: 0)
            ]),
            child: ClipRRect(
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  selectedItemColor: AppTheme.primaryColor,
                  unselectedItemColor: AppTheme.passiveColor,
                  currentIndex: pageIndexProvider.index,
                  onTap: (index) {
                    setState(() {
                      pageIndexProvider.changeIndex(index);
                    });
                  },
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: const [
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                    BottomNavigationBarItem(icon: Icon(Icons.store), label: ""),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.bar_chart), label: ""),
                    BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
                  ]),
            ),
          );
        },
      ),
      body:
          Consumer<PageIndexProvider>(builder: (context, pageIndexProvider, _) {
        if (pageIndexProvider.index >= 0 &&
            pageIndexProvider.index < pages.length) {
          return pages[pageIndexProvider.index];
        } else {
          return Container();
        }
      }),
    );
  }
}

class PageIndexProvider extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void changeIndex(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }
}
