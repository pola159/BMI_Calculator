import 'package:flutter/material.dart';

import 'dataInput.dart';
import 'main.dart';

class bmiPage extends StatefulWidget {
  final _bmi;
  final mORf;

  const bmiPage(this._bmi, this.mORf, {Key? key}) : super(key: key);

  @override
  State<bmiPage> createState() => _bmiPageState();
}

class _bmiPageState extends State<bmiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (con) {
                return calculatBmI(widget.mORf);
              }));
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: const Color.fromRGBO(186, 104, 200, 1),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              (widget.mORf == true)
                  ? Image.asset("images/Healthy options-rafiki.png")
                  : Image.asset("images/Healthy options-amico.png"),
              SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackShape: GradienRectSliderTrackShape(),
                  ),
                  child: Slider(
                    value: widget._bmi,
                    onChanged: (double v) {},
                    min: 10,
                    max: 50,
                    thumbColor: Color.fromRGBO(149, 83, 160, 1),
                  )),
              cont(widget._bmi),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c){
                    return MyApp();
                  }));
                },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(186, 104, 200, 1),
                    ),
                    child: Text("Try Again" ,style: TextStyle(fontSize: 20),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cont(double bmi) {
  if (bmi > 18.5 && bmi < 25) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "${bmi}",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(0, 189, 1, 1),
            ),
          ),
          Text(
            "Good news your BMI in Normal",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(0, 189, 1, 1),
            ),
          ),
        ],
      ),
    );
  } else if (bmi > 25 && bmi < 30) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "${bmi}",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(213, 213, 35, 1.0),
            ),
          ),
          Text(
            "ooh you overweight, You should organize your food in a better way",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(213, 213, 35, 1.0),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  } else if (bmi > 30 && bmi < 40) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "${bmi}",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(254, 153, 0, 1),
            ),
          ),
          Text(
            "You are obese!!\n"
            "you should start a diet",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(254, 153, 0, 1),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  } else if (bmi > 40) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "${bmi}",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(197, 89, 86, 1),
            ),
          ),
          Text(
            "You are in great danger\n you should start dieting now",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(197, 89, 86, 1),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  } else {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "${bmi} \n Error",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(197, 89, 86, 1),
            ),
          ),
          Text(
            "Enter your actual height and weight",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(197, 89, 86, 1),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class GradienRectSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  /// Create a slider track that draws two rectangles with rounded outer edges.
  const GradienRectSliderTrackShape();

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    assert(context != null);
    assert(offset != null);
    assert(parentBox != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);
    assert(enableAnimation != null);
    assert(textDirection != null);
    assert(thumbCenter != null);
    // If the slider [SliderThemeData.trackHeight] is less than or equal to 0,
    // then it makes no difference whether the track is painted or not,
    // therefore the painting  can be a no-op.
    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    LinearGradient gradient = LinearGradient(colors: <Color>[
      Color.fromRGBO(0, 189, 1, 1),
      Color.fromRGBO(255, 255, 102, 1),
      Color.fromRGBO(254, 153, 0, 1),
      Color.fromRGBO(197, 89, 86, 1),
    ]);
    // Assign the track segment paints, which are leading: active and
    // trailing: inactive.
    final ColorTween activeTrackColorTween = ColorTween(
        begin: sliderTheme.disabledActiveTrackColor,
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(
        begin: sliderTheme.disabledInactiveTrackColor,
        end: sliderTheme.inactiveTrackColor);
    final Paint activePaint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
    final Paint leftTrackPaint;
    final Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius =
        Radius.circular((trackRect.height + additionalActiveTrackHeight) / 2);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr)
            ? activeTrackRadius
            : trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl)
            ? trackRect.top - (additionalActiveTrackHeight / 2)
            : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl)
            ? trackRect.bottom + (additionalActiveTrackHeight / 2)
            : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl)
            ? activeTrackRadius
            : trackRadius,
      ),
      rightTrackPaint,
    );
  }
}
