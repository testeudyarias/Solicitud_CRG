
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CamaraView extends StatefulWidget {
  const CamaraView({Key? key}) : super(key: key);

  @override
  State<CamaraView> createState() => _CamaraViewState();
}

class _CamaraViewState extends State<CamaraView> {

  File? imagen;
  final picker = ImagePicker();
  Future selImagen(op) async{
    var pickedFile;
    if(op==1){
      pickedFile = await  picker.getImage(source: ImageSource.camera);
    }else
    {

      pickedFile = await  picker.getImage(source: ImageSource.gallery);
    }
    setState(() {
      if(pickedFile != null){
        imagen = File(pickedFile.path);
      }else
      {
        print("No selectionado");
      }
    });

    Navigator.of(context).pop();
  }

  opciones(context){
    showDialog(context: context, builder: ( BuildContext context ){
      return AlertDialog( contentPadding: EdgeInsets.all(0),
        content: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(onTap: (){selImagen(1);},
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
                  ),
                  child: Row(
                    children: [
                      Expanded(child:
                      Text("Tomar una foto", style: TextStyle(
                          fontSize: 16
                      ),)
                      ),
                      Icon(Icons.camera_alt, color: Colors.blue,)
                    ],
                  ),
                ),
              ),
              InkWell(onTap: (){selImagen(2);},
                child: Container(
                  padding: EdgeInsets.all(20),

                  child: Row(
                    children: [
                      Expanded(child:
                      Text("Seleccionar una foto", style: TextStyle(
                          fontSize: 16
                      ),)
                      ),
                      Icon(Icons.image, color: Colors.blue,)
                    ],
                  ),
                ),
              ),
              InkWell(onTap: (){ Navigator.of(context).pop();},
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.red
                  ),
                  child: Row(
                    children: [
                      Expanded(child:
                      Text("Cancelar", style: TextStyle(
                          fontSize: 16,
                          color: Colors.white
                      ), textAlign: TextAlign.center,)
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(title: Text("Selecciona una imagen"),),
        body: ListView(
          children: [
            Padding(padding: EdgeInsets.all(20)
              ,child: Column(
                children: [
                  ElevatedButton(onPressed: (){opciones(context);}, child: Text("Seleccionar una imagen")),
                  SizedBox(height: 30,),
                  imagen==null? Center():Image.file(imagen!)
                ],
              ),
            ),

          ],),
      )
    ;
  }
}

