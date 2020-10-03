class Discount {
  final List<CardBenefit> cardBenefit;
  final List<StatusBenefit> statusBenefit;

  Discount({this.cardBenefit, this.statusBenefit});

  factory Discount.fromJson(List<dynamic> parsedJson) {
    List<CardBenefit> cardBenefit = new List<CardBenefit>();
    cardBenefit = parsedJson.map((i) => CardBenefit.fromJson(i)).toList();

    List<StatusBenefit> statusBenefit = new List<StatusBenefit>();
    statusBenefit = parsedJson.map((i) => StatusBenefit.fromJson(i)).toList();

    return Discount(
        cardBenefit: cardBenefit,
        statusBenefit: statusBenefit
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
