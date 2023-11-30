import 'package:flutter/material.dart';
import 'package:home_page/models/event.dart';
import 'package:home_page/widgets/modal/modal_widget.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class EventCardDetails extends StatefulWidget {
  const EventCardDetails({required this.event, super.key});
  final UniversityEvent event;
  @override
  State<EventCardDetails> createState() => _EventCardDetailsState();
}

class _EventCardDetailsState extends State<EventCardDetails> {
  void _showEventModalOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => ModalWidget(
        event: widget.event,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat.MMMM();
    DateTime startDateTime = widget.event.startTime;
    DateTime endDateTime = widget.event
        .endTime; //in future cases where there will be event in more than one month
    int startDate = startDateTime.day;
    int endDate = endDateTime.day;
    int year = startDateTime.year;
    String month = dateFormat.format(startDateTime);

    String getDate() {
      //when the event is an one day event only that day will be shown
      return startDate == endDate
          ? '$startDate, $month, $year'
          : '$startDate - $endDate, $month, $year';
    }

    return Padding(
      padding: const EdgeInsets.only(
        right: 0,
      ),
      child: GestureDetector(
        onTap: _showEventModalOverlay,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27),
          ),
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
            width: 300,
            child: Stack(
              children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: AssetImage(
                    widget.event.imageUrl,
                  ),
                  fit: BoxFit.cover,
                  height: 500,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getDate(),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(
                        widget.event.title,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
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
