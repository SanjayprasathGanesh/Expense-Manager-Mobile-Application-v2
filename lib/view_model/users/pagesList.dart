import 'package:flutter/material.dart';

import '../../view/pages/main_screens/analytics.dart';
import '../../view/pages/main_screens/expenses.dart';
import '../../view/pages/main_screens/home.dart';
import '../../view/pages/main_screens/personal.dart';
import '../../view/pages/main_screens/settings.dart';

List<Widget> get pages => [
      const Home(),
      const MyExpenses(),
      const Personal(),
      const Analytics(),
      const Settings(),
    ];
