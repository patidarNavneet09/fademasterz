import 'dart:convert' as convert;
import 'dart:io';

import 'package:fademasterz/Dashboard/dashboard.dart';
import 'package:fademasterz/Utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class WebViewPage extends StatefulWidget {
  final String? url;
  const WebViewPage({super.key, this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewXController webViewController;
  var urls;
  var initialContent = "";

  String jsondata = "";
  String message = "";
  String status = "";

  @override
  void initState() {
    super.initState();
    urls = widget.url;
    initialContent = urls;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.bg,
      // appBar: MyAppBar.myAppbar(
      //   centerTile: true,
      //   title: Text(
      //     AppStrings.paymentDirection,
      //     style: AppFonts.appText,
      //   ),
      //   leading: IconButton(
      //     icon: SvgPicture.asset(
      //       AppIcon.backIcon,
      //       height: 12,
      //       width: 15,
      //       //     color: Theme.of(context).appBarTheme.foregroundColor,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //       setState(() {});
      //     },
      //   ),
      // ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.2),
          ),
          child: _buildWebViewX(),
        ),
      ),
    );
  }

  Size get screenSize => MediaQuery.of(context).size;
  Widget _buildWebViewX() {
    return WebViewX(
      key: const ValueKey('webviewx'),
      initialContent: initialContent,
      initialSourceType: SourceType.url,
      // height: screenSize.height / 2,
      // width: min(screenSize.width * 0.8, 1024),
      height: screenSize.height,
      width: screenSize.width,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) => webViewController = controller,
      onPageStarted: (src) {
        debugPrint('A new page has started loading: $src\n');
        if (src.toString() ==
            "https://sandbox.web.squarecdn.com/v1/square.js") {}
      },
      onPageFinished: (src) {
        debugPrint('The page has finished loading: $src\n');
        // readJS();
      },
      jsContent: const {
        EmbeddedJsContent(
          js: "function testPlatformIndependentMethod() { console.log('Hi from JS') }",
        ),
        EmbeddedJsContent(
          webJs:
              "function testPlatformSpecificMethod(msg) { TestDartCallback('Web callback says: ' + msg) }",
          mobileJs:
              "function testPlatformSpecificMethod(msg) { TestDartCallback.postMessage('Mobile callback says: ' + msg) }",
        ),
      },
      dartCallBacks: {
        DartCallback(
          name: 'TestDartCallback',
          callBack: (msg) => Helper().showToast(
            msg.toString(),
          ),
        )
      },
      webSpecificParams: const WebSpecificParams(
        printDebugInfo: true,
      ),
      mobileSpecificParams: const MobileSpecificParams(
        androidEnableHybridComposition: true,
      ),
      navigationDelegate: (navigation) {
        debugPrint(navigation.content.sourceType.toString());
        debugPrint(
            "-------content.sourceType------->${navigation.content.sourceType.toString()}");
        debugPrint("-------content.source------->${navigation.content.source}");
        return NavigationDecision.navigate;
      },
    );
  }

  urlload() {
    return _setUrl();
  }

  void _setUrl() {
    webViewController.loadContent(
      SourceType.url.toString(),
    );
  }

  void readJS() async {
    String html = await webViewController.evalRawJavascript(
        "window.document.getElementsByTagName('body')[0].innerHTML;");
    print("html......${html}");
    print(
        "htmldata.. ${html.substring(1, html.toString().length - 1).replaceAll("\\", "")}");
    jsondata =
        "${html.substring(1, html.toString().length - 1).replaceAll("\\", "")}";
    print("object?????????????????????  ${jsondata}");

    settingsFromJson(jsondata);
    print("map...${jsondata}");
    print("{" + jsondata + "}");
    parse(html);
    print("data ${jsondata.toString()}");
  }

  Future<WebViewModel> settingsFromJson(String str) async {
    print("fnjgjkh${"{" + jsondata + "}"}");
    var jsonData;
    if (Platform.isAndroid) {
      jsonData = convert.jsonDecode(str);
    } else {
      jsonData = convert.jsonDecode("{" + str + "}");
    }
    // var jsonData = convert.jsonDecode("{"+str+"}");
    print("jsondata ${jsonData['status']}");
    if (jsonData['status'] == true) {
      Helper().showToast(jsonData['message']);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashBoardScreen(
            selectIndex: 0,
          ),
        ),
      );
    } else {
      if (jsonData['message'] == "Payment failed done") {
        Helper().showToast(jsonData['message']);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewPage(),
            ),
            (route) => false);
      } else if (jsonData['message'] == "Payment failed") {
        Helper().showToast(jsonData['message']);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewPage(),
            ),
            (route) => false);
      } else {
        Helper().showToast(jsonData['message']);
      }
    }

    return WebViewModel.fromJson(jsonData);
  }
}

class WebViewModel {
  bool? status;
  String? message;

  WebViewModel({this.status, this.message});

  WebViewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;

    return data;
  }
}
