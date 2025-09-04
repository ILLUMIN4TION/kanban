import 'package:flutter/material.dart';
import 'package:kanban/providers/kanban_provides.dart';
import 'package:kanban/ui/widgets/top_container.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class KanbanScreen extends StatelessWidget {
  const KanbanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final provider = context.read<KanbanProvides>();
          provider.addValue();
        },
        child: Icon(LucideIcons.plus),
      ),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(25),
        child: Column(
          spacing: 25, // 최신 플러터에서의 spacing 사용법
          children: [
            // Top container
            TopContainer(),
            
            // Kanban board
            Expanded(
              child: Placeholder())
          ],
        )
        
        ),
      )
       
    );
  }
}