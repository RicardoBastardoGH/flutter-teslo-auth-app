import 'package:flutter/material.dart';
import 'config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {

  await Environment.initEnvironment();
  
  runApp(
    ProviderScope(child:  const MainApp())
   );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final appRouter = ref.watch( goRouterProvider );

    // print(Environment.apiUrl);
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
