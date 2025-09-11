enum KanbanStatus {
  todo,
  Progress,
  done,
}



extension KanbanStatusExtension on KanbanStatus { //칸반 항목 각각의 title을 표시해주기위한 extension
  String get label => switch (this) {
        KanbanStatus.todo => 'To-Do',
        KanbanStatus.Progress => 'In Progress',
        KanbanStatus.done => 'Done',
      };
}