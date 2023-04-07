import 'dart:io';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

import '../../data/models/book.dart';

class ReadBookPage extends StatefulWidget {
  const ReadBookPage({Key? key}) : super(key: key);

  @override
  State<ReadBookPage> createState() => _ReadBookPageState();
}

class _ReadBookPageState extends State<ReadBookPage> {
  bool loading = false;
  Dio dio = Dio();
  String filePath = "";
  Book? book;
  String href = '';
  String bookId = '';
  String cfi = '';
  int created = 0;
  var mainLocator;

  @override
  void initState() {
    download();
    super.initState();
  }

  download() async {
    if (Platform.isAndroid || Platform.isIOS) {
      // String? firstPart;
       //final deviceInfoPlugin = DeviceInfoPlugin();
      // final deviceInfo = await deviceInfoPlugin.deviceInfo;
      // final allInfo = deviceInfo.data;
      // if (allInfo['version']["release"].toString().contains(".")) {
      //   int indexOfFirstDot = allInfo['version']["release"].indexOf(".");
      //   firstPart = allInfo['version']["release"].substring(0, indexOfFirstDot);
      // } else {
      //   firstPart = allInfo['version']["release"];
      // }
      // int intValue = int.parse(firstPart!);
      // if (intValue >= 13) {
      //   await startDownload();
      // } else {
      //   if (await Permission.storage.isGranted) {
      //     await Permission.storage.request();
      //     await startDownload();
      //   } else {
      //     await startDownload();
      //   }
      // }
      await startDownload();
    } else {
      loading = false;
    }
  }

  startDownload() async {
    Directory? appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    String path = '${appDocDir!.path}/${book!.file!.split('/').last}.epub';
    File file = File(path);

    if (!File(path).existsSync()) {
      await file.create();
      await dio.download(
        book!.file!,
        path,
        deleteOnError: true,
        onReceiveProgress: (receivedBytes, totalBytes) {
          setState(() {
            loading = true;
          });
        },
      ).whenComplete(() {
        setState(() {
          loading = false;
          filePath = path;
        });
      });
    } else {
      setState(() {
        loading = false;
        filePath = path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    book = ModalRoute.of(context)!.settings.arguments as Book?;
    VocsyEpub.setConfig(
      themeColor: Theme.of(context).primaryColor,
      identifier: "iosBook",
      scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
      allowSharing: true,
      enableTts: true,
      nightMode: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('${book?.title}'),
      ),
      body: Center(
        child: loading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text('Загрузка книги...'),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      print("=====filePath======$filePath");
                      if (filePath == "") {
                        download();
                      } else {
                        VocsyEpub.setConfig(
                          themeColor: Theme.of(context).primaryColor,
                          identifier: "iosBook",
                          scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                          allowSharing: true,
                          enableTts: true,
                          nightMode: true,
                        );

                        // get current locator
                        VocsyEpub.locatorStream.listen((locator) {
                          print('LOCATOR: $locator');
                          // bookId = locator['bookId'];
                          // href = locator['href'];
                          // created = locator['created'];
                          mainLocator = locator;
                          print('LOCATOR2: $mainLocator');
                        });

                        VocsyEpub.open(
                          filePath,
                          lastLocation: mainLocator,
                        );


                      }
                    },
                    child: const Text('Открыть эл. книгу'),
                  ),
                ],
              ),
      ),
    );
  }
}
