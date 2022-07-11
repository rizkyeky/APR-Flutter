part of 'page.dart';

class EntryPage extends Page<EntryBloc> {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }
  
  @override
  Widget build(BuildContext context) => Material(
    color: colorScheme['primary'],
    child: Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Image.asset('assets/background/back.png',
          fit: BoxFit.cover,
          colorBlendMode: BlendMode.multiply,
          color: colorScheme['primary']?.withOpacity(0.67),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Image.asset('assets/logo/logo.png', height: 84, width: 110),
              const SizedBox(height: 150,),
              Text('Aplikasi\nyang dapat mewujudkan impian\ndan cita-citamu',
                textAlign: TextAlign.center, 
                style: textTheme.subtitle1?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.5,
                )
              ),
              const SizedBox(height: 24,),
              MainButton(
                label: 'LOGIN',
                onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => LoginPage())
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}