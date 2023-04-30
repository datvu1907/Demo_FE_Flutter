import 'package:crypto_swap/app/data/model/flightModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/provider/flight_provider.dart';
import '../../widgets/app_share.dart';

class FlightController extends GetxController {
  RxList<FlightModel> listFlight = <FlightModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getListFlight();
  }

  getListFlight() {
    FlightProvider().getAllFlights().then((response) {
      for (var item in response) {
        FlightModel flight = FlightModel.fromJson(item);
        listFlight.add(flight);
      }
      update();
    }, onError: (err) {
      showSnackBar("Error", err.toString(), Colors.red);
    });
  }
}

const dummyData = [
  {
    "id": "644d2e6051351b254a33b46d",
    "title": "Du lịch Hà Nội",
    "description":
        "Hà Nội nằm ở hữu ngạn sông Đà, trong vùng tam giác châu thổ sông Hồng trù phú. Thành phố này có phía Bắc tiếp giáp với tỉnh Vĩnh Phúc và Thái Nguyên, phía Nam giáp tỉnh Hòa Bình, phía Đông là Bắc Ninh và Hưng Yên, còn tỉnh Vĩnh Phúc ở phía Tây.",
    "image":
        "https://owa.bestprice.vn/images/destinations/uploads/trung-tam-thanh-pho-ha-noi-603da1f235b38.jpg",
    "price": 25000000,
    "date": "01-05-2023"
  },
  {
    "id": "644d2e7051351b254a33b46e",
    "title": "Du lịch Đà Nẵng",
    "description":
        "Hà Nội nằm ở hữu ngạn sông Đà, trong vùng tam giác châu thổ sông Hồng trù phú. Thành phố này có phía Bắc tiếp giáp với tỉnh Vĩnh Phúc và Thái Nguyên, phía Nam giáp tỉnh Hòa Bình, phía Đông là Bắc Ninh và Hưng Yên, còn tỉnh Vĩnh Phúc ở phía Tây.",
    "image":
        "https://owa.bestprice.vn/images/destinations/uploads/trung-tam-thanh-pho-ha-noi-603da1f235b38.jpg",
    "price": 16000000,
    "date": "02-05-2023"
  },
  {
    "id": "644d2eae51351b254a33b46f",
    "title": "Du lịch Nha Trang",
    "description":
        "Hà Nội nằm ở hữu ngạn sông Đà, trong vùng tam giác châu thổ sông Hồng trù phú. Thành phố này có phía Bắc tiếp giáp với tỉnh Vĩnh Phúc và Thái Nguyên, phía Nam giáp tỉnh Hòa Bình, phía Đông là Bắc Ninh và Hưng Yên, còn tỉnh Vĩnh Phúc ở phía Tây.",
    "image": "http://xaviahotel.com/vnt_upload/news/11_2017/nha-trang_1.jpg",
    "price": 9000000,
    "date": "01-05-2023"
  },
  {
    "id": "644d2ede51351b254a33b470",
    "title": "Du lịch Đà Nẵng",
    "description":
        "Hà Nội nằm ở hữu ngạn sông Đà, trong vùng tam giác châu thổ sông Hồng trù phú. Thành phố này có phía Bắc tiếp giáp với tỉnh Vĩnh Phúc và Thái Nguyên, phía Nam giáp tỉnh Hòa Bình, phía Đông là Bắc Ninh và Hưng Yên, còn tỉnh Vĩnh Phúc ở phía Tây.",
    "image":
        "https://static.vinwonders.com/2022/05/OpAU9ZpU-du-lich-da-nang-thang-9-2.jpeg",
    "price": 12000000,
    "date": "02-05-2023"
  }
];
