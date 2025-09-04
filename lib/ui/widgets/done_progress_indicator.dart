import 'package:flutter/material.dart';
import 'package:kanban/providers/kanban_provides.dart';
import 'package:provider/provider.dart';

class DoneProgressIndicator extends StatelessWidget {
  const DoneProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KanbanProvides>(
      builder: (_, provider, child) { //builder _ 는 사용하지 않는다는 뜻, 
        return Text(
          
          provider.value.toString(),
            style: TextStyle(
              fontSize: 20
            ),);
      }
    );
  }
}