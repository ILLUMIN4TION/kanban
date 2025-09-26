import 'package:flutter/material.dart';
import 'package:kanban/providers/kanban_provides.dart';
import 'package:kanban/ui/kanban_screen.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  //앱 시작시 필요한 초기화 코드
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => KanbanProviders())],
      child: ShadApp(
        theme: ShadThemeData(
          brightness: Brightness.light,
          colorScheme: const ShadBlueColorScheme.light(),
          ),
          home: KanbanScreen(),
      ),
    );
  }
}

