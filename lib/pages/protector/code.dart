import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holocare/config/custom_exception.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/pages/widget/alert.dart';
import 'package:holocare/pages/widget/layout.dart';
import 'package:holocare/pages/widget/layout_top_widget.dart';
import 'package:holocare/pages/widget/outlined_button.dart';
import 'package:holocare/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProtectorCodeScreen extends StatefulWidget {
  const ProtectorCodeScreen({super.key});

  @override
  State<ProtectorCodeScreen> createState() => _ProtectorCodeScreenState();
}

class _ProtectorCodeScreenState extends State<ProtectorCodeScreen> {
  String? code;
  final _focusNode = FocusNode();
  final _textEditController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _textEditController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    print("focusChange");
    if (_focusNode.hasFocus) {
      setState(() {
        code = null;
        _textEditController.clear();
      });

      print("focus");
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    return LayoutWidget(
      appBar: _appBar(context),
      top: _topWidget(),
      middle: _middleWidget(provider, context),
      bottom: _bottomWidget(provider, context),
    );
  }

  AppBar _appBar(context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  Widget _topWidget() {
    return const LayoutTopWidget(
      top1: "코드를 입력해주세요",
      top2: "보호 대상자에게서 공유 받은 코드를 입력해주세요",
    );
  }

  Widget _middleWidget(provider, context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Offstage(
          offstage: true,
          child: TextField(
            focusNode: _focusNode,
            controller: _textEditController,
            keyboardType: TextInputType.number,
            maxLength: 6,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: const InputDecoration(),
            onChanged: (value) {
              _onInputText();
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GestureDetector(
            onTap: () {
              _focusNode.requestFocus();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < 6; i++)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: ColorStyles.gray_05,
                      border: _focusNode.hasFocus &&
                              ((code == null && i == 0) ||
                                  (code != null && code!.length == i))
                          ? Border.all(
                              color: ColorStyles.primary,
                              width: 1,
                            )
                          : null,
                    ),
                    child: Text(
                      code != null && code!.length > i
                          ? code!.split('')[i]
                          : "0",
                      style: TextStyles.body1Strong.copyWith(
                          color: code != null && code!.length > i
                              ? ColorStyles.gray_02
                              : ColorStyles.gray_04),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomWidget(provider, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomOutLinedButton(
          onPressed: () {
            _connectCode(provider, context);
          },
          text: "연결하기",
        )
      ],
    );
  }

  void _onInputText() {
    setState(() {
      code = _textEditController.text;
      if (_textEditController.text.length == 6) {
        _focusNode.unfocus();
      }
    });
  }

  void _connectCode(UserProvider provider, context) async {
    try {
      await provider.connectCode(_textEditController.text);
      _showDialog(context, "연결에 성공하였습니다", "보호자와 정상적으로 연결되었습니다.", () {
        // Navigator.pushNamedAndRemoveUntil(
        //     context, '/protector/home', (route) => false);
      });
    } on CustomException catch (e) {
      _showDialog(context, "연결에 실패하였습니다", e.toString(), null);
    }
  }

  void _showDialog(context, title, content, onPressed) {
    showDialog(
        context: context,
        builder: (ctx) {
          return CustomAlert(
            title: title,
            content: content,
            onPressed: onPressed,
          );
        });
  }
}
