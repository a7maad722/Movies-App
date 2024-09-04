import 'package:flutter/material.dart';
import 'package:movies_app/views/Tabs/Home%20Tab/components/new_release_item.dart';
import 'package:movies_app/views/Tabs/Home%20Tab/components/popular_item.dart';
import 'package:movies_app/views/Tabs/Home%20Tab/components/top_rated_item.dart';


class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Column(
        children: [
          PopularItem(),
          Spacer(),
          NewReleaseItem(),
          Spacer(),
          TopRatedItem(),
          Spacer(),
        ],
      ),
    );
  }
}
