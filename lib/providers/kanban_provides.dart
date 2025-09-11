
import 'package:flutter/widgets.dart';
import 'package:kanban/enums/kanban_status.dart';

class KanbanProvides with ChangeNotifier {
  //상태 관리할 변수들 <- 칸반 enum 타입
  KanbanStatus kanbanStatus = .todo;

  


  void _refreshUI() => notifyListeners();


  //status를 변경해줄 함수들
  void setKanbanStatus(KanbanStatus status) {
    if(kanbanStatus == status) return; //같은 상태면 변경하지 않음
    kanbanStatus = status;
    _refreshUI(); // UI변경을 위한 refreshUI 호출
  }


  
} 