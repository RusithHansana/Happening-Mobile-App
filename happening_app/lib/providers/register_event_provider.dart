import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_page/models/event.dart';

class RegisteredEventProvider extends StateNotifier<List<UniversityEvent>> {
  RegisteredEventProvider() : super([]); //Initializing an immutable list

  bool onToggleFavourite(UniversityEvent event) {
    final bool isRegisteredEvent = state.contains(event);

    if (isRegisteredEvent) {
      //when toggling the button if it is already a favourite
      //remove it from the favourites
      //since the original list is immutable
      //it is replaced with a list without the current item
      state = state.where((e) => e.id != event.id).toList();

      return false;
    } else {
      //creating a new list using spread operator and the current event
      //by using spread operator the current items from the state will be added
      //as an individual items in to the new list
      state = [...state, event];

      return true;
    }
  }
}

final registeredEventsProvider =
    StateNotifierProvider<RegisteredEventProvider, List<UniversityEvent>>(
  (ref) => RegisteredEventProvider(),
);
