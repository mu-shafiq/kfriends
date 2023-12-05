import 'dart:io';
import 'dart:math';

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
import 'package:kfriends/model/post.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class TimelineController extends GetxController {
  TextEditingController interestController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  MongoDBController mongodbController = Get.find<MongoDBController>();

  List<Post> posts = [];
  List files = [];
  List<File> filesToBeUploaded = <File>[];
  bool loading = false;
  int selectedPostIndex = 0;

  updateFile(File file) {
    filesToBeUploaded.contains(file)
        ? filesToBeUploaded.remove(file)
        : filesToBeUploaded.add(file);
    update();
  }

  updateInterest(String interest) {
    interestController.text = interest;
    update();
  }

  updateIndex(int index) {
    selectedPostIndex = index;
    update();
  }

  enableEdit() {
    print(files);
    interestController.text = posts[selectedPostIndex].interest;
    titleController.text = posts[selectedPostIndex].title;
    contentController.text = posts[selectedPostIndex].content;
    files = posts[selectedPostIndex].files;
    filesToBeUploaded.clear();
    filesToBeUploaded = posts[selectedPostIndex].files.map((e) {
      return File.fromUri(Uri(path: e));
    }).toList();
    update();
  }

  Future<File> urlToFile(String imageUrl) async {
    var rng = Random();
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File file = File('$tempPath${rng.nextInt(100)}.png');
    http.Response response = await http.get(Uri.parse(imageUrl));
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }

  addAPost() async {
    try {
      EasyLoading.show();
      files.clear();
      for (var file in filesToBeUploaded) {
        files.add((await Helper().uploadImage(file, Keys.profileImage))!);
      }
      Post post = Post(
          userId: currentUser!.id!,
          userName: currentUser!.nickname,
          userImage: currentUser!.profileImage,
          title: titleController.text,
          interest: interestController.text,
          content: contentController.text,
          files: files);
      Map<String, dynamic>? res =
          await mongodbController.postDocument('timeline', post.toJson());
      if (res![Keys.status] == Keys.success) {
        print('here is the res : ${res[Keys.data]['response']}');
        posts.add(Post.fromJson(res[Keys.data]['response']));
        Helper().showToast("Post uploaded successfully");

        clear();
        EasyLoading.dismiss();
        getAllPosts();
        Get.back();
      } else {
        mongodbController.throwExpection(res);
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e.toString());
      Helper().showToast(e.toString());
    }
  }

  getAllPosts() async {
    try {
      loading = true;
      update();
      Map<String, dynamic>? res = await mongodbController.getCollection(
        'timeline',
      );
      if (res![Keys.status] == Keys.success) {
        posts = List.from(res[Keys.data]['response'])
            .map((e) => Post.fromJson(e))
            .toList();
        print(posts[0].toJson());
        loading = false;
        update();
      } else {
        mongodbController.throwExpection(res);
        return [];
      }
    } catch (e) {
      loading = false;
      update();
      // TODO
    }
  }

  updateAPosts() async {
    try {
      EasyLoading.show();
      files.clear();
      for (var file in filesToBeUploaded) {
        files.add((await Helper().uploadImage(file, Keys.profileImage))!);
      }
      Post post = Post(
          id: posts[selectedPostIndex].id,
          userId: currentUser!.id!,
          userName: currentUser!.nickname,
          userImage: currentUser!.profileImage,
          title: titleController.text,
          interest: interestController.text,
          content: contentController.text,
          files: files);
      Map<String, dynamic>? res = await mongodbController.patchDocument(
          'timeline', posts[selectedPostIndex].id!, post.toJson());
      if (res![Keys.status] == Keys.success) {
        print('here is the res : ${res[Keys.data]['response']}');
        posts[selectedPostIndex] = Post.fromJson(res[Keys.data]['response']);
        Helper().showToast("Post updated successfully");
        clear();
        EasyLoading.dismiss();
        Get.back();
      } else {
        mongodbController.throwExpection(res);
      }
    } catch (e) {
      EasyLoading.dismiss();
      Get.back();
      print(e.toString());
      Helper().showToast(e.toString());
    }
  }

  deleteAPosts() async {
    try {
      loading = true;
      update();
      Map<String, dynamic>? res = await mongodbController.deleteDocument(
          'timeline', posts[selectedPostIndex].id!);
      if (res![Keys.status] == Keys.success) {
        Helper().showToast('Post deleted successfully');
        posts.removeAt(selectedPostIndex);
        update();
        Get.back();
      } else {
        mongodbController.throwExpection(res);
        return [];
      }
    } catch (e) {
      Helper().showToast('Unable to delete post');
    }
  }

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
    interestController.clear();
    titleController.clear();
    contentController.clear();
    files.clear();
    filesToBeUploaded.clear();
    update();
  }

  @override
  void onInit() {
    getAllPosts();
    super.onInit();
  }
}
