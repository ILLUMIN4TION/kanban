import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum KanbanStatus {
  todo,
  progress,
  done,
}



extension KanbanStatusExtension on KanbanStatus { //칸반 항목 각각의 title을 표시해주기위한 extension
  String get label => switch (this) {
        KanbanStatus.todo => 'To-Do',
        KanbanStatus.progress => 'In Progress',
        KanbanStatus.done => 'Done',
      };


      Color get backgroundColor => switch (this) {
        KanbanStatus.todo => const Color(0xFFF8F8F8), 
        KanbanStatus.progress => const Color(0xFFEBF7FC), 
        KanbanStatus.done => const Color(0xFFEDF9E8),
        
      };

      Color get bubbleColor => switch (this) {
        KanbanStatus.todo => const Color(0xFFE8E8E8), 
        KanbanStatus.progress => const Color(0xFFC8E9FF), 
        KanbanStatus.done => const Color(0xFFCAF0B9),
      };

      IconData get icon => switch (this) {
        KanbanStatus.todo => LucideIcons.circlePause,
        KanbanStatus.progress => LucideIcons.circlePlay,
        KanbanStatus.done => LucideIcons.circleCheck,
      };

      IconData get nextIcon => switch (this) {
        KanbanStatus.todo => LucideIcons.circlePlay,
        KanbanStatus.progress => LucideIcons.circlePause,
        KanbanStatus.done => LucideIcons.circleCheck,
      };
}