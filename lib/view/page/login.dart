part of 'page.dart';

class LoginPage extends Page<EntryBloc> {

  LoginPage() : super(hasNetworkSnack: true);
  
  @override
  Widget build(BuildContext context) => Material(
    color: colorScheme['primary'],
    child: Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: LoginPainter1(),
        ),
        CustomPaint(
          painter: LoginPainter2(),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Image.asset('assets/logo/logo.png', height: 84, width: 110),
                const SizedBox(height: 32,),
                LoginTextField(
                  hitText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) {},
                ),
                const SizedBox(height: 24,),
                LoginTextField(
                  hitText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onChanged: (val) {},
                ),
                const SizedBox(height: 24,),
                TextButton(
                  onPressed: () {}, 
                  child: Text('FORGET PASSWORD', style: textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme['background2']
                  ))
                ),
                const SizedBox(height: 24,),
                MainButton(
                  label: 'MASUK',
                  onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => TabPage())
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

class LoginPainter1 extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
        
    final center = Offset(size.width, (size.height/2) + 160);

    final rectShape = Rect.fromLTWH(100, size.height-(320+160), 320, 640);
    final gradient = LinearGradient(
      colors: [Colors.transparent, const Color(0xFF22B9FC).withOpacity(0.34), const Color(0xFF22B9FC)], 
      stops: const [0, 0.5 ,1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter
    );  
        
    final paint = Paint()
      ..shader = gradient.createShader(rectShape);

    canvas.drawCircle(center, 320, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LoginPainter2 extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
        
    final rectShape = Rect.fromLTWH(100, size.height-(320+160), 320, 640);
    final gradient = LinearGradient(
      colors: [Colors.transparent, const Color(0xFF22B9FC).withOpacity(0.34), const Color(0xFF22B9FC)], 
      stops: const [0, 0.5 ,1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter
    );  
        
    final paint = Paint()
      ..shader = gradient.createShader(rectShape);

    canvas.drawPaint(paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}