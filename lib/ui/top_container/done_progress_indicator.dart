import 'package:flutter/material.dart';
import 'package:kanban/providers/kanban_provides.dart';
import 'package:provider/provider.dart';


class DoneProgressIndicator extends StatelessWidget {
  const DoneProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KanbanProviders>(
      builder: (_, provider, child) { //builder _ 는 사용하지 않는다는 뜻, 
        final todoCount = 3;
        final doneCount = 0;

        return Row(
          spacing: 10, //프로그레스바와, 텍스트 사이 간격
          mainAxisSize: .min,
          children: [
            SizedBox( //circularprogressindicator 크기 조절을 위함, 부모위젯에 따라 자동으로 크기 조절
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                
                value: doneCount / todoCount,
                color: Colors.lightGreen,
                backgroundColor: Colors.grey, //프로그레스의 background 뒷부분 배경
                strokeWidth: 7,
                
              ),
            ),
            Text(
              '$doneCount/$todoCount 완료',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            )
          ],
          
        );
      }
    );
  }
}