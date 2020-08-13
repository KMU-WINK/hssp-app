class MenuModel {
  final String date; //날짜
  final String meal; //아침, 점심, 저녁
  final num calorie; //칼로리
  final String rice; //밥
  final String stew; //찌개
  final String mainSideDish; //메인 반찬
  final String subSideDish; //서브 반찬
  final String dessert; //디저트

  MenuModel(this.date, this.meal, this.calorie, this.rice, this.stew,
      this.mainSideDish, this.subSideDish, this.dessert);
}

List<MenuModel> menus = data.map(
    (item) => MenuModel(
      item['date'],
      item['meal'],
      item['calorie'],
      item['rice'],
      item['stew'],
      item['mainSideDish'],
      item['subSideDish'],
      item['dessert'],
    ),
).toList();

var data = [
  {
    "date": "8월 13일",
    "meal": "아침",
    "calorie": 835.13,
    "rice": "불고기버거", //생활관 막내 : 허채림 병장님.. 오늘 아침 빵식이람다.. 허채림 : 깨우면 뒤진다.
    "stew": "",
    "mainSideDish": "",
    "subSideDish": "",
    "dessert": ""
  },
  {
    "date": "8월 13일",
    "meal": "점심",
    "calorie": 781.55,
    "rice": "보리비빔밥", //군침 싹도네; ㄹㅇ 취사병한테 고추장이랑 참기름 당장 내놓으라고 말한 뒤 슥삭 비벼 먹으면 진짜 전투 바로 투입 가능
    "stew": "청국장", //보.비랑 미친 조합을 띈다. 온 취사장이 중사 방구 냄새가 난다
    "mainSideDish": "돼지김치볶음", //보급 김 부셔서 쓰까먹으면 이미 취사장은 미슐랭 3스타임
    "subSideDish": "배추김치",
    "dessert": "수박"
  },
  {
    "date": "8월 13일",
    "meal": "저녁",
    "calorie": 1042.31,
    "rice": "밥",
    "stew": "짬뽕찌개",
    "mainSideDish": "생선가스",
    "subSideDish": "감자샐러드",
    "dessert": ""
  },
];
