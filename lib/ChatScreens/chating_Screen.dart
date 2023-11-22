import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/textfield.dart';

class ChatingScreen extends StatelessWidget {
  const ChatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(index: 1),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(Assets.backArrow)),
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 12.r,
              child: Image.asset(Assets.user1),
            ),
            3.horizontalSpace,
            Text(
              '김민준',
              style: TextStyle(
                color: textBlackColor,
                fontSize: 10.sp,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.reportScreen);
            },
            child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4,
                        offset: Offset(1, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Image.asset(Assets.more),
                )),
          )
        ],
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        width: .94.sw,
        child: Row(
          children: [
            Image.asset(
              Assets.add,
              scale: .8,
            ),
            7.horizontalSpace,
            CustomTextfield(
                height: 40.h,
                width: .80.sw,
                hintSize: 10.sp,
                hint: 'Enter your message here💬'.tr,
                controller: TextEditingController())
          ],
        ),
      ),
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xffFFFFFF),
              Color(0xffFFF6E2),
              Color(0xffFFE6AF),
              Color(0xffFFE6AF)
            ])),
        child: Column(
          children: [
            10.verticalSpace,
            Text(
              '2023-06-19',
              style: TextStyle(
                color: textBlackColor,
                fontSize: 10.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            20.verticalSpace,
            SizedBox(
              width: .94.sw,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8),
                      child: messageTile(
                          '반가워요! 저와 함께 대화 하면서 한국 문화와 한국어를 많이 알아갈 수 있으면 좋겠네요!',
                          index.isEven,
                          '15:43',
                          '15:43'),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget messageTile(String text, bool isme, String time1, String time2) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        mainAxisAlignment:
            isme ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          isme
              ? CircleAvatar(
                  radius: 12.r,
                  child: Image.asset(Assets.user1),
                )
              : const SizedBox(),
          5.horizontalSpace,
          !isme
              ? Column(
                  children: [
                    Text(
                      time1,
                      style: TextStyle(
                        color: const Color(0xFF41B6DB),
                        fontSize: 9.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    Text(
                      time2,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.30000001192092896),
                        fontSize: 9.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],
                )
              : const SizedBox(),
          !isme ? 5.horizontalSpace : 0.horizontalSpace,
          Container(
            decoration: ShapeDecoration(
              color: isme ? const Color(0xFFFAFAFA) : const Color(0xFFFFB45B),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              shadows: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
              child: SizedBox(
                width: .35.sw,
                child: Text(
                  text,
                  maxLines: null,
                  style: TextStyle(
                    color: textBlackColor,
                    fontSize: 10.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          5.horizontalSpace,
          isme
              ? Column(
                  children: [
                    Text(
                      time1,
                      style: TextStyle(
                        color: const Color(0xFF41B6DB),
                        fontSize: 9.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    Text(
                      time2,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.30000001192092896),
                        fontSize: 9.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )
                  ],
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
