import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Widgets/textfield.dart';
import 'package:kfriends/Widgets/user_tile2.dart';
import 'package:kfriends/Controllers/users_controller.dart';
import 'package:kfriends/model/user.dart';

class MyFriends extends StatelessWidget {
  const MyFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
        init: UsersController(),
        builder: (controller) {
          return Column(
            children: [
              30.verticalSpace,
              CustomTextfield(
                height: 40.h,
                width: .9.sw,
                hint: 'Search by name',
                hintSize: 12.sp,
                trailing: Image.asset(Assets.search),
                controller: controller.myFriendController,
                onChanged: (String val) {
                  controller.onSearchChanged(val);
                },
              ),
              30.verticalSpace,
              SizedBox(
                width: .9.sw,
                child: FutureBuilder<List<UserModel>>(
                    future: controller.getMyFriends(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List<UserModel> users = snapshot.data ?? [];
                      if (users.isEmpty) {
                        return const Center(child: Text('No friends'));
                      }
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: users.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            UserModel user = users[index];
                            return InkWell(
                              onTap: () {
                                
                                Get.toNamed(Routes.userInfo, arguments: user);
                              },
                              child: UserTile2(
                                verified: user.userType == korean,
                                asset: Assets.user1,
                                username: user.username,
                                about: user.intro!,
                                agoraUid: user.agoraUid,
                                userModel: user,
                              ),
                            );
                          });
                    }),
              )
            ],
          );
        });
  }
}
