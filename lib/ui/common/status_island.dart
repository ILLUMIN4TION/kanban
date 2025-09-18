import 'package:flutter/material.dart';
import 'package:kanban/enums/kanban_status.dart';
import 'package:kanban/ui/themes/app_size.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class StatusIsland extends StatelessWidget {
  final KanbanStatus status;
  const StatusIsland({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.statusIslandheight,
      child: Row(
        spacing: 7,
        children: [
          Expanded(
            child: Container(
              height: AppSize.statusIslandheight,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: status.bubbleColor,
                borderRadius: BorderRadius.circular(AppSize.statusIslandheight + 10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                
                children: [
                  Icon(status.icon, size: 20),
                  SizedBox(width: 8),
                  Text(
                    status.label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            
            
          ),
          _buldCircleBubble(
            child: Text(
              '2',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          _buldCircleBubble(
            onTap: () {
              
              debugPrint('$status 추가하기');
            },
            visible: status != KanbanStatus.done, // done 상태에서는 숨기기
            child: Icon(LucideIcons.plus,
            size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buldCircleBubble({required Widget child, bool visible = true, VoidCallback? onTap}) {

    if(!visible) {
      return SizedBox(
        width: AppSize.statusIslandheight,
        height: AppSize.statusIslandheight,
      );
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppSize.statusIslandheight,
        height: AppSize.statusIslandheight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: status.bubbleColor,
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}