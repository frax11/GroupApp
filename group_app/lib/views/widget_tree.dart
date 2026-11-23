import 'package:flutter/material.dart';
import 'package:group_app/data/notifiers.dart';
import 'package:group_app/views/pages/home_page.dart';
import 'package:group_app/views/pages/profile_page.dart';
import 'package:group_app/views/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GroupApp'),
        actions: [
          IconButton(
            icon: isDarkModeNotifier.value
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
          ),
        ],
      ),
      bottomNavigationBar: const NavbarWidget(),
      body: ValueListenableBuilder(
        valueListenable: selectedIndexNotifier,
        builder: (BuildContext context, int pageSelected, _) {
          return pages[pageSelected];
        },
      ),
    );
  }
}
