import 'package:flutter/widgets.dart';
import 'package:kanban/enums/kanban_status.dart';

class KanbanProvides with ChangeNotifier {
  KanbanStatus kanbanStatus = KanbanStatus.todo;
  List<(KanbanStatus status, String title)> items = [];

  void _refreshUI() => notifyListeners();

  void setKanbanStatus(KanbanStatus status) {
    if (kanbanStatus == status) return;
    kanbanStatus = status;
    _refreshUI();
  }

  void addItem(String value, KanbanStatus kanbanStatus) {
    items.add((kanbanStatus, value));
    _refreshUI();
  }

  void deleteItemIndex(int index) {
    items.removeAt(index);
    _refreshUI();
  }
}