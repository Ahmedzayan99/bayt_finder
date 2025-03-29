import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


class CustomHtmlWidget extends StatelessWidget {
  final String? postContent;
  final int? size;

  const CustomHtmlWidget({super.key, this.postContent,this.size});

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      postContent!,
      onTapImage: (ImageMetadata imageMetadata) {
      //  openPhotoViewer(context, Image.network(imageMetadata!.sources!.).image);
      },
   /*   onTapUrl: (url){
        *//*  if (url.split('/').last.contains('.pdf')) {
  PdfViewWidget(pdfUrl: url).launch(context);
  } else {
  launchUrls(url, forceWebView: false);
  }*//*
      } ,*/
      customStylesBuilder:(element)  {
        return null;
      },
      renderMode:RenderMode.column ,
    );
  }
}
