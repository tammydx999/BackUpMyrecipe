



import 'package:myrecipe/widget/image_picker_widget.dart';

import 'screen/screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My recipe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF96F2A4)),
        useMaterial3: true,
      ),
        home: const  ProfielBuild(),
      );
    }
  }
  
class ProfielBuild extends StatelessWidget {
  const ProfielBuild({super.key});

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      backgroundColor: const Color(0xFFF0FEE3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: Colors.black,
            size: 20,
          ),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Register(),
              ),
            );
          },
        ),
        title: Text(
          'สร้างโปรไฟล์',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
      ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: RecipeImagePicker(
                    width: 120,
                    height: 120,
                    isCircle: true,
                    onImageSelected: (image) {
                      // คุณสามารถทำอะไรกับภาพที่เลือกได้ที่นี่
                      print('Selected image path: ${image?.path}');
                    },
                  ),
                ),
                SizedBox(height: 20),
                _buildInputField('ชื่อผู้ใช้', 'กรอกชื่อผู้ใช้'),
                _buildInputField('bio', 'มาแนะนำตัวให้เพื่อนๆ รู้จักกันเถอะ'),

                SizedBox(height: 50),
                Center(
                  child: ElevatedButton(
                    onPressed: (){

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFA1E8AF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text(
                      'ต่อไป',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
          ),
        ),
      );
    }
  }

  Widget _buildInputField(String label, String hintText, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: TextField(
              obscureText: isPassword,
              maxLines: label == 'bio' ? 4 : 1,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey[400]),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  