import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Widgets/contact_tile.dart';
import 'package:kfriends/Widgets/textfield.dart';

class ContactSettings extends StatelessWidget {
  const ContactSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.verticalSpace,
              CustomTextfield(
                  height: 40.h,
                  width: .92.sw,
                  hint: 'Search by name',
                  hintSize: 10.sp,
                  trailing: Image.asset(Assets.search),
                  controller: TextEditingController()),
              20.verticalSpace,
              SizedBox(
                width: .9.sw,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.userInfo);
                            },
                            child: const ContactTile(
                              verified: true,
                              asset: Assets.user1,
                              username: '김민준',
                              about: '20 / FEMALE /  South Korea',
                            ),
                          ),
                          Positioned(
                            top: 15.h,
                            left: 10.w,
                            child: Image.asset(
                              Assets.crossblack,
                              scale: 1.1.sp,
                            ),
                          )
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
