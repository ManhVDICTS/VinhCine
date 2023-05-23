import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vinhcine/src/components/button/text_button.dart';
import 'package:vinhcine/src/features/movie_tab/domain/models/movie_tab.dart';

class MovieTabTitle extends StatelessWidget {
  final MovieTabType selectedTab;
  final Function(MovieTabType) onTabChanged;

  const MovieTabTitle(
      {super.key, required this.selectedTab, required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _tabTitleWidgets(selectedTab),
      ),
    );
  }

  List<Widget> _tabTitleWidgets(MovieTabType selectedTab) {
    return MovieTabType.values
        .map((tab) => TextTabButton(
              title: tab.title,
              selectedStatus: selectedTab == tab,
              onTap: () {
                onTabChanged.call(tab);
              },
            ))
        .toList();
  }
}
