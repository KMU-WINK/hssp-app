import 'dart:convert';

class Discount {
  final List<CardBenefit> cardBenefit;
  final List<StatusBenefit> statusBenefit;

  Discount({this.cardBenefit, this.statusBenefit});

  factory Discount.fromJson(Map<String, dynamic> parsedJson) {
    var cardList = parsedJson['cardBenefit'] as List;
    List<CardBenefit> cardBenefitList = cardList.map((i) => CardBenefit.fromJson(i)).toList();

    var statusList = parsedJson['cardBenefit'] as List;
    List<StatusBenefit> statusBenefitList = statusList.map((i) => StatusBenefit.fromJson(i)).toList();

    return Discount(
        cardBenefit: cardBenefitList,
        statusBenefit: statusBenefitList
    );
  }
}

class CardBenefit {
  final String name;
  final String img;
  final String detail;

  CardBenefit({this.name, this.img, this.detail});

  factory CardBenefit.fromJson(Map<String, dynamic> json) {
    return CardBenefit(
      name: json['name'],
      img: json['img'],
      detail: json['detail'],
    );
  }
}

class StatusBenefit {
  final String name;
  final String img;
  final String detail;

  StatusBenefit({this.name, this.img, this.detail});

  factory StatusBenefit.fromJson(Map<String, dynamic> json) {
    return StatusBenefit(
      name: json['name'],
      img: json['img'],
      detail: json['detail'],
    );
  }
}
