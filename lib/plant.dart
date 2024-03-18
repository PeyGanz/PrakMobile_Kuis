import 'package:flutter/material.dart';
import 'package:kuis_mobile/detailplant.dart';
import 'package:kuis_mobile/disease_data.dart';

class Plant extends StatelessWidget {
  const Plant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plant Diseases", style: TextStyle(color: Colors.white), ),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            final Diseases penyakit= listDisease[index];
            return InkWell(
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Detail(penyakit: penyakit);
                  }));
              },
              child: Card(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      height: MediaQuery.of(context).size.height * 0.18,
                      child: Image.network(penyakit.imgUrls),
                    ),
                    Text(penyakit.name, style: TextStyle(fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),
                  ],
                ),
              ),
            );
          },
          itemCount: listDisease.length,
        ),
    );
  }
}
