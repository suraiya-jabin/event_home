import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DioPrac extends StatefulWidget {
  const DioPrac({Key? key}) : super(key: key);

  @override
  State<DioPrac> createState() => _DioPracState();
}

class _DioPracState extends State<DioPrac> {
  late bool downloading;
  late String progressString;
  late File? imageFile;

  @override
  void initState() {
    super.initState();
    downloading = false;
    progressString = "";
    downloadFile();
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();

      await dio.download(imgUrl, "${dir.path}/myimage.jpg",
          onReceiveProgress: (rec, total) {
        print("Rec: $rec , Total: $total");

        setState(() {
          downloading = true;
          progressString = "${((rec / total) * 100).toStringAsFixed(0)}%";
        });
      });

      setState(() {
        imageFile = File("${dir.path}/myimage.jpg");
      });
    } catch (error) {
      print(error);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Downloading"),
      ),
      body: Center(
        child: downloading
            ? SizedBox(
                height: 120.0,
                width: 200.0,
                child: Card(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const CircularProgressIndicator(),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Downloading File: $progressString",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : imageFile != null
                ? Image.file(
                    imageFile!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  )
                : const SizedBox(),
      ),
    );
  }
}

const imgUrl = "https://unsplash.com/photos/ycrECoi3obE/download?force=true";
