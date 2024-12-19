import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resto_chief_interface/components/orange_button.dart';

class AddNewItemScreen extends StatefulWidget {
  const AddNewItemScreen({super.key});

  @override
  State<AddNewItemScreen> createState() => _AddNewItemScreenState();
}

class _AddNewItemScreenState extends State<AddNewItemScreen> {
  final ImagePicker _picker = ImagePicker();
  final itemNameController = TextEditingController();
  final priceController = TextEditingController();
  final detailsController = TextEditingController();

  List<File?> _images = [null, null, null, null];

  Future<void> _pickImage(int index) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _images[index] = File(pickedFile.path);
      });
    }
  }

  void onReset() {
    setState(() {
      _images = [null, null, null, null];
      itemNameController.clear();
      priceController.clear();
      detailsController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Add New Item',
          style: TextStyle(color: Color(0xff32343E)),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffECF0F4),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 18,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: onReset,
              child: const Text(
                'RESET',
                style: TextStyle(color: Color(0xffFB6D3A)),
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('ITEM NAME'),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                child: TextField(
                  controller: itemNameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintText: 'Mazalichiken Halim',
                    hintStyle: const TextStyle(
                      color: Color(0xff9C9BA6),
                    ),
                  ),
                ),
              ),
              const Text('UPLOAD PHOTO/VIDEO'),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                height: width * 0.355,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _pickImage(index),
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: width * 0.35,
                        decoration: BoxDecoration(
                          color: const Color(0xffFDFDFD),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: _images[index] != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.file(
                                  _images[index]!,
                                  height: width * 0.35,
                                  width: width * 0.35,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffeceaf5),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.cloud_upload_outlined,
                                      color: Color(0xff523BB1),
                                    ),
                                  ),
                                  Text(
                                    'Add',
                                    style:
                                        TextStyle(color: Colors.grey.shade500),
                                  ),
                                ],
                              ),
                      ),
                    );
                  },
                ),
              ),
              const Text('PRICE'),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                child: TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintText: '₹100',
                    hintStyle: const TextStyle(
                      color: Color(0xff9C9BA6),
                    ),
                  ),
                ),
              ),
              const Text('DETAILS'),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                child: TextField(
                  maxLines: 5,
                  controller: detailsController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    hintText: 'cooking instructions etc.',
                    hintStyle: const TextStyle(
                      color: Color(0xff9C9BA6),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              const OrangeButton(text: 'SAVE CHANGES')
            ],
          ),
        ),
      ),
    );
  }
}
