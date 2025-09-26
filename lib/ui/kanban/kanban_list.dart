import 'package:flutter/material.dart';
import 'package:kanban/enums/kanban_status.dart';
import 'package:kanban/providers/kanban_provides.dart';
import 'package:kanban/ui/common/status_island.dart';
import 'package:kanban/ui/kanban/widgets/kanban_item.dart';
import 'package:provider/provider.dart';

class KanbanList extends StatelessWidget {
  final KanbanStatus status;
  const KanbanList({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: status.backgroundColor, //색상 자동변경
        borderRadius: .circular(10),
      ),
      child: Column(
        spacing: 10,
        children: [
          StatusIsland(status: status),
          Expanded(
            child:Consumer<KanbanProviders>(
              builder:(context, provider, _){
              final items = provider.items;
              final searchedItems = items.where((e) => e.$1 == status).toList(); //$1은 kanbanStatus를 의미함

              return ListView.separated( //reverse를 통해 역순 가능, scrollDirection: Axis.horizontal, 수평스크롤 가능 <- 중간고사에 나올 수도 있을 듯 
              shrinkWrap: true,
              itemCount: searchedItems.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20); //아이템 사이 간격
                },
              itemBuilder: (context, index){
                return KanbanItem(
                  status: status,
                  title: 'New Task ${index+1}',
                  onCheckBox: (){
                    debugPrint('체크박스 클릭됨, status: $status');
                  },
                  onDelete: () {
                    debugPrint('삭제 버튼 클릭됨, status: $status');
                    context.read<KanbanProviders>().deleteItemindex(index);

                  },
                  onStatus: () {
                    debugPrint('status 버튼 클릭됨, status: $status');
                  },
                );
              }
            );
            }
            )
          ),
        ],
      ),
    );
  }
}