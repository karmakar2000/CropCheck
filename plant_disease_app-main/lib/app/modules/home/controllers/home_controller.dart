import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

import '../../../model/model_result.dart';

class HomeController extends GetxController {
  File? image;
  var isImageSelected = false.obs;
  var isLoading = false.obs;
  var isSuccess = false.obs;
  Rx<ModelResult>? result;
  final String BASE_URL = 'http://44.209.119.96';

  void reset() {
    image = null;
    isLoading(false);
    isImageSelected(false);
    isSuccess(false);
  }

  Future<void> _predictDisease(File image) async {
    isLoading(true);
    isSuccess(false);
    try {
      final uri = Uri.parse('http://44.209.119.96/predict');
      var request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath('file', image.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        isSuccess(true);

        final res = await http.Response.fromStream(response);
        final Map<String, dynamic> data = json.decode(res.body);
        result = Rx(ModelResult.fromJson(data));
        log('Class: ${data['class']}');
        log('Confidence: ${data['confidence']}');
        log('Solution: ${data['solution']}');
        // Handle the response data as needed
      } else {
        log('Failed to predict disease');
      }
    } catch (e) {
      log("Error on ", error: e);
    } finally {
      isLoading(false);
    }
  }

  void imagePicker(source) async {
    try {
      isImageSelected(false);
      await [Permission.storage, Permission.photos, Permission.camera]
          .request();

      final image = await ImagePicker().getImage(
          imageQuality: 50,
          source:
              source == 'gallery' ? ImageSource.gallery : ImageSource.camera);
      if (image == null) return;

      this.image = File(image.path);
      isImageSelected(true);
      update();
      _predictDisease(File(image.path));
    } on PlatformException catch (e) {
      log(e.toString());
    }
  }
}
