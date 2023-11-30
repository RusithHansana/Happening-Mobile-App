import 'package:flutter/material.dart';
import 'package:home_page/models/event.dart';
import 'package:home_page/screens/search_results_screen.dart';
import 'package:home_page/widgets/glass_box.dart';

import '../../data/dummy_data.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  SearchController searchController = SearchController();

  List<UniversityEvent> searchResults = [];

  List<UniversityEvent> searchEvents(
      List<UniversityEvent> events, String searchTerm) {
    return events.where((event) {
      return event.title.contains(searchTerm) ||
          event.category
              .toString()
              .toLowerCase()
              .contains(searchTerm.toLowerCase());
    }).toList();
  }

  void searchItems(String searchTerm) {
    setState(() {
      searchResults = searchEvents(universityEvents, searchTerm);
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchResultsScreen(
          resultList: searchResults,
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlassBox(
      borderRadius: 32,
      child: SearchBar(
        controller: searchController,
        onSubmitted: (value) {
          searchItems(searchController.text);
        },
        padding: const MaterialStatePropertyAll(
          EdgeInsets.only(
            left: 15,
          ),
        ),
        leading: Icon(
          Icons.search,
          size: 30,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        backgroundColor: MaterialStatePropertyAll(
          Colors.white38.withOpacity(0),
        ),
        shadowColor: const MaterialStatePropertyAll(
          Colors.transparent,
        ),
        hintText: 'Search',
        hintStyle: MaterialStatePropertyAll(
          TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
