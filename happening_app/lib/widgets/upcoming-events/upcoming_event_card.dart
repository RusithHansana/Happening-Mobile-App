import 'package:flutter/material.dart';

import '../modal/modal_widget.dart';
import '/models/event.dart';
import '../glass_box.dart';

class UpcomingEventCard extends StatefulWidget {
  const UpcomingEventCard({super.key, required this.event});

  final UniversityEvent event;

  @override
  State<UpcomingEventCard> createState() => _UpcomingEventCardState();
}

class _UpcomingEventCardState extends State<UpcomingEventCard> {
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
    return InkWell(
      onTap: () {
        _showEventModalOverlay();
      },
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(26, 7.5, 16, 7.5),
            child: GlassBox(
              borderRadius: 32,
              child: SizedBox(
                height: 150,
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 16,
            bottom: 25,
            right: 25,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.event.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(5, 5),
                        blurRadius: 15,
                        spreadRadius: 2,
                        color: Color.fromRGBO(0, 0, 0, 0.19),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  // Wrap the Text widget with Expanded
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.event.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Text(
                        widget.event.description.length > 200
                            ? '${widget.event.description.substring(0, 200)}...'
                            : widget.event.description,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.95),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
