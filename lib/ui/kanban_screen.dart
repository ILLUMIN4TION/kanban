import 'package:flutter/material.dart';
import 'package:kanban/providers/kanban_provides.dart';
import 'package:kanban/ui/kanban/kanban_board.dart';
import 'package:kanban/ui/top_container/top_container.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class KanbanScreen extends StatelessWidget {
  const KanbanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: .stretch, //가로로 쭉 늘리기 <- 1
          spacing: 25, // 최신 플러터에서의 spacing 사용법
          children: [
            // Top container
            TopContainer(),
            
            // Kanban board
            Expanded(
              child: KanbanBoard(),
            )
          ],
        ),
        ),
      )
       
    );
  }
}