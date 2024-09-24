import 'package:flutter/material.dart';
import 'package:pad_mes/common/global.dart';
import 'package:pad_mes/common/request.dart';
import 'package:pad_mes/states/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final String imgSrc = 'images/loginBg.png'; // 你的背景图片路径
  final String topLogoSrc = 'images/topLogo.png';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      // 内容不会随键盘弹出而滚动。
      resizeToAvoidBottomInset: false,
      body: Stack( // 使用 Stack 包裹 Container 和 Positioned
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgSrc),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 50, // 距离右边的距离
            bottom: 150, // 距离底部的距离
            child: Container(
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: [
                  Image(image: AssetImage(topLogoSrc), fit: BoxFit.cover,),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      clickLogin(context, userProvider);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      minimumSize: const Size(200, 50)
                      // 按钮颜色设置为蓝色
                    ),
                    child: const Text(
                      '登录系统',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  )
                ],

              ),
            )
          ),
        ],
      ),
    );
  }

  void clickLogin(BuildContext context, UserProvider userProvider) async {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('点击了登录按钮')),
    );
    String? ip = await getIpAddress();
    if (ip != null  && context.mounted) {
      String pageName = await userProvider.getWorkerInfo(ip);

      pageName = '';

      if(pageName == null || pageName.isEmpty) {
        String defaultPageName = await userProvider.getLocalPageName();
        pageName = defaultPageName;
      }
      Navigator.pushNamed(context, '/$pageName');
    }
  }
}
