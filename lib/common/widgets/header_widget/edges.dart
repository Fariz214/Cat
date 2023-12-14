import 'package:flutter/material.dart';


class CustomEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size)  {
    var path = Path();
    path.lineTo(0, size.height);

    final firstpoint = Offset(0, size.height - 20);
    final lastpoint = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstpoint.dx, firstpoint.dy, lastpoint.dx, lastpoint.dy);

    final secondfirstpoint = Offset(0, size.height - 20);
    final secondlastpoint = Offset(size.width -30, size.height - 20);
    path.quadraticBezierTo(secondfirstpoint.dx, secondfirstpoint.dy, secondlastpoint.dx, secondlastpoint.dy);
    
    final thirdfirstpoint = Offset(size.width, size.height - 20);
    final thirdlastpoint = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdfirstpoint.dx, thirdfirstpoint.dy, thirdlastpoint.dx, thirdlastpoint.dy);
    
    
    
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
    return true;
  }
}