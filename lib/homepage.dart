import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onlineread/coment%20twmplate.dart';

class Homwpage extends StatefulWidget {
  const Homwpage({super.key});

  @override
  State<Homwpage> createState() => _HomwpageState();
}
  Stream docsnap = FirebaseFirestore.instance.collection("post").snapshots();
  bool islike = false;

class _HomwpageState extends State<Homwpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            header(),

            StreamBuilder(stream:docsnap, builder:(context, snapshot) {
              if(snapshot.hasError){
                print("something wrong");
              }
               if(snapshot.connectionState==ConnectionState.waiting){
                Text("loding..");
              }

               List<DocumentSnapshot> alldoc = snapshot.data!.docs;

               print(snapshot.data);


               return    Expanded(
             child: ListView.builder(itemCount:10,shrinkWrap:true,itemBuilder: (context, index) {

               var docMap =
                            alldoc[index].data() as Map<String, dynamic>;
                            

                            var contant = (docMap['contant']);

                            print(contant);

                        
               return    Card(
                child: Container(
                 child: Column(
                  children: [
                    profile(),
                    Container(
                      child: Image.network("https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
                    ),
                
                    const Text("অ্যান্ড্রয়েডে Volume Button নষ্ট হলে কীভাবে ভলিউম কন্ট্রোল করবেন? শিখে নিন উপায়!", style:TextStyle(fontSize:20),),
                
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text("আমরা যে অ্যান্ড্রয়েড ফোনটি ব্যবহার করছি, এটির ভলিউম বাটন যদি হঠাৎ করে কাজ করা বন্ধ করে দেয়, তখন আপনি কী করবেন?"),
                     ),
                
                    const Divider(),
             
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                       
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color.fromARGB(255, 213, 212, 212)
                              ),
                              child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(onPressed: () {
                                    setState(() {
                                      islike=!islike;
                                    });
                                  }, icon:islike? const Icon(Icons.thumb_up_alt_outlined):const Icon(Icons.thumb_up,color: Colors.blue,)),
                                  const Text("1k")
                                ],
                              ),
                            ),
                          ),
                           Expanded(
                             child: Container(
                               decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color.fromARGB(255, 218, 218, 218)
                              ),
                                width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(onPressed: () {
                                    setState(() {
                                      islike=!islike;
                                    });
                                  }, icon:const Icon(Icons.comment)),
                                  const Text("100")
                                ],
                              ),
                                                   ),
                           )
                        ],
                      ),
                    ),

                    
                    
                  ],
                 ),
                ),
              );
             },),
           );
            },),
        
        Expanded(
          child: ListView.builder(itemCount:10,itemBuilder: (context, index) {
            return Template(massege: "sakib");
          },),
        )
     

       
          ],
        ),
      ),
    );
  }
}

class header extends StatelessWidget {
  const header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text("Online Read",style:TextStyle(fontSize:30,fontWeight:FontWeight.w500),),
          TextField(decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide.none
            ),
            isDense:true,
            contentPadding: const EdgeInsets.all(10),
            filled: true,
            
            suffix:IconButton(onPressed: () {
              
            }, icon:const Icon(Icons.search))
          ),)
        ],
      ),
    
      
    );
  }
}

class profile extends StatelessWidget {
  const profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius:24,
            backgroundImage:NetworkImage("https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("tahsin sakib",style:TextStyle(fontSize:20,fontWeight:FontWeight.w500),),
                Text("30 ago")
              ],
            ),
          ),
        ],
      ),
    );
  }
}