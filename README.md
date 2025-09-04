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






## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
