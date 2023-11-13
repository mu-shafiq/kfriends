import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Widgets/textfield.dart';
import 'package:kfriends/Widgets/user_tile2.dart';

class MyFriends extends StatelessWidget {
  const MyFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        30.verticalSpace,
        CustomTextfield(
            height: 40.h,
            width: .9.sw,
            hint: 'Search by name',
            hintSize: 12.sp,
            trailing: Image.asset(Assets.search),
            controller: TextEditingController()),
        25.verticalSpace,
        SizedBox(
          width: .9.sw,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.userInfo);
                  },
                  child: const UserTile2(
                    verified: true,
                    asset: Assets.user1,
                    username: '김민준',
                    about: '안녕하세요! 반가워요!대화 걸어주세요~',
                  ),
                );
              }),
        )
      ],
    );
  }
}
