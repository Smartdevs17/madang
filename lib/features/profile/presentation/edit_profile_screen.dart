import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madang/features/profile/controller/profile_controller.dart';
import 'package:madang/features/profile/models/user_model.dart';
import 'package:madang/utils/theme/theme.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;

  const EditProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  // late TextEditingController _avatarController;

  File? _avatarImage;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
    _phoneController = TextEditingController(text: widget.user.phone);
    // _avatarController = TextEditingController(text: widget.user.avatar);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    // _avatarController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _avatarImage = File(image.path);
      });
    }
  }

  void _saveProfile() {
    if (_formKey.currentState?.validate() ?? false) {
      // Update user model
      Map<String, dynamic> updatedUser = {
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
      };

      // Save updated user model to the backend or state management
      Get.find<ProfileController>().updateUser(widget.user.id, updatedUser);

      // Navigate back to the previous screen
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLT,
      appBar: AppBar(
        backgroundColor: primaryColorLT,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: primaryColorDK),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveProfile,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: _avatarImage != null
                        ? FileImage(_avatarImage!)
                        : widget.user.avatar.isNotEmpty
                            ? NetworkImage(widget.user.avatar)
                            : const AssetImage(
                                    'assets/images/photo profile.png')
                                as ImageProvider,
                    child: const Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.edit, size: 15),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextFormField(
                  controller: _nameController,
                  labelText: "Name",
                  hintText: "Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _buildTextFormField(
                  controller: _emailController,
                  labelText: "Email",
                  hintText: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _buildTextFormField(
                  controller: _phoneController,
                  labelText: "Phone",
                  hintText: "Phone",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone';
                    }
                    return null;
                  },
                ),
                // const SizedBox(height: 20),
                // _buildTextFormField(
                //   controller: _avatarController,
                //   labelText: "Avatar URL",
                //   hintText: "Avatar URL",
                // ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: _saveProfile,
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: mainColorDK,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Save Profile",
                        style: TextStyle(
                          color: primaryColorLT,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: textColor,
        fontSize: 16,
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: mainColor,
            width: 1.0,
          ),
        ),
        labelStyle: const TextStyle(
          color: mainColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      validator: validator,
      cursorColor: mainColorDK,
      cursorErrorColor: mainColorDK,
    );
  }
}
