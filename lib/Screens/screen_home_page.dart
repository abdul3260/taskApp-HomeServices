import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_18/Controllers/controller_home_page.dart';
import 'package:task_18/External_Widgets/common_widgets.dart';
import 'package:task_18/Utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_18/Utils/text_Style.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controlleHomePage = Get.put(ControllerHomePage());

  @override
  Widget build(BuildContext context) {
    controlleHomePage.getCurrentLocation();
    return Scaffold(
      key: controlleHomePage.scaffoldKey,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                simpleText(
                  text: "Current Location",
                  textColor: colorDeepOrange,
                  fontweight: FontWeight.bold,
                ),
                Icon(
                  Icons.expand_more,
                  color: colorDeepOrange,
                ),
              ],
            ),
            simpleText(
              text: "Doha, Qatar",
              fontweight: FontWeight.bold,
              textColor: colorGrey,
            )
          ],
        ),
        leading: InkWell(
          onTap: () {
            controlleHomePage.scaffoldKey.currentState?.openDrawer();
          },
          child: Icon(
            Icons.menu,
            color: colorBlack,
          ),
        ),
        elevation: 0.0,
        backgroundColor: colorOffWhite,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.search,
              color: colorBlack,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              carousal(),
              pageIndicator(),
              verticalSpace(5.h),
              textRow("Categories"),
              categoriesList(categories),
              textRow("Special Offers"),
              buildSpecialOffers(specialOffers),
              verticalSpace(6.h),
              textRow("Top Service Providers"),
              verticalSpace(6.h),
              buildTopProviders(specialOffers),
            ],
          ),
        ),
      ),
      bottomNavigationBar: customBottomNavBar(),
      drawer: const Drawer(),
    );
  }

  carousal() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            controlleHomePage.carousalPageIndicatorIndex.value = index;
          },
          autoPlay: true,
          height: Get.height / 5,
        ),
        items: images.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(1, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                      image: AssetImage(i),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  pageIndicator() {
    return Obx(
      () => Center(
        child: AnimatedSmoothIndicator(
          activeIndex: controlleHomePage.carousalPageIndicatorIndex.value,
          count: images.length,
          effect: ExpandingDotsEffect(
            dotColor: colorGrey,
            activeDotColor: colorDeepOrange,
            dotWidth: 7.w,
            dotHeight: 7.h,
          ),
        ),
      ),
    );
  }

  textRow(title) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          simpleText(
            text: title,
            textColor: colorLightBlack,
            fontweight: FontWeight.bold,
          ),
          moreButton(),
        ],
      ),
    );
  }

  moreButton() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(1, 0),
          ),
        ],
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.arrow_forward_ios,
        color: colorDeepOrange,
        size: 15.h,
      ),
    );
  }

  categoriesList(categ) {
    return Container(
      height: Get.height / 5,
      margin: EdgeInsets.symmetric(vertical: 4.h),
      child: buildCategoriesList(categ),
    );
  }

  buildCategoriesList(categ) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categ.length,
      itemBuilder: (context, index) {
        return Container(
          width: Get.width / 5.7,
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              categoryImage(categ, index),
              categoryText(categ, index),
            ],
          ),
        );
      },
    );
  }

  categoryImage(categ, index) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(1, 0),
            ),
          ],
          color: colorOffWhite,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(categ[index]["images"]),
          ),
        ),
      ),
    );
  }

  categoryText(categ, index) {
    return Expanded(
      child: simpleText(
        text: categ[index]["name"],
        fontsize: 10.0,
        textColor: colorGrey,
        fontweight: FontWeight.bold,
      ),
    );
  }

  buildSpecialOffers(specialOfferss) {
    return Container(
      height: Get.height / 3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specialOfferss.length,
        itemBuilder: (context, index) {
          return specialOfferItem(specialOfferss, index);
        },
      ),
    );
  }

  specialOfferItem(specialOffersList, index) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
        image: DecorationImage(image: AssetImage(specialOffersList[index]["image"]), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(8.r),
      ),
      margin: EdgeInsets.only(left: 8.w, top: 8.h),
      width: Get.width / 2.4,
      child: Stack(
        children: [
          detailsCard(specialOffersList, index),
        ],
      ),
    );
  }

  detailsCard(specialOffersList, index) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      top: Get.height / 6,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: colorDeepOrange, size: 13.h),
                horizontalSpace(3.w),
                simpleText(
                  text: specialOffersList[index]["rating"],
                  fontsize: 12,
                  textColor: colorGrey,
                  fontweight: FontWeight.bold,
                ),
              ],
            ),
            verticalSpace(6.h),
            simpleText(
              text: specialOffersList[index]["name"],
              fontsize: 14,
              textColor: colorGrey,
              fontweight: FontWeight.bold,
            ),
            verticalSpace(6.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 6.r,
                  backgroundImage: AssetImage(specialOffersList[index]["profile"]),
                ),
                horizontalSpace(5.w),
                simpleText(
                  text: specialOffersList[index]["pname"],
                  fontsize: 12,
                  textColor: colorGrey,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  buildTopProviders(specialOfferss) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: specialOfferss.length,
        itemBuilder: (context, index) {
          return topProviderItem(specialOfferss, index);
        },
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  topProviderItem(list, index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      padding: EdgeInsets.only(right: 10.h),
      decoration: BoxDecoration(
        color: colorOffWhite,
        borderRadius: BorderRadius.circular(8.r),
      ),
      height: Get.height / 6,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: profilePic(list, index),
          ),
          Expanded(
            flex: 4,
            child: providerInfo(list, index),
          ),
          Expanded(
            flex: 2,
            child: availablityStatus(list, index),
          ),
        ],
      ),
    );
  }

  profilePic(list, index) {
    return Container(
        margin: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: colorBlack,
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(list[index]["profilePic"])),
        ));
  }

  providerInfo(list, index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 17.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          simpleText(text: list[index]["pname"], textColor: colorGrey, fontsize: 12.0),
          simpleText(
            text: list[index]["name"],
            textColor: colorGrey,
            fontsize: 14.0,
            fontweight: FontWeight.bold,
          ),
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: colorDeepOrange, size: 13.h),
                  horizontalSpace(3.w),
                  simpleText(
                    text: list[index]["rating"],
                    fontsize: 12,
                    textColor: colorGrey,
                    fontweight: FontWeight.bold,
                  ),
                  horizontalSpace(10.w),
                  Container(
                    width: 1,
                    color: colorBlack,
                    height: 10, //remember this maybe it thorw error
                  ),
                  horizontalSpace(10.w),
                  simpleText(
                    text: list[index]["distance"],
                    fontsize: 12,
                    textColor: colorGrey,
                    fontweight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  availablityStatus(list, index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: backgroundColor,
      ),
      child: simpleText(
        text: list[index]["status"],
        fontsize: 10,
        textColor: controlleHomePage.getStatusColor(list[index]["status"]),
        fontweight: FontWeight.bold,
      ),
    );
  }

  customBottomNavBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
      child: Obx(
        () => BottomNavigationBar(
          selectedLabelStyle: TextStyle(
            fontFamily: "varela",
            color: colorGrey,
            fontWeight: FontWeight.bold,
          ),
          unselectedItemColor: colorGrey,
          showUnselectedLabels: true,
          selectedItemColor: colorNavigationItem,
          currentIndex: controlleHomePage.bottomNavBarIndex.value,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: "Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
          onTap: (index) {
            controlleHomePage.bottomNavBarIndex.value = index;
          },
        ),
      ),
    );
  }
}
