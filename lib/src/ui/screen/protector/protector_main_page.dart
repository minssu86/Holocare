import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holocare/src/ui/screen/protector/protector_config_page.dart';

class ProtectorMainPage extends StatefulWidget {
  const ProtectorMainPage({super.key});

  @override
  State<ProtectorMainPage> createState() => _ProtectorMainPageState();
}

class _ProtectorMainPageState extends State<ProtectorMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: 360,
        height: 800,
        child: Column(
          children: [
            const SizedBox(
              width: 320,
              height: 56,
            ),
            Container(
              alignment: Alignment.centerRight,
              width: double.infinity,
              height: 24,
              margin: EdgeInsets.only(bottom: 72),
              child: SvgPicture.asset(
                'assets/icons/config_icon.svg',
                width: 24,
                height: 24,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 28),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "안전하게\n보호하고 있어요",
                        style: TextStyle(
                          color: Color(0xFF3D3D3D),
                          fontSize: 28,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "3시간 전에 활동을 확인 했어요",
                        style: TextStyle(
                          color: Color(0xFF8B8B8B),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 49,
                    height: 33,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      color: Color(0xFFC4E9D7),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '안전',
                          style: TextStyle(
                            color: Color(0xFF1AB369),
                            fontSize: 12,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: SvgPicture.asset(
                'assets/icons/three_image.svg',
                // width: 320,
                // height: 200,
              ),
            ),
            Text("최근 접속 23.7.05 13:05")
          ],
        ),
      ),
    ));
  }
}
