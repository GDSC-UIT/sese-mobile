import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  var userAddress = TextEditingController(text: "").obs;
  var userName = TextEditingController(text: "").obs;
  var userPhoneNumber = TextEditingController(text: "").obs;
  var city = TextEditingController(text: "").obs;
  var district = TextEditingController(text: "").obs;
  var ward = TextEditingController(text: "").obs;
  var streetBuildingName = TextEditingController(text: "").obs;
  var isDefault = false.obs;

  var bought = false.obs;

  RxInt currentIndexAddress = (0).obs;
  RxInt countAddress = (1).obs;
  RxBool english = false.obs;
  RxList<Map> listAddresses = <Map>[
    {
      "name": "Nguyen Meo",
      "phoneNumber": "0123432452",
      "city": "TP.HCM",
      "district": "Quan 1",
      "ward": "Phuong 1",
      "streetBuildingName": "UEH",
      "fullAddress": "",
      "isDefault": false
    },
  ].obs;

  void toggleSwitch(index) {
    listAddresses[index]["isDefault"] = !listAddresses[index]["isDefault"];
  }

  void saveAddress(index) {
    if (userName.value.text != "") {
      listAddresses[index]["name"] = userName.value.text;
    }
    if (userPhoneNumber.value.text != "") {
      listAddresses[index]["phoneNumber"] = userPhoneNumber.value.text;
    }
    if (city.value.text != "") listAddresses[index]["city"] = city.value.text;
    if (district.value.text != "") {
      listAddresses[index]["district"] = district.value.text;
    }
    if (ward.value.text != "") listAddresses[index]["ward"] = ward.value.text;
    if (streetBuildingName.value.text != "") {
      listAddresses[index]["streetBuildingName"] =
          streetBuildingName.value.text;
    }
    listAddresses[index]["isDefault"] = isDefault.value;
    isDefault.value = false; 
  }

  void getFullAddress(index) {
    String address;
    address = listAddresses[index]["streetBuildingName"] +
        '-' +
        listAddresses[index]["ward"] +
        '-' +
        listAddresses[index]["district"] +
        '-' +
        listAddresses[index]["city"];
    listAddresses[index]["fullAddress"] = address;
  }

  RxList<Map> listProductsSold = [
    {
      "owner": "Nguyen Meo Meo",
      "date": "1 ngay truoc",
      "category": "Do an",
      "location": "TP.Ho Chi Minh"
    },
    {
      "owner": "Nguyen Gau Gau",
      "date": "2 ngay truoc",
      "category": "Giay dep",
      "location": "Ha Noi"
    },
  ].obs;

  
}
