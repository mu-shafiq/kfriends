import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kfriends/Controllers/mongodb_controller.dart';
import 'package:kfriends/Utils/colors.dart';
import 'package:kfriends/Utils/constants.dart';
import 'package:kfriends/Utils/helper.dart';
import 'package:kfriends/Utils/keys.dart';
import 'package:kfriends/Widgets/small_button.dart';
import 'package:kfriends/model/thinking.dart';

class ThinkingController extends GetxController {
  TextEditingController contentController = TextEditingController();
  MongoDBController mongodbController = Get.find<MongoDBController>();

  List<Thinking> thinkings = [];
  List files = [];
  List existingLinks = [];
  List<File> filesToBeUploaded = <File>[];
  bool loading = false;
  int selectedPostIndex = 0; 

  updateFile(File file) {
    filesToBeUploaded.contains(file)
        ? filesToBeUploaded.remove(file)
        : filesToBeUploaded.add(file);
    update();
  }

  updateLinkFile(String file) {
    existingLinks.contains(file)
        ? existingLinks.remove(file)
        : existingLinks.add(file);
    update();
  }

  updateIndex(int index) {
    selectedPostIndex = index;
    update();
  }

  // enableEdit() {
  //   interestController.text = posts[selectedPostIndex].interest.first;
  //   titleController.text = posts[selectedPostIndex].title;
  //   contentController.text = posts[selectedPostIndex].content;
  //   existingLinks = List.from(posts[selectedPostIndex].files);
  //   filesToBeUploaded.clear();
  //   update();
  // }

  addAThinking() async {
    try {
      EasyLoading.show();
      files.clear();
      for (var file in filesToBeUploaded) {
        files.add((await Helper().uploadImage(file, Keys.profileImage))!);
      }
      Thinking thinking = Thinking(
          userId: currentUser!.id!,
          userName: currentUser!.nickname,
          userImage: currentUser!.profileImage,
          verified: currentUser!.userType == 'korean',
          content: contentController.text,
          files: files);
      Map<String, dynamic>? res = await mongodbController.postDocument(
          Keys.thinking, thinking.toJson());
      if (res![Keys.status] == Keys.success) {
        thinkings.add(Thinking.fromJson(res[Keys.data]['response']));
        update();
        Helper().showToast("Thinking uploaded successfully");

        clear();
        EasyLoading.dismiss();
        getAllThinkings();
        Get.back();
      } else {
        mongodbController.throwExpection(res);
      }
    } catch (e) {
      EasyLoading.dismiss();
      Helper().showToast(e.toString());
    }
  }

  getAllThinkings() async {
    try {
      loading = true;
      update();
      Map<String, dynamic>? res = await mongodbController.getCollection(
        Keys.thinking,
        // queries: ['limit=1']
      );
      if (res![Keys.status] == Keys.success) {
        thinkings = List.from(res[Keys.data]['response'])
            .map((e) => Thinking.fromJson(e))
            .toList();

        loading = false;
        update();
      } else {
        mongodbController.throwExpection(res);
        return [];
      }
    } catch (e) {
      loading = false;
      update();
    }
  }

  // updateAPost() async {
  //   try {
  //     EasyLoading.show();
  //     for (var file in filesToBeUploaded) {
  //       existingLinks
  //           .add((await Helper().uploadImage(file, Keys.profileImage))!);
  //     }

  //     Post post = posts[selectedPostIndex];
  //     post.title = titleController.text;
  //     post.interest = [interestController.text];
  //     post.content = contentController.text;
  //     post.files = existingLinks;
  //     Map<String, dynamic>? res = await mongodbController.patchDocument(
  //         'timeline/posts', posts[selectedPostIndex].id!, post.toJson());
  //     if (res![Keys.status] == Keys.success) {
  //       posts[selectedPostIndex] = post;
  //       Helper().showToast("Post updated successfully");
  //       clear();
  //       EasyLoading.dismiss();
  //       update();
  //       Get.back();
  //     } else {
  //       mongodbController.throwExpection(res);
  //     }
  //   } catch (e) {
  //     EasyLoading.dismiss();
  //     Get.back();
  //     Helper().showToast(e.toString());
  //   }
  // }

  // addALike() async {
  //   try {
  //     Post post = posts[selectedPostIndex];
  //     post.likes!.add(currentUser!.id!);
  //     Map<String, dynamic>? res = await mongodbController.patchDocument(
  //         'timeline/posts', posts[selectedPostIndex].id!, post.toJson());
  //     if (res![Keys.status] == Keys.success) {
  //       posts[selectedPostIndex] = post;
  //       update();

  //       Helper().showToast("You liked this post");
  //     } else {
  //       mongodbController.throwExpection(res);
  //     }
  //   } catch (e) {
  //     Helper().showToast(e.toString());
  //   }
  // }

  // removeALike() async {
  //   try {
  //     Post post = posts[selectedPostIndex];
  //     post.likes!.remove(currentUser!.id);
  //     Map<String, dynamic>? res = await mongodbController.patchDocument(
  //         'timeline/posts', posts[selectedPostIndex].id!, post.toJson());
  //     if (res![Keys.status] == Keys.success) {
  //       posts[selectedPostIndex] = post;
  //       update();
  //       // Helper().showToast("You liked this post");
  //     } else {
  //       mongodbController.throwExpection(res);
  //     }
  //   } catch (e) {
  //     Helper().showToast(e.toString());
  //   }
  // }

  // deleteAPosts() async {
  //   try {
  //     loading = true;
  //     update();
  //     Map<String, dynamic>? res = await mongodbController.deleteDocument(
  //         'timeline/posts', posts[selectedPostIndex].id!);
  //     if (res![Keys.status] == Keys.success) {
  //       Helper().showToast('Post deleted successfully');
  //       posts.removeAt(selectedPostIndex);
  //       update();
  //       Get.back();
  //     } else {
  //       mongodbController.throwExpection(res);
  //       return [];
  //     }
  //   } catch (e) {
  //     Helper().showToast('Unable to delete post');
  //   }
  // }

  Future<File?> imagePickerDialog() async {
    File? image;
    await Get.dialog(
      AlertDialog(
        shape: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        content: SizedBox(
          height: 0.2.sh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedSmallButton(
                selected: true,
                onTap: () async {
                  image = await Helper().imagePicker(ImageSource.gallery);
                  Get.back();
                },
                textColor: textWhiteColor,
                shadow1: buttonBlackShadow1,
                shadow2: buttonBlackShadow2,
                selectedColor: buttonBlueColor2,
                width: 160.w,
                height: 30.h,
                text: 'Gallery',
              ),
              RoundedSmallButton(
                selected: true,
                onTap: () async {
                  image = await Helper().imagePicker(ImageSource.camera);
                  Get.back();
                },
                textColor: textWhiteColor,
                shadow1: buttonBlackShadow1,
                shadow2: buttonBlackShadow2,
                selectedColor: buttonBlueColor2,
                width: 160.w,
                height: 30.h,
                text: 'Camera',
              ),
            ],
          ),
        ),
      ),
    );
    return image;
  }

  clear() {
    contentController.clear();
    filesToBeUploaded.clear();
    update();
  }

  @override
  void onInit() {
    getAllThinkings();
    super.onInit();
  }
}
