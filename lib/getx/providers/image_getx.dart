
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  RxString image = ''.obs;
  Future<void> selectImageFromGalleryOrCamera(ImageSource option) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: option);
      if (pickedImage != null) {
        image.value =pickedImage.path.toString();
      }
    } catch (e) {
      throw Exception('Error selecting image: $e');
    }
  }
}
