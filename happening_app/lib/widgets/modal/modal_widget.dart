import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:home_page/providers/favourites_provider.dart';
import 'package:home_page/providers/register_event_provider.dart';
import 'package:intl/intl.dart';

import './glass_button.dart';
import '/models/event.dart';
import './requirement.dart';

class ModalWidget extends ConsumerWidget {
  const ModalWidget({super.key, required this.event});

  final UniversityEvent event;

  // Helper method to get the month name
  String getMonthName(DateTime dateTime) {
    DateFormat dateFormat = DateFormat.MMMM();
    String monthName = dateFormat.format(dateTime);
    return monthName[0].toUpperCase() + monthName.substring(1);
  }

  // Helper method to get the day name
  String getDayName(DateTime dateTime) {
    DateFormat dateFormat = DateFormat.EEEE();
    String dayName = dateFormat.format(dateTime);
    return dayName[0].toUpperCase() + dayName.substring(1);
  }

  // Helper method to format time
  String formatTime(DateTime dateTime) {
    DateFormat timeFormat = DateFormat('hh:mm a');
    String formattedTime = timeFormat.format(dateTime);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Calculate screen height
    double screenHeight = MediaQuery.of(context).size.height;
    double heightFactor =
        screenHeight / 1000; // You can adjust this factor as needed

    // Create a list of RequirementItem widgets
    List<Widget> widgetList = event.requirements.map((text) {
      return RequirementItem(requirement: text);
    }).toList();

    //Creating a list of Favourite Events
    final List<UniversityEvent> favouriteEvents = ref.watch(
        favouriteEventsProvider); // setting up a listner to favouriteEventsProvider
    final List<UniversityEvent> registeredEvents =
        ref.watch(registeredEventsProvider);

    final bool isFavourite = favouriteEvents.contains(event);
    final bool isRegistered = registeredEvents.contains(event);

    void toggleFavourite() {
      //triggering the method in StateNotifier class
      ref.read(favouriteEventsProvider.notifier).onToggleFavourite(event);
    }

    void toggleRegistered() {
      ref.read(registeredEventsProvider.notifier).onToggleFavourite(event);
    }

    return Stack(
      children: [
        // Background Container
        FractionallySizedBox(
          heightFactor: heightFactor, // 75% of screen height
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20.0),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF19539A),
              ),
              child: SingleChildScrollView(
                // Use SingleChildScrollView to make the content scrollable
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Event Image with Gradient Overlay
                    Stack(
                      children: [
                        Container(
                          height: 400,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/img/events/rasoga.jpg'), // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 400,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color(0xFF19539A), // Start color
                                Color.fromARGB(0, 217, 200,
                                    200), // End color (transparent)
                              ],
                            ),
                          ),
                        ),
                        // Title and Subtitle
                        Positioned(
                          bottom: 16.0,
                          left: 16.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                event.place,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Favorite Button
                        Positioned(
                          top: 30.0,
                          right: 16.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white.withOpacity(0.75),
                            ),
                            child: IconButton(
                              icon: Icon(
                                isFavourite
                                    ? Icons.favorite
                                    : Icons.favorite_border, //toggle the icon
                                color: Colors.pink[300],
                              ),
                              onPressed: toggleFavourite,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Event Date and Time
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event.startTime.day.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  getMonthName(event.startTime),
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getDayName(event.startTime),
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '${formatTime(event.startTime)} - ${formatTime(event.endTime)}',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // About This Event
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'About This Event : ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 17.0,
                              ),
                            ),
                            TextSpan(
                              text: event.description,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Requirements
                    const Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Text(
                              'Requirements:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Requirement Items
                    ...widgetList,
                    // Add more requirement items as needed...
                    const SizedBox(
                      height: 90,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Register Button
        Positioned(
          bottom: 16.0,
          left: 16.0,
          right: 16.0,
          child: GlassButton(
              label: isRegistered ? 'Registered ' : 'Register',
              onTap: () {
                toggleRegistered();
              }),
        ),
      ],
    );
  }
}
