import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kfriends/Controllers/calls_controller.dart';
import 'package:kfriends/Routes/get_routes.dart';
import 'package:kfriends/Utils/assets.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Widgets/call_user_tile.dart';
import 'package:kfriends/model/call_logs.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CallsController>(builder: (controller) {
      return SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: .94.sw,
                  height: 30.h,
                  decoration: ShapeDecoration(
                    color: boxBlueColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 8,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Total Call Duration'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textWhiteColor,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        20.horizontalSpace,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '123:51',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textWhiteColor,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        20.horizontalSpace,
                        Text(
                          '|',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textWhiteColor,
                            fontSize: 10.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        20.horizontalSpace,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Remain Call Time'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textWhiteColor,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        20.horizontalSpace,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '240:00',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textWhiteColor,
                                fontSize: 10.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                Container(
                  width: .9.sw,
                  height: 30.h,
                  decoration: ShapeDecoration(
                    color: bgWhiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 8,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 124.w,
                          height: 12.h,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '2023-03-28',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: textGreyColor,
                                  fontSize: 10.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 0.15,
                                ),
                              ),
                              Image.asset(Assets.calender),
                            ],
                          ),
                        ),
                        Image.asset(Assets.equal),
                        SizedBox(
                          width: 124.w,
                          height: 12.h,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '2023-06-28',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: textGreyColor,
                                  fontSize: 10.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 0.15,
                                ),
                              ),
                              Image.asset(Assets.calender),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                SizedBox(
                  width: .9.sw,
                  child: FutureBuilder<List<CallLogModel>>(
                      future: controller.getCallLogs(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const SizedBox();
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              snapshot.error.toString(),
                            ),
                          );
                        }
                        List<CallLogModel> callLogs = snapshot.data!;
                        if (callLogs.isEmpty) {
                          return Center(
                            child: Text(
                              'No Call Logs Found'.tr,
                            ),
                          );
                        }

                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: callLogs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              CallLogModel callLog = callLogs[index];
                              return GestureDetector(
                                onTap: () async {
                                  await controller
                                      .makeACall(callLog.contactId!.id!);
                                },
                                child: CallUserTile(
                                  date: DateFormat('yyyy-MM-dd')
                                      .format(callLog.callId!.startAt!),
                                  status: callLog.callId!.status!,
                                  verified:
                                      callLog.contactId!.userType == korean,
                                  profileUrl: callLog.contactId!.profileImage,
                                  username: callLog.contactId!.nickname,
                                  about: '20 / FEMALE /  South Korea',
                                  time:
                                      formatDuration(callLog.callId!.duration!),
                                ),
                              );
                            });
                      }),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));

    return '$minutes:$seconds';
  }
}
