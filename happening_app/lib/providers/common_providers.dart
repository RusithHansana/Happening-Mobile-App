import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:home_page/data/dummy_data.dart';
import 'package:home_page/models/event.dart';

final eventProvider = Provider((ref) => universityEvents);
final categoryProvider = Provider((ref) => Category.values);
