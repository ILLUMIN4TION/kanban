import 'package:flutter/material.dart';
import 'package:kanban/ui/top_container/done_progress_indicator.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadAlert(
      crossAxisAlignment: CrossAxisAlignment.center, //나만의 스타일 만들기 위젯은 바닥에, 속성은 최상단에 정렬하기(ex 함수)
      icon: Icon(LucideIcons.smile,
      size: 28),
      title: Row(
        children: [
          Expanded(
            child: Text("Kanban Board",
            style: TextStyle(
              fontSize: 20,
              ),
            ),
          ),//여백을 주기 위한 방법으로 Text를 Expanded로 감싸기 Expanded는 남은 공간을 다 차지함
          DoneProgressIndicator() 
        ],
      ),
    );
  }
}