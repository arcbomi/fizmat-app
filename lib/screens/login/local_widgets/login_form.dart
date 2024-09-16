import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//通过谷歌登录账户 暂时未实现
class FizLoginButton extends StatefulWidget {
  final VoidCallback? onPressed;
  const FizLoginButton({super.key, this.onPressed});
   
  
  @override
  State<FizLoginButton> createState() => _FizLoginButtonState();
}

class _FizLoginButtonState extends State<FizLoginButton> {
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton.icon(
      icon: const Icon(
        Icons.login,
      ),
      label: const Text(
        'Sign in with Google',
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1d2031),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
           onPressed: widget.onPressed,
    );
  }
}

//是否同意用户协议
class FizAgreeTerms extends StatefulWidget {
  final String text;
  final String termsUrl;
  final bool initAgree;

  const FizAgreeTerms({Key? key, required this.text, required this.termsUrl, required this.initAgree}) : super(key: key);

  @override
  State<FizAgreeTerms> createState() => _FizAgreeTermsState();
}

class _FizAgreeTermsState extends State<FizAgreeTerms> {
  late bool _agreedToTerms;
  late Uri _url;

  @override
  void initState() { //我也不知道为什么
    super.initState();
    _agreedToTerms = widget.initAgree;
    _url = Uri.parse(widget.termsUrl);
  }

  void _toggleAgreement(bool? value) {
    setState(() {
      _agreedToTerms = value ?? false;
    });
  }

  Future<void> _launchUrl()async{
    if(await canLaunchUrl(_url))
    {
      await launchUrl(_url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: _agreedToTerms,
          onChanged: _toggleAgreement,
        ),
        Flexible(
          child: GestureDetector(
            onDoubleTap: () => _launchUrl(),
            child: Text(widget.text),
          ),
        ),
      ],
    );
  }
}



//登录为访客
class FizGuestLogin extends StatelessWidget {
  final String text;
  final String routeName;

  const FizGuestLogin({Key? key, required this.text, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey, // 设置文本颜色为灰色
        ),
      ),
    );
  }
}

