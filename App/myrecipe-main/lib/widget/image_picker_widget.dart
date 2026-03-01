import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RecipeImagePicker extends StatefulWidget {
  // สังเกตว่าแก้ตรงนี้ให้รับค่า (File?) แบบมีเครื่องหมาย ? เพื่อให้ส่งค่า null (ตอนลบรูป) กลับไปได้ครับ
  final Function(File?)? onImageSelected; 
  
  final bool isCircle; 
  final double width;
  final double height;

  const RecipeImagePicker({
    super.key, 
    this.onImageSelected,
    this.isCircle = false, 
    this.width = 150,      
    this.height = 150,     
  });

  @override
  State<RecipeImagePicker> createState() => _RecipeImagePickerState();
}

class _RecipeImagePickerState extends State<RecipeImagePicker> {
  File? _selectedImage; 

  // ฟังก์ชันเลือกรูป (รับค่า source ว่าจะเอากล้องหรือแกลลอรี่)
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      if (widget.onImageSelected != null) {
        widget.onImageSelected!(_selectedImage);
      }
    }
  }

  // ฟังก์ชันลบรูปภาพ
  void _removeImage() {
    setState(() {
      _selectedImage = null; // เคลียร์รูปออกจากหน้าจอ
    });
    if (widget.onImageSelected != null) {
      widget.onImageSelected!(null); // ส่งค่าว่างกลับไปบอกหน้าหลักว่ารูปลบไปแล้ว
    }
  }

  // เมนูเด้งจากด้านล่าง (Bottom Sheet)
  void _showOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('เลือกรูปภาพ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('ถ่ายรูปใหม่'),
                onTap: () {
                  Navigator.pop(context); // ปิดเมนูก่อน
                  _pickImage(ImageSource.camera); // เปิดกล้อง
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('เลือกจากแกลลอรี่'),
                onTap: () {
                  Navigator.pop(context); // ปิดเมนูก่อน
                  _pickImage(ImageSource.gallery); // เปิดแกลลอรี่
                },
              ),
              // จะโชว์ปุ่ม "ลบรูปภาพ" ก็ต่อเมื่อมีรูปถูกเลือกไว้เท่านั้น
              if (_selectedImage != null)
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: const Text('ลบรูปภาพ', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    Navigator.pop(context); // ปิดเมนู
                    _removeImage(); // สั่งลบรูป
                  },
                ),
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // เปลี่ยนจาก _pickImage เป็น _showOptions แทน
      onTap: _showOptions, 
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: widget.isCircle ? null : BorderRadius.circular(15),
          color: Colors.grey[300],
          image: _selectedImage != null
              ? DecorationImage(
                  image: FileImage(_selectedImage!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: _selectedImage == null
            ? Icon(
                Icons.camera_alt,
                size: widget.width * 0.3, 
                color: Colors.grey[600],
              )
            : null,
      ),
    );
  }
}