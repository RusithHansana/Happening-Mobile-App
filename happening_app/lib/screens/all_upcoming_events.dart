import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:home_page/providers/common_providers.dart';
import 'package:home_page/providers/favourites_provider.dart';
import 'package:home_page/providers/register_event_provider.dart';

import '/models/event.dart';
import '../widgets/upcoming-events/upcoming_event_card.dart';

class AllUpcomingEvents extends ConsumerWidget {
  const AllUpcomingEvents({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<UniversityEvent> events = ref.watch(eventProvider);

    if (title == 'Intersted Events') {
      events = ref.watch(favouriteEventsProvider);
    }
    if (title == 'Registered Events') {
      events = ref.watch(registeredEventsProvider);
    }
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
                  title,
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
                    return UpcomingEventCard(event: events[index]);
                  },
                  childCount: events.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
