part of 'page.dart';

class TabPage extends StatelessWidget {

  final Widget homePage = HomePage();
  final Widget ideBisnisPage = IdeBisnisPage();
  final Widget pelatihanPage = PelatihanPage();
  final Widget profilePage = ProfilePage();

  final List<Widget> pages = [];
  final ValueNotifier<int> setTab = ValueNotifier(0);

  TabPage({
    Key key,
  }) : super(key: key) {
    pages.addAll([
      homePage, 
      ideBisnisPage,
      pelatihanPage, 
      profilePage,
    ]);
  }
  
  @override
  Widget build(BuildContext context) {
    // var prevTab = setTab.value;
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: setTab, 
        builder: (context, value, _) => pages[value]
        // PageTransitionSwitcher(
        //   reverse: value > prevTab,
        //   transitionBuilder: (child, primary, secondary) => 
        //     SharedAxisTransition(
        //       animation: primary,
        //       secondaryAnimation: secondary,
        //       transitionType: SharedAxisTransitionType.horizontal,
        //       child: child,
        //     ),
        //   child: pages[value]
        // )
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: setTab,
        builder: (context, value, child) => BottomNavigationBar(
          currentIndex: value,
          showUnselectedLabels: false,
          selectedItemColor: colorScheme['primary'],
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold
          ),
          backgroundColor: colorScheme['background2'],
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/logo/bee.png',
                height: 30,
                width: 30,
              ), 
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/logo/gem.svg',
                height: 30,
                width: 30,
                color: value == 1 ? colorScheme['primary'] : colorScheme['accent1'].withOpacity(0.64),
              ),
              label: 'Ide Bisnis',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/logo/setting.svg',
                height: 30,
                width: 30,
                color: value == 2 ? colorScheme['primary'] : colorScheme['accent1'].withOpacity(0.64),
              ), 
              label: 'Pelatihan',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/logo/profile.svg',
                height: 30,
                width: 30,
                color: value == 3 ? colorScheme['primary'] : colorScheme['accent1'].withOpacity(0.64),
              ),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            if (setTab.value != index) {
              // prevTab = setTab.value;
              setTab.value = index;
            }
          },
        ),
      ),
    );
  }
}