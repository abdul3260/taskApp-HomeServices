import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:task_18/External_Widgets/common_widgets.dart';
import 'package:task_18/Screens/screen_home_page.dart';

class ControllerHomePage extends GetxController {
  var carousalPageIndicatorIndex = 0.obs;
  var bottomNavBarIndex = 0.obs;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  getStatusColor(string) {
    if (string == "Available") {
      return Colors.green;
    } else if (string == "not available") {
      return Colors.red;
    } else {
      return Colors.deepOrangeAccent;
    }
  }

  getCurrentLocation() async {
    //checking permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      customSnackBar(title: "Sorry", message: "Permission not granted! please enable the location");
      Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      customSnackBar(title: "Your current Location is", message: currentPosition.toString());
      return currentPosition;
    }
  }
}

var images = [
  "assets/images/image_one.png",
  "assets/images/image_two.jpg",
  "assets/images/image_three.png",
  "assets/images/images_four.png",
  "assets/images/image_five.png",
];

var categories = [
  {"name": "Plumbing Work", "images": "assets/images/plumber.png"},
  {"name": "Mobile Maintainance", "images": "assets/images/settings.png"},
  {"name": "Air Conditionar", "images": "assets/images/air-conditioner.png"},
  {"name": "Electrical Work", "images": "assets/images/electrician.png"},
  {"name": "Car Service", "images": "assets/images/emergency-road-service.png"},
  {"name": "Engineers", "images": "assets/images/engineers.png"},
  {"name": "Doctors", "images": "assets/images/doctor.png"},
];

var specialOffers = [
  {"name": "Car Cleaning", "image": "assets/images/car_wash_ad.jpg", "rating": "4.0", "pname": "Ahmad Mujtaba", "profile": "assets/images/profile.png", "profilePic": "assets/images/profilePicOne.jpeg", "status": "Available", "distance": "1.4 km"},
  {"name": "Painting", "image": "assets/images/painting_ad.png", "rating": "3.0", "pname": "Abid Ali", "profile": "assets/images/profile.png", "profilePic": "assets/images/profilePicTwo.jpg", "status": "busy", "distance": "2.3 km"},
  {"name": "Cleaning", "image": "assets/images/cleaning_ad.jpg", "rating": "4.4", "pname": "Usman", "profile": "assets/images/profile.png", "profilePic": "assets/images/profilePicThree.jpeg", "status": "not available", "distance": "1.5 km"},
  {"name": "General Handyman", "image": "assets/images/handyman_ad.jpg", "rating": "2.2", "pname": "Bilal Adnan", "profile": "assets/images/profile.png", "profilePic": "assets/images/profilePicFour.jpg", "status": "busy", "distance": "1.0 km"},
  {"name": "Plumbing", "image": "assets/images/plumbing_ad.jpg", "rating": "4.9", "pname": "Saqib Khan", "profile": "assets/images/profile.png", "profilePic": "assets/images/profilePicFive.jpg", "status": "Available", "distance": "0.7 km"},
  {"name": "Electrical", "image": "assets/images/electrician_ad.jpg", "rating": "5.0", "pname": "Ahmad Ali", "profile": "assets/images/profile.png", "profilePic": "assets/images/profilePicSix.jpg", "status": "not available", "distance": "1.2 km"},
  {"name": "Smart Home", "image": "assets/images/smart_home_ad.jpg", "rating": "3.6", "pname": "Qasim Ali", "profile": "assets/images/profile.png", "profilePic": "assets/images/profilePicSeven.jpg", "status": "not available", "distance": "3.9 km"},
  {"name": "Window Treatment", "image": "assets/images/windows_ad.jpg", "rating": "2.1", "pname": "Adnan", "profile": "assets/images/profile.png", "profilePic": "assets/images/profilePicEight.jpg", "status": "Available", "distance": "4.9 km"},
];
