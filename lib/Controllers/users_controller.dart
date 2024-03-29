import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Utils/helper.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:kfriends/model/user.dart';

import 'mongodb_controller.dart';

class UsersController extends GetxController {
  MongoDBController mongodbController = Get.find<MongoDBController>();
  TextEditingController newFriendController = TextEditingController();
  TextEditingController myFriendController = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController countryController = TextEditingController();

  Timer? _debounce;

  // String testingCurrentUserId = '654d444801470455b6ff3533';

  RxString englishProficiency = beginner.obs;
  RxString koreanProficiency = beginner.obs;

  int tab = 0;

  RxInt initAge = 12.obs;
  RxInt finalAge = 100.obs;

  RxBool male = true.obs;
  RxBool isFilterApplied = false.obs;

  RxList<String> interests = <String>[].obs;
  RxList<String> suggestedInterests = <String>['K-CULTURE'].obs;

  RxList myFollowing = [].obs;
  RxList myFollowers = [].obs;

  @override
  void onClose() {
    super.onClose();
    myFriendController.dispose();
    _debounce?.cancel();
  }

  @override
  void onInit() {
    3.seconds.delay().then((value) {
      if (currentUser != null) {
        getMyFollowing();
        getMyFollowers();
      }
    });
    super.onInit();
  }

  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      update();
    });
  }

  void updateGender(bool gender) {
    male.value = gender;
    update();
  }

  void updateEnglishProficiency(String newProficiency) {
    englishProficiency.value = newProficiency;
    update();
  }

  void updateKoreanProficiency(String newProficiency) {
    koreanProficiency.value = newProficiency;
    update();
  }

  void updateInterests(String newInterest) {
    if (interests.contains(newInterest)) {
      interests.remove(newInterest);
    } else {
      interests.add(newInterest);
    }
    update();
  }

  void updateSuggestedInterests(String newInterest) {
    suggestedInterests.clear();
    suggestedInterests.add(newInterest);
    update();
  }

  void resetFilter() {
    initAge.value = 12;
    finalAge.value = 100;
    male.value = true;
    interests.clear();
    countryController.clear();
    englishProficiency.value = beginner;
    koreanProficiency.value = beginner;
    isFilterApplied.value = false;
    update();
  }

  // Future<List<UserModel>> getMyFriends() async {
  //   if (myFriendController.text.trim().isNotEmpty) {
  //     return await getFriends(queries: [
  //       // 'followers[in]=${[currentUser!.id]}',
  //       'username[regex]=${myFriendController.text.trim().toLowerCase()}',
  //       'username[options]=i'
  //     ]);
  //   } else {
  //     return await getFriends(queries: [
  //       // 'followers[in]=${[currentUser!.id]}'
  //     ]);
  //   }
  // }

  Future<List<UserModel>> getNewFriends() async {
    if (isFilterApplied.value) {
      newFriendController.clear();
      return await getFriends(queries: [
        tab == 0 ? 'userType=$korean' : 'userType=$global',
        // 'followers[nin]=${[currentUser!.id]}',
        '_id[ne]=${currentUser!.id}',
        'age[gte]=${initAge.value}',
        'age[lte]=${finalAge.value}',
        'gender=${male.value ? "male" : "female"}',
        'country=${countryController.text.trim()}',
        'englishProficiency=${englishProficiency.value}',
        'koreanProficiency=${koreanProficiency.value}',
        'interests[in]=${interests.join(",")}'
      ]);
    }
    if (newFriendController.text.trim().isNotEmpty) {
      return await getFriends(queries: [
        tab == 0 ? 'userType=$korean' : 'userType=$global',
        // 'followers[nin]=${[currentUser!.id]}',
        'id[ne]=${currentUser!.id}',
        'username[regex]=${newFriendController.text.trim().toLowerCase()}',
        'username[options]=i'
      ]);
    }
    return await getFriends(queries: [
      tab == 0 ? 'userType=$korean' : 'userType=$global',
      // 'followers[nin]=${[currentUser!.id]}',
      '_id[ne]=${currentUser!.id}',
    ]);
  }

  Future<List<UserModel>> getFriends({List<String>? queries}) async {
    print(queries);
    try {
      Map<String, dynamic>? res = await mongodbController.getCollection(
        'users',
        queries: queries ?? [],
      );
      if (res![Keys.status] == Keys.success) {
        return List.from(res[Keys.data]['users'])
            .map((e) => UserModel.fromJson(e))
            .toList();
      } else {
        mongodbController.throwExpection(res);
        return [];
      }
    } catch (e) {
      printError(info: e.toString());
      Helper().showToast("Error in getting new friends");
      return [];
    }
  }

  Future<UserModel> getUser(String userId) async {
    return UserModel.fromJson(((await mongodbController.getDocument(
        Keys.users, userId))!)['data']['user']);
  }

  getMyFollowers() async {
    List res = (await mongodbController.getConnectionFunction(
            Keys.followers, currentUser!.id!))!['data']
        .map((e) => e['follower'])
        .toList();

    myFollowers(res);
    update();
  }

  getMyFollowing() async {
    List res = (await mongodbController.getConnectionFunction(
            Keys.following, currentUser!.id!))!['data']
        .map((e) => e['follow'])
        .toList();

    myFollowing(res);
    update();
  }

  Future<bool> followUser(String followId) async {
    print("followId: $followId");
    print('myid ${currentUser!.id}');
    try {
      Map<String, dynamic>? res = await mongodbController.putConnectionFunction(
        Keys.followUser,
        data: {
          'follower': currentUser!.id,
          'follow': followId,
        },
      );
      if (res![Keys.status] == Keys.success) {
        myFollowing.add(followId);
        Helper().showToast("User followed successfully");
        return true;
      } else {
        mongodbController.throwExpection(res);
        return false;
      }
    } catch (e) {
      Helper().showToast("Error in following user");
      return false;
    }
  }

  Future<bool> unFollowUser(String followId) async {
    try {
      Map<String, dynamic>? res = await mongodbController.putConnectionFunction(
        Keys.unFollowUser,
        data: {
          'follower': currentUser!.id,
          'follow': followId,
        },
      );
      if (res![Keys.status] == Keys.success) {
        myFollowing.remove(followId);

        Helper().showToast("User unfollowed successfully");
        return true;
      } else {
        mongodbController.throwExpection(res);
        return false;
      }
    } catch (e) {
      printError(info: e.toString());
      Helper().showToast("Error in unfollowing user");
      return false;
    }
  }
}
