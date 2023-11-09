import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Widgets/bottom_bar.dart';
import 'package:kfriends/Widgets/chat_tile.dart';

class ChatMainScreen extends StatefulWidget {
  const ChatMainScreen({super.key});

  @override
  State<ChatMainScreen> createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(index: 1),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Image.asset(Assets.settings),
        title: Text(
          'MY CHAT',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textBlackColor,
            fontSize: 14.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Image.asset(Assets.cross))
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.verticalSpace,
                SizedBox(
                  width: .9.sw,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const ChatTile(
                          verified: true,
                          time: '19:43',
                          asset: Assets.user1,
                          username: '김민준',
                          lastchat:
                              '내가 좋아하는 한국 가수는 아이유야! 아이유 노래 혹시들어봤어?? 안 들어봤다면 진짜 꼭 들어봐!!!!',
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
