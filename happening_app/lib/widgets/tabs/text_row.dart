import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_page/screens/all_upcoming_events.dart';

class TextRow extends ConsumerWidget {
  const TextRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void showAllEvents() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const AllUpcomingEvents(
            title: 'Upcoming Events',
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Featured Events',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TextButton(
            onPressed: showAllEvents,
            child: Text(
              'See all',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
