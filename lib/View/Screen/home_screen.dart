import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:simple_task/size_config.dart';
import 'package:simple_task/utils/app_color.dart';
import 'package:simple_task/utils/app_image.dart';
import 'package:simple_task/utils/app_text.dart';

import '../../utils/app_style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xFF08372B)));
    return Scaffold(
        backgroundColor: Color(0xFFEDEDED),
        body: ListView(
          children: [
            Stack(children: [
              SizedBox(
                height: kHeight(600),
                width: SizeConfig.screenWidth,
              ),
              Container(
                height: kHeight(500),
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColor.bgColor, AppColor.bgColor2]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(kWidth(18)),
                        bottomRight: Radius.circular(kWidth(18)))),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        AppText.NAME,
                        style: AppStyle.kTextStyle,
                      ),
                      subtitle: Text(
                        AppText.SUBTEXT,
                        style: AppStyle.kTextStyle.copyWith(
                            color: const Color(0xFFFFFFFF).withOpacity(0.7),
                            fontSize: kWidth(15),
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),
                      ),
                      trailing: CircleAvatar(
                        radius: kWidth(20),
                        backgroundImage: AssetImage(AppImage.profile),
                      ),
                    ),
                    SizedBox(
                      height: kHeight(25),
                    ),
                    Container(
                      height: kHeight(225),
                      width: kWidth(330),
                      padding: EdgeInsets.only(
                          left: kWidth(15),
                          right: kWidth(10),
                          top: kHeight(15)),
                      decoration: BoxDecoration(
                          color: AppColor.bannerBG,
                          borderRadius: BorderRadius.circular(kWidth(15))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppText.WELCOME,
                            style: AppStyle.kTextStyle.copyWith(
                                fontSize: kWidth(18),
                                color: AppColor.fontColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: kHeight(5),
                          ),
                          Text(
                            AppText.MEEAGES,
                            style: AppStyle.kTextStyle.copyWith(
                                color: const Color(0xFFFFFFFF).withOpacity(0.7),
                                fontSize: kWidth(15),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: kHeight(40),
                                  width: kWidth(90),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF24966D),
                                      borderRadius:
                                          BorderRadius.circular(kWidth(14))),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: kWidth(8)),
                                    child: Row(
                                      children: [
                                        Image.asset(AppImage.pause),
                                        SizedBox(
                                          width: kWidth(5),
                                        ),
                                        Text(
                                          'Watch',
                                          style: AppStyle.kTextStyle.copyWith(
                                              color: AppColor.fontColor,
                                              fontSize: kWidth(14),
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  )),
                              Image.asset(AppImage.banner)
                            ],
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      title: Text(
                        AppText.REMINDER,
                        style: AppStyle.kTextStyle.copyWith(
                            color: AppColor.fontColor,
                            fontSize: kWidth(18),
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: Text('See all',
                          style: AppStyle.kTextStyle.copyWith(
                              color: const Color(0xFFFFFFFF).withOpacity(0.7),
                              fontSize: kWidth(14),
                              fontWeight: FontWeight.w400)),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: kWidth(20),
                left: kWidth(10),
                right: kWidth(10),
                child: CarouselSlider(
                    items: [
                      customeItem(
                          color: const Color(0xFFFBAB32),
                          title: 'Online Class Routine',
                          subTitle: 'Save Date:',
                          date: '10/12/2022'),
                      customeItem(
                          color: const Color(0xFF6CA42E),
                          title: 'Office Work List',
                          subTitle: 'Save Date:',
                          date: '15/12/2022'),
                      customeItem(
                          color: const Color(0xFF3179E4),
                          title: 'Day Task',
                          subTitle: 'Save Date:',
                          date: '20/12/2022'),
                    ],
                    options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 3 / 1.2,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9)),
              ),
            ]),
            ListTile(
              title: Text(
                AppText.TASKS,
                style: AppStyle.kTextStyle.copyWith(color: Color(0xFF042E2B)),
              ),
              trailing: Text(
                'See All',
                style: AppStyle.kTextStyle.copyWith(
                    color: Color(0xFF042E2B),
                    fontSize: kWidth(14),
                    fontWeight: FontWeight.w400),
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(left: kWidth(10), right: kWidth(10)),
                    child: Card(
                      elevation: 1.1,
                      child: Container(
                        height: kHeight(100),
                        width: kWidth(300),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(kWidth(18))),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: kWidth(10), top: kHeight(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: kHeight(60),
                                width: kWidth(60),
                                decoration: BoxDecoration(
                                    color: Color(0xFFFBAB32),
                                    borderRadius:
                                        BorderRadius.circular(kWidth(5)),
                                    image: DecorationImage(
                                        image: AssetImage(AppImage.list))),
                              ),
                              SizedBox(
                                width: kWidth(10),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Online Class Routine',
                                    style: AppStyle.kTextStyle.copyWith(
                                        color: Color(0xFF042E2B),
                                        fontSize: kWidth(16),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: kHeight(10),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Save Date:',
                                        style: AppStyle.kTextStyle.copyWith(
                                            color: Color(0xFF042E2B)
                                                .withOpacity(0.5),
                                            fontSize: kWidth(14),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        '10/12/2022',
                                        style: AppStyle.kTextStyle.copyWith(
                                            color: Color(0xFF042E2B)
                                                .withOpacity(0.5),
                                            fontSize: kWidth(14),
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(),
                itemCount: 4)
          ],
        ),
        bottomNavigationBar: Container(
          height: kHeight(100),
          padding: EdgeInsets.only(top: kHeight(20)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kWidth(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              customBottomNavigationItem(
                  onTap: () {},
                  image: AppImage.home,
                  text: 'Home',
                  color: const Color(0xFF042E2B)),
              customBottomNavigationItem(
                  onTap: () {},
                  image: AppImage.search,
                  text: 'Search',
                  color: const Color(0xFFB4C1C0)),
              customBottomNavigationItem(
                  onTap: () {},
                  image: AppImage.record,
                  text: 'Record',
                  color: const Color(0xFFB4C1C0)),
              customBottomNavigationItem(
                  onTap: () {},
                  image: AppImage.save,
                  text: 'Saved',
                  color: const Color(0xFFB4C1C0)),
              customBottomNavigationItem(
                  onTap: () {},
                  image: AppImage.setting,
                  text: 'Settings',
                  color: const Color(0xFFB4C1C0)),
            ],
          ),
        ));
  }

  Widget customBottomNavigationItem(
      {required String image,
      String? text,
      required Function()? onTap,
      required Color? color}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(image),
          SizedBox(
            height: kHeight(8),
          ),
          Text(text!,
              style: AppStyle.kTextStyle.copyWith(
                  color: color,
                  fontSize: kWidth(14),
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget customeItem(
      {required String title,
      required String subTitle,
      required String date,
      Color? color}) {
    return Container(
      width: kWidth(160),
      padding: EdgeInsets.only(left: kWidth(8)),
      decoration: BoxDecoration(
        color: AppColor.fontColor,
        borderRadius: BorderRadius.circular(kWidth(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 2,
            child: Container(
              height: kHeight(60),
              width: kWidth(60),
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(kWidth(5)),
                  image: DecorationImage(image: AssetImage(AppImage.list))),
            ),
          ),
          SizedBox(
            height: kHeight(5),
          ),
          Text(
            title,
            style: AppStyle.kTextStyle.copyWith(
                color: const Color(0xFF042E2B),
                fontSize: kWidth(16),
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: kHeight(5),
          ),
          Row(
            children: [
              Text(
                subTitle,
                style: AppStyle.kTextStyle.copyWith(
                    color: const Color(0xFF042E2B).withOpacity(0.5),
                    fontSize: kWidth(14),
                    fontWeight: FontWeight.w400),
              ),
              Text(
                date,
                style: AppStyle.kTextStyle.copyWith(
                    color: const Color(0xFF042E2B).withOpacity(0.5),
                    fontSize: kWidth(14),
                    fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    );
  }
}
