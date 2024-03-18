import 'package:flutter/material.dart';
import 'package:kuis_mobile/disease_data.dart';
import 'package:kuis_mobile/plant.dart';
import 'package:url_launcher/url_launcher.dart';
class Detail extends StatelessWidget {
  const Detail({super.key, required this.penyakit});
  final Diseases penyakit;
  final bool klikfavorit=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Diseases", style: TextStyle(color: Colors.white), ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {
            bool klikfavorit = true;
            SnackBar snackBar = SnackBar(content: Text("Berhasil Menambahkan ke Favorit"), backgroundColor: (klikfavorit) ? Colors.green : Colors.red,);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }, icon: Icon(Icons.favorite)),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Gagal menambahkan ke Favorit"),
                  backgroundColor: Colors.red,
                ),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
        ]
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(width: 50,),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.2,
              child: Image.network(penyakit.imgUrls),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(penyakit.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
                SizedBox(height: 10,),
                Text("Disease Name", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(penyakit.name),
                SizedBox(height: 10,),
                Text("Plant Name", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(penyakit.plantName),
                SizedBox(height: 10,),
                Text("Ciri-ciri", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(penyakit.nutshell[0]),
                SizedBox(height: 10,),
                Text("Disease ID", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(penyakit.id),
                SizedBox(height: 10,),
                Text("Sympton", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(penyakit.symptom),
                FloatingActionButton(onPressed: () {
                  launchURL(penyakit.imgUrls);
                }, child: Icon(Icons.chrome_reader_mode),)
              ],
            ),

          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (value) {
      //     launchURL(penyakit.imgUrls)
      //   },
      // ),
    );
  }
}

Future <void> launchURL(String url) async{
  final Uri _url = Uri.parse(url);
  if(!await launchUrl(_url)){
    throw "Couldn't launch url";
  }
}