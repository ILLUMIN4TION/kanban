import 'package:flutter/material.dart';
import 'package:kanban/enums/kanban_status.dart';
import 'package:kanban/providers/kanban_provides.dart';
import 'package:kanban/ui/kanban/kanban_list.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class KanbanBoard extends StatelessWidget {
  const KanbanBoard({super.key});

  @override
  Widget build(BuildContext context) {

  
     
      return Consumer<KanbanProviders>(
        builder: (context,provider, child){
          final status = provider.kanbanStatus;
          return ShadTabs(
            expandContent: true,
            contentConstraints: BoxConstraints.expand(height: 0),
            value: status,
            tabs: KanbanStatus.values.map(
              (e) => ShadTab(
              value: e, 
              content: KanbanList(status: e),
              child: Text(e.label), // label이 없으면 e.toString() 사용f
            )).toList(),
          );
        }
      );
    }
    
}


