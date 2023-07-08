import 'package:chekinapp/export.dart';
import 'package:flutter/material.dart';
import 'package:chekinapp/routes/routes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int currentPageIndex =
        context.select((MainProvider currentIndex) => currentIndex.navIndex);
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: IndexedStack(
        index: currentPageIndex,
        children: [HomeScreen(), DiscoverScreen()],
      ),
    );
  }
}
