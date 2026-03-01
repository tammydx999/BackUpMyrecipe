import 'package:flutter/material.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My recipe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF96F2A4)
        ),
        useMaterial3: true,
      ),
      home: Forgetpassword(),
    );
  }
}

class Forgetpassword extends StatelessWidget{


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
                builder: (context) => LoginScreen(),
              ),
            );
          },
        ),
        title: Text(
          'ลืมรหัสผ่าน',
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
            SizedBox(height: 20),
            _buildInputField('อีเมล', 'กรอกอีเมลเพื่อรีเซ็ตรหัสผ่าน'),
            SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA1E8AF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 80,vertical: 15),
                ),
                child: Text(
                  'ส่ง',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              )
            )
          ],
        ),
      )// Light green background
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     padding: const EdgeInsets.all(40.0),
      //     child: Column(
      //       children: [
      //         //Logo section
      //         Column(
      //           children: [
      //             Container(
      //               child: Image.asset("assets/logo.png",fit: BoxFit.contain,),
      //             )
      //           ]
      //         )
      //       ],
      //     ),
      //   ),)
    );
  }
  
  Widget _buildInputField(String label, String hintText,{bool isPassword = false}){
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
            child:  TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey[400]),
                contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      )
    );
  }
}