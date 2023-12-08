import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Widgets/contact_tile.dart';
import 'package:kfriends/Widgets/textfield.dart';
import 'package:kfriends/model/user.dart';

import '../../Routes/get_routes.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextfield(
                  height: 40.h,
                  width: .92.sw,
                  hint: 'Search by name'.tr,
                  hintSize: 10.sp,
                  trailing: Image.asset(Assets.search),
                  controller: TextEditingController()),
              20.verticalSpace,
              SizedBox(
                width: .9.sw,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 8,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.userInfo, arguments: currentUser);
                        },
                        child: const ContactTile(
                          verified: true,
                          asset: Assets.user1,
                          username: '김민준',
                          about: '20 / FEMALE /  South Korea',
                        ),
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
