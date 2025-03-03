import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CaptchaDialog extends StatefulWidget {
  final Uint8List image;

  const CaptchaDialog({Key? key, required this.image}) : super(key: key);

  @override
  _CaptchaDialogState createState() => _CaptchaDialogState();
}

class _CaptchaDialogState extends State<CaptchaDialog> {

  final captchaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("输入图片验证码"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 50,
                maxWidth: 100
              ),
              child: Image.memory(widget.image),
            ),// Display the captcha image
            SizedBox(height: 16),
            TextField(
              autofocus: true,
              controller: captchaController,
              decoration: InputDecoration(
                labelText: "验证码",
                hintText: "输入验证码",
                prefixIcon: Icon(Icons.code),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('取消'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog without result
          },
        ),
        TextButton(
          child: Text('提交'),
          onPressed: () {
            Navigator.of(context).pop(captchaController.text);
          },
        ),
      ],
    );
  }
}
