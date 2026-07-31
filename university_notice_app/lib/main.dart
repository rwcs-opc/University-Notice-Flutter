// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'screen/login_screen.dart';
// import 'screen/theme_provider.dart';
// import 'package:provider/provider.dart';
//  //import 'providers/theme_provider.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => ThemeNotifier(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {

//     final themeProvider =
//         Provider.of<ThemeNotifier>(context);

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,

//       theme: ThemeData.light(),

//       darkTheme: ThemeData.dark(),

//      //themeMode: themeProvider.currentTheme,
//       themeMode: themeProvider.Themeode,
//       home: const LoginScreen(),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/login_screen.dart';
//import 'screen/theme_provider.dart';
import 'provider/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.light(),

      darkTheme: ThemeData.dark(),

      themeMode: themeProvider.currentTheme,

      home: const LoginScreen(),
    );
  }
}