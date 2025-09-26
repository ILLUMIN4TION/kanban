import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kanban/enums/kanban_status.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class KanbanItem extends StatelessWidget {
  final KanbanStatus status;
  final String title;

  //각 클릭이벤트
  final VoidCallback onCheckBox;
  final VoidCallback onDelete;
  final VoidCallback? onStatus;
  const KanbanItem({super.key, required this.status, required this.title, required this.onCheckBox, required this.onDelete, this.onStatus});

  @override
  Widget build(BuildContext context) {
    return ShadCard( //leading, title, subtitle, trailing 등 다양한 매개변수 제공  
      title: Row(
        children:[ 
          Checkbox(visualDensity: .compact,
            activeColor: Colors.green, 
            onChanged: (_) => onCheckBox,
            value: status == KanbanStatus.done
        
          ),
          
          Expanded(
            child: Text(title,
              maxLines: 2,
              overflow: .ellipsis,
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
              )
            ),
          ),

          IconButton(icon: Icon(LucideIcons.x),
            onPressed: onDelete,
            iconSize: 20, 
            padding: .zero,
          ),
        ]
      ), 

      //child: Container(height:50, color: Colors.red,), //footer와 title사이의 공간에 데이터표시

      footer: Row(
        mainAxisAlignment: .spaceBetween, 
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
            decoration: BoxDecoration(
              borderRadius: .circular(4),
              color: Color(0xFFE1FBD6)
            ),
            child: Text("Low", style: TextStyle(fontSize: 12)),
          ),
          //2. Spacer(), 로 간격 벌리기 컨테이너와 아이콘버튼 사이에 간격 벌리기


          if (status != KanbanStatus.done) //3. if문으로 조건부 렌더링 하기 그리는 것 자체를 x 퍼포먼스 증가
          IconButton(

            onPressed: onStatus,
            visualDensity: .compact,
            padding: EdgeInsets.zero, 
            iconSize: 25, 
            icon: Icon(status.nextIcon) 
          ),
        ],
      
      ),
      

      
    );
  }
}