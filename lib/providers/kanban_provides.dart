import 'package:flutter/widgets.dart';
import 'package:kanban/enums/kanban_status.dart';

class KanbanProviders with ChangeNotifier {
  KanbanStatus kanbanStatus = .todo;
  List<(KanbanStatus status, String title)> items = [];

  void _refreshUI() => notifyListeners();

  void setKanbanStatus(KanbanStatus status) {
    if (kanbanStatus == status) return;
    kanbanStatus = status;
    _refreshUI();
  }

  void addItem(KanbanStatus status, String value) {
    items.add((status, value));
    notifyListeners();
  }

  void deleteItemindex(int index) {
    items.removeAt(index);
    notifyListeners();
  }
}