import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;

class IframeView extends StatefulWidget {
  final String source;

  const IframeView({Key? key, required this.source}) : super(key: key);

  @override
  IframeViewState createState() => IframeViewState();
}

class IframeViewState extends State<IframeView> {
  // Widget _iframeWidget;
  final IFrameElement _iframeElement = IFrameElement();

  @override
  void initState() {
    super.initState();
    _iframeElement.src = widget.source;
    _iframeElement.style.border = 'none';

    //ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      key: UniqueKey(),
      viewType: 'iframeElement',
    );
  }
}
