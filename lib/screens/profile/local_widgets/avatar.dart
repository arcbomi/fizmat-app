import 'package:fizmat_app/models/theme.dart';
import 'package:flutter/material.dart';

//说真的我都忘了我写了些什么，主要是显示图片
class FizAvatar extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const FizAvatar({
    Key? key,
    required this.imagePath,
     required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          _buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: _avatarCircle(FizTheme().getDarkCharcoal,FizTheme().getVibrantGreen,11,5),
          ),
        ],
      );
  }

  Widget _buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget _avatarCircle(Color outColor,Color inColor,double outAll,double inAll) => _buildCircle(
        color: outColor,
        all: inAll,
        child: _buildCircle(
          color: inColor,
          all: outAll,
        ),
      );

  Widget _buildCircle({
    Widget? child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}




