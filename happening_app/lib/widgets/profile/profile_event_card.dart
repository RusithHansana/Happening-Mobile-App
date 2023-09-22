import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_page/models/account.dart';
import 'package:home_page/models/event.dart';
import 'package:home_page/providers/favourites_provider.dart';
import 'package:home_page/providers/register_event_provider.dart';

import 'package:home_page/screens/all_upcoming_events.dart';
import 'package:home_page/widgets/glass_box.dart';

class ProfileEventCard extends ConsumerWidget {
  const ProfileEventCard(
      {required this.account, required this.title, super.key});

  final String title;
  final StudentAccount account;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<UniversityEvent> favouriteList =
        ref.watch(favouriteEventsProvider);

    final List<UniversityEvent> registeredList =
        ref.watch(registeredEventsProvider);

    void showEventPage(String title) {
      //handling the scenario where there are no favourites
      if (favouriteList.isEmpty && title == 'Intersted Events') {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.white38,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            content: Center(
                child: Text(
              "You don't have any favourites added yet",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            )),
          ),
        );
        return;
      }
      if (registeredList.isEmpty && title == 'Registered Events') {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.white38,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            content: Center(
                child: Text(
              "You haven't registered to any events",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            )),
          ),
        );
        return;
      }
      if (title == 'Intersted Events') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AllUpcomingEvents(
            title: title,
          ),
        ));
      } else {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AllUpcomingEvents(
            title: title,
          ),
        ));
      }
    }

    return InkWell(
      onTap: () {
        showEventPage(title);
      },
      child: SizedBox(
        width: 150,
        child: GlassBox(
          borderRadius: 32,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  title == 'Intersted Events'
                      ? Icons.favorite_outline
                      : Icons.library_books_outlined,
                  color: Colors.white,
                  size: 24,
                ),
                Text(
                  title == 'Intersted Events'
                      ? favouriteList.length.toString()
                      : registeredList.length.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
