import 'package:hsspapp/shared/image_constants.dart';

class SwiperModel {
  String image;

  SwiperModel(this.image);
}

List<SwiperModel> swiperEvent =
    imgData.map((item) => SwiperModel(item['image'])).toList();

var imgData = [
  {"image": swiper1},
  {"image": swiper2},
  {"image": swiper3},
];
