
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hoodedhaven/tools/myColor.dart';
import 'package:image_picker/image_picker.dart';
class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettings();
}

class _AccountSettings extends State<AccountSettings> {
  
  //File? img = File("assets/profileavatar.jpg");
  File ? img = File("assets/profileavatar.jpg");
 
  TextEditingController name = TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController bio = TextEditingController();
  String _name = "" ;
  String _email = "" ;
  String _password = "" ;
  String _bio = "" ;
  Future pickimage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
     setState(() {
       img = File(image!.path);
     });
  }
  
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: const [Icon(Icons.settings)],
        title: const Center(child: Text("Account Setting ")),),
        
      body:  Card(
        
        margin: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10
        ),
        
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
             
              children: [
                
                   
                   
                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("EDIT INFORMATION: ",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                        ),
                        Expanded(child: Divider())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            backgroundImage: FileImage(img!),
                            child: GestureDetector(
                                onTap: pickimage, child: const Icon(Icons.camera_alt)),
                          ),
                        ),
                      ],
                    ),
            
                    const SizedBox(height: 20,),
                   
                  //name 
                  TextFormField(
                    controller: name,
                    decoration: const InputDecoration(

                      labelText: 'Name',
                      hintText: 'Edit your Name',
                      
                      prefixIcon: Icon(Icons.person) ,
                      suffixIcon: Icon(Icons.edit),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      )
                    ),
                    
                    onSaved: (newValue) {
                      name = newValue! as TextEditingController ;
                    },
                  ),
                  const SizedBox(height: 10,),
                  //email
                 TextFormField(
                  controller: email,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Edit your Email',
                      prefixIcon: Icon(Icons.email) ,
                      suffixIcon: Icon(Icons.edit),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      )
                    ),
                    onSaved: (newValue) {
                      email = newValue! as TextEditingController ;
                    },
                  ),
                  const SizedBox(height: 10,),
                  //password
                   TextFormField(
                    controller: password,

                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Edit your password',
                      prefixIcon: Icon(Icons.password) ,
                      suffixIcon: Icon(Icons.edit),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      )
                    ),
                    onSaved: (newValue) {
                      password = newValue! as TextEditingController ;
                    },
                  ),
                const SizedBox(height: 30,),
                 TextFormField(
                  controller: bio,
                    decoration: const InputDecoration(
                      labelText: 'Bio',
                      hintText: 'describe your self',
                      prefixIcon: Icon(Icons.description) ,
                      suffixIcon: Icon(Icons.edit),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      )
                    ),
                    onSaved: (newValue) {
                      bio = newValue! as TextEditingController ;
                    },
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    
                      child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[100] ,
  ),
                        child: const Text("Saved",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        onPressed: (){
                          setState(() {
                            _name = name as String ;
                            _email = email as String;
                            _password = password as String ;
                            _bio = bio as String ;
                          });
                        },),
                    ),
                  
              ],),
        ),
      ),
      );
  }
}
