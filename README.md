# kanban

25-09-04 Class

git commit -m "~~" -m "상세설명문구"

<- 기말고사때 볼 수도 있음 ( 앞은 타이틀, 뒤는 상세설명)



flutter create --org kr.ac.daelim kanban


code kanban/ <- vscode로 칸반 프로젝트 실행 

렉 걸릴 때 profile (실행 중 하나 run, debug, profile) 실행

flutter개발시 버전관리 잘 하기

pubspec ymal의 version을 앱 업데이트시마다 

출시(릴리즈)했을 때부터 수정하기 시작하면됨



provider <- 상태관리용 (stl로도 stf구현이 가능)
icons
shardcn_ui

main.dart에서 home 이하 지우기 



ctrl + . <- quick fix 단축키

stf = 업데이트(화면이 초기화 후 다시 렌더 <- 사람들이 쾌적하다고 느끼지 못함) 최대 30프레임 이상

재사용이 가능하다면 위젯 많이 나누면 좋음


provider로 stl에서 stf처럼 상태 관리하기

화면을 띄울 때 리소스(이미지, 아이콘)의 할당/해제

 최적화 

안드로이드에서의 application <- 최상단


컨텍스트가 없는 곳에서 application을 통한 context를 매개변수 따로 없이 전달해섯 ㅏ용할 수 있음

provider -> consumer 연결 -> notifyListner연결을 통해 

provides를 앱 전체에 등록하면 이 앱에서는 provider를 사용가능함

setState처럼 바뀐다고 알려줄 것이 필요함 나 UI 바꿀게 > notifyListener(); <- UI 바뀔 때마다 꼭 밑에 붙여주기 



#09-18
flutter upgrade (--force) <- 플러터 업그레이드 현재 stable 3.35.3


SDK버전이 다른 문제를 해결하기 위함 -

실제 프로젝트에서 플러터 버전을 업그레이드 해 줄 필요가 있음


dependencies:
  flutter:
    sdk: flutter

여기처럼 sdk:flutter가 아무것도 되어있지 않으면 최신버전 사용,
'


environment:
  sdk: ^3.9.0

플러터에서 sdk가 3.9.0인 이유는 저 enviroment는 dart버전임.

업그레이드 하면서 dart sdk도 업그레이드 3.9.2 <- 3.9.0에서 업그레이드


flutter에서 dart shorthands 사용을 위해,
analysis를 수정했음



--enable-experiment=dot-shorthands

오류시 flutter run --debug 이후에 위에 항목 추가



todo - done - progress를 탭을 통해 이동하기로 결정,

shadcn에 존재하는 tab을 이용


09-11 moblile integrate development



칸반을 관리하기 위해 enum calss 사용, todo, progress, done



여러 곳에서 하나의 프로바이더를 사용하면 최적화 문제가 발생할 수 있음

kanban status가 todo인데 또 todo를 누르면 바뀔 필요가 없는데도 UI를 초기화 해야함
if(kanbanStatus == status) return; //같은 상태면 변경하지 않음



자동으로 추가하는 방법

KanbanStatus.values.map((e)=>ShadTab(value:e,content:KanbanList(status:e),child:Text(e.label).toList()

기존방법

return ShadTabs(value: status,tabs: [
          ShadTab(value: KanbanStatus.todo,
          content: KanbanList(status: KanbanStatus.todo),
           child: Text(KanbanStatus.todo.label)),
           

          ShadTab(value: KanbanStatus.Progress,
          content: KanbanList(status: KanbanStatus.Progress),
           child: Text(KanbanStatus.Progress.label)),

          ShadTab(value: KanbanStatus.done,
          content: KanbanList(status: KanbanStatus.done),
           child: Text(KanbanStatus.done.label)),





09-18 모바일 통합 구현

Todo , In progress, Done 화면에 들어가는 위젯을 제작하고 각 탭에 맞게 색상 및 텍스트 변겨 ㅇ자동화

.0



width height 계산방법

1. tab자체의 크기를 받고 네비게이션 탭의 크기를 알아내면 연산을 통해 나머지 영역의 크기를 알 수 있다


342.72727272727275 x 600.4545454545455


container - column(row, listView)

2.flutter는 부모가 자식에게 가질 수 있는 크기를 제공
하지만 이전 코드
+ LayoutBuilder를 사용, 부모위젯을 감싸 constraints(크기 최대값)를 자식에게 전달

============================================================

container의 컬러값과 아이콘(배경, 버블, 아이콘)을 바뀔 수 있게 extension과 연동해서 바뀌게 설정

Color get backgroundColor => switch (this) {
        KanbanStatus.todo => const Color(0xFFF8F8F8), 
        KanbanStatus.progress => const Color(0xFFEBF7FC), 
        KanbanStatus.done => const Color(0xFFEDF9E8),
      };

      Color get bubbleColor => switch (this) {
        KanbanStatus.todo => const Color(0xFFE8E8E8), 
        KanbanStatus.progress => const Color(0xFFC8E9FF), 
        KanbanStatus.done => const Color(0xFFCAF0B9),
      };

      IconData get icon => switch (this) {
        KanbanStatus.todo => LucideIcons.circlePause,
        KanbanStatus.progress => LucideIcons.circlePlay,
        KanbanStatus.done => LucideIcons.circleCheck,
      };





visible?로 kanbanSatus가 done일 때 아이콘을 sizebox리턴하기
inkwell otap == null이면 아무것도 표시 x <- 교수님 말씀

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
        decoration: visible ? BoxDecoration(
          color: status.bubbleColor,
          shape: BoxShape.circle,
        ): null,
        child: child,
      ),
    );
  }
}




## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
