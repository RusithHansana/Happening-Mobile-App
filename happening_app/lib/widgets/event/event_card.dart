import 'package:flutter/material.dart';
import 'package:home_page/data/dummy_data.dart';
import 'package:home_page/models/event.dart';
import 'package:home_page/widgets/event/event_card_details.dart';

class EventCard extends StatefulWidget {
  const EventCard({required this.category, super.key});
  final Category category;
  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    List<UniversityEvent> eventList = widget.category == Category.all
        ? universityEvents
            .where((event) => event.isFeaturedEvent == true)
            .toList()
        : universityEvents
            .where((event) =>
                event.isFeaturedEvent == true &&
                event.category == widget.category)
            .toList(); //only the featured events will be shown in the home and filter according to the tab
    final bool isOnlyOneEvent = eventList.length == 1;
    Widget content = ListView.builder(
      itemCount: eventList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => EventCardDetails(
        event: eventList[index],
      ),
    );

    //Handling the situation where no events
    if (eventList.isEmpty) {
      content = Center(
        child: Text(
          'Hmm... No events found!',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 20,
              ),
        ),
      );
    }

    return isOnlyOneEvent //if there is only one event the card is set to the center
        ? Padding(
            padding: const EdgeInsets.only(
              left: 26,
            ),
            child: content,
          )
        : content;
  }
}
