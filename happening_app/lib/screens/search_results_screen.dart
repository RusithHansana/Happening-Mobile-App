import 'package:flutter/material.dart';

import '/models/event.dart';
import '../widgets/upcoming-events/upcoming_event_card.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key, required this.resultList});

  final List<UniversityEvent> resultList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/img/splash_screen/splash-background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text(
                  'Search Resluts',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                pinned: false,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return UpcomingEventCard(event: resultList[index]);
                  },
                  childCount: resultList.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
