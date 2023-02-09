import 'dart:ui' as ui;

import 'package:e_shop/constants.dart';
import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(size.width*-0.1526548,size.height*0.5731233);
    path_0.cubicTo(size.width*-0.1526548,size.height*0.5731233,size.width*0.008240000,size.height*0.4997822,size.width*0.1835430,size.height*0.5764567);
    path_0.cubicTo(size.width*0.1835556,size.height*0.5764622,size.width*0.1835681,size.height*0.5764678,size.width*0.1835807,size.height*0.5764733);
    path_0.cubicTo(size.width*0.2715185,size.height*0.6149300,size.width*0.3640452,size.height*0.6355311,size.width*0.4553126,size.height*0.6163478);
    path_0.cubicTo(size.width*0.5563622,size.height*0.5951089,size.width*0.6470719,size.height*0.5438833,size.width*0.7499059,size.height*0.5770878);
    path_0.cubicTo(size.width*0.8298667,size.height*0.6029067,size.width*0.8957696,size.height*0.6701011,size.width*0.9806378,size.height*0.6365311);
    path_0.cubicTo(size.width*1.071672,size.height*0.6005211,size.width*1.150264,size.height*0.5435489,size.width*1.246699,size.height*0.5515778);
    path_0.cubicTo(size.width*1.329116,size.height*0.5584400,size.width*1.394138,size.height*0.6083011,size.width*1.475502,size.height*0.5631211);
    path_0.lineTo(size.width*1.475502,size.height*-0.04360556);
    path_0.lineTo(size.width*-0.1535496,size.height*-0.04360556);
    path_0.lineTo(size.width*-0.1526548,size.height*0.5731233);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.shader = ui.Gradient.linear(Offset(size.width*-15.35493,size.height*0.3010624), Offset(size.width*1.475502,size.height*0.3010624), [primaryColor.withOpacity(1.0),primaryColor.withOpacity(0)], [0,1]);
canvas.drawPath(path_0,paint_0_fill);

Path path_1 = Path();
    path_1.moveTo(size.width*-0.2259956,size.height*0.5464533);
    path_1.cubicTo(size.width*-0.2259956,size.height*0.5464533,size.width*-0.06510074,size.height*0.4731122,size.width*0.1102022,size.height*0.5497867);
    path_1.cubicTo(size.width*0.1102148,size.height*0.5497922,size.width*0.1102274,size.height*0.5497978,size.width*0.1102400,size.height*0.5498033);
    path_1.cubicTo(size.width*0.1981778,size.height*0.5882600,size.width*0.2907044,size.height*0.6088611,size.width*0.3819719,size.height*0.5896778);
    path_1.cubicTo(size.width*0.4830215,size.height*0.5684389,size.width*0.5737311,size.height*0.5172133,size.width*0.6765652,size.height*0.5504178);
    path_1.cubicTo(size.width*0.7565252,size.height*0.5762367,size.width*0.8224289,size.height*0.6434311,size.width*0.9072970,size.height*0.6098611);
    path_1.cubicTo(size.width*0.9983311,size.height*0.5738511,size.width*1.076924,size.height*0.5168789,size.width*1.173359,size.height*0.5249078);
    path_1.cubicTo(size.width*1.255775,size.height*0.5317700,size.width*1.320796,size.height*0.5816311,size.width*1.402161,size.height*0.5364511);
    path_1.lineTo(size.width*1.402161,size.height*-0.07027444);
    path_1.lineTo(size.width*-0.2268904,size.height*-0.07027444);
    path_1.lineTo(size.width*-0.2259956,size.height*0.5464533);
    path_1.close();

Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
paint_1_fill.shader = ui.Gradient.linear(Offset(size.width*-22.68900,size.height*0.2743931), Offset(size.width*1.402162,size.height*0.2743931), [primaryColor.withOpacity(1.0),primaryColor.withOpacity(0)], [0,1]);
canvas.drawPath(path_1,paint_1_fill);

Path path_2 = Path();
    path_2.moveTo(size.width*-0.07931407,size.height*0.5180333);
    path_2.cubicTo(size.width*-0.07931407,size.height*0.5180333,size.width*0.08158074,size.height*0.4496578,size.width*0.2568837,size.height*0.5211411);
    path_2.cubicTo(size.width*0.2568963,size.height*0.5211467,size.width*0.2569089,size.height*0.5211511,size.width*0.2569215,size.height*0.5211567);
    path_2.cubicTo(size.width*0.3448593,size.height*0.5570100,size.width*0.4373859,size.height*0.5762156,size.width*0.5286533,size.height*0.5583322);
    path_2.cubicTo(size.width*0.6297030,size.height*0.5385311,size.width*0.7204126,size.height*0.4907733,size.width*0.8232467,size.height*0.5217311);
    path_2.cubicTo(size.width*0.9032074,size.height*0.5458022,size.width*0.9691104,size.height*0.6084478,size.width*1.053979,size.height*0.5771489);
    path_2.cubicTo(size.width*1.145013,size.height*0.5435767,size.width*1.223605,size.height*0.4904622,size.width*1.320040,size.height*0.4979478);
    path_2.cubicTo(size.width*1.402456,size.height*0.5043456,size.width*1.467479,size.height*0.5508300,size.width*1.548843,size.height*0.5087100);
    path_2.lineTo(size.width*1.548843,size.height*-0.05694000);
    path_2.lineTo(size.width*-0.07655185,size.height*-0.05684222);
    path_2.lineTo(size.width*-0.07931407,size.height*0.5180333);
    path_2.close();

Paint paint_2_fill = Paint()..style=PaintingStyle.fill;
paint_2_fill.shader = ui.Gradient.linear(Offset(size.width*-7.931385,size.height*0.2643921), Offset(size.width*1.548843,size.height*0.2643921), [primaryColor.withOpacity(1.0),primaryColor.withOpacity(0)], [0,1]);
canvas.drawPath(path_2,paint_2_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}