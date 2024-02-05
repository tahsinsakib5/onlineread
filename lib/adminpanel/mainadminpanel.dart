// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class adminpanel extends StatefulWidget {
  const adminpanel({super.key});

  @override
  State<adminpanel> createState() => _adminpanelState();
}

 File? imagefile;

class _adminpanelState extends State<adminpanel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
          
          
              TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText:"write in here"
                ),
              ),
           
           Stack(
             children: [
               
               Container(
                height: 200,
              
                         
                decoration: BoxDecoration(
                  image:imagefile!=null?DecorationImage(image: FileImage(imagefile!,),fit:BoxFit.cover):null,
                  border:Border.all(),
                ),
                child: imagefile == null ? Center(child:Row(
                  children: [
                    Icon(Icons.photo_library,color: Colors.green,),
                    TextButton(onPressed: ()async{
                      imagefile = await pickImage();
                  setState(() {
                    
                  });
                    }, child:Text("photo file"))
                  ],
                )) : null,
               ),
                if(imagefile!=null)
               Positioned(
               
                 child: IconButton(onPressed: () {
                   setState(() {
                     imagefile=null;
                   });
                 }, icon:Icon(Icons.close)),
               )
             ],
           ),
          
              Center(
                child: ElevatedButton(onPressed: ()async{
                 

                  
                var imagelink = await    getImageLisnk(imagefile!);

                post(imagelink);
                  
                  
                }, child:Text("post")),
              )
            ],
          ),
        ),
      ),
    );
  }

   Future pickImage ()async{
    final picimage =  await ImagePicker().pickImage(source:ImageSource.gallery);

    if(picimage!=null){
      return File(picimage.path);
    }else{
      return null;
    }
   }


    Future getImageLisnk(File image )async{
      final filename =basename(image.path);
      final destination = "banner/$filename";
      final referance = FirebaseStorage.instance.ref(destination);

    UploadTask task =   referance.putFile(image);


    if(task==null){
      return null;

    }else{
      final snapshort = await task.whenComplete((){});

      final imageurl = await snapshort.ref.getDownloadURL();

      return imageurl;
    }

      
    }



    Future post (String url)async{
  // File? image = await pickImage();
  //  if(image!=null){
  //   String? imageUrl = await getImageLink(image);
  //  }
  
var colaction = await FirebaseFirestore.instance.collection("post");


 Map <String,dynamic> post_map ={
 "head_line":"sakib",
 "contant":"sakib2",
 "imageurl":"sa",
 "like":12,
  "coment":[]
 };

 colaction.add(post_map);
 }


}

