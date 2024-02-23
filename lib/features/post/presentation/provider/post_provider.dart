import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class PostNotifier extends ChangeNotifier {

  bool _showHotelError = false;
  bool get showHotelError => _showHotelError;

  bool _showFoodError = false;
  bool get showFoodError => _showFoodError;

  List<XFile> uploadedImages = [];
  final picker = ImagePicker();

  TextEditingController placeTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();


  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      uploadedImages.add(image);
    }
    /*// Pick multiple images.
    final List<XFile> images = await picker.pickMultiImage();*/
  }

  Future pickImage() async {
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);

      if(image == null) return;

      uploadedImages.add(image);
      final imageTemp = File(image.path);
      debugPrint('ImagePath $imageTemp');
      notifyListeners();
      // setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      debugPrint('Failed to pick image: $e');
    }
  }


  TextEditingController hotelTextController = TextEditingController();
  final List<String> _hotelsList= [];
  get hotelsList => _hotelsList;

  void addHotel(String value){
    if(value.isNotEmpty){
      _hotelsList.add(value);
      hotelTextController.clear();
      _showHotelError = false;
    }else{
      _showHotelError = true;
    }
    notifyListeners();
  }

  void removeHotel(int index){
    _hotelsList.removeAt(index);
    notifyListeners();
  }

  TextEditingController foodTextController = TextEditingController();
  final List<String> _foodList= [];
  get foodList => _foodList;

  void addFood(String value){
    if(value.isNotEmpty){
      _foodList.add(value);
      foodTextController.clear();
      _showFoodError = false;
    }else{
      _showFoodError = true;
    }
    notifyListeners();
  }

  void removeFood(int index){
    _foodList.removeAt(index);
    notifyListeners();
  }

}
