part of 'page.dart';

class ProfilePage extends Page<ProfileBloc> {
  @override
  void dispose() {
  }

  @override
  void init() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 24,),
            CircleAvatar(
              radius: 50,
              backgroundColor: colorScheme['primary'],
            ),
            const SizedBox(height: 12,),
            Text('USER NAME',
              textAlign: TextAlign.center,
              style: textTheme.headline6.copyWith(
                color: colorScheme['primary']
              )
            ),
            const SizedBox(height: 12,),
            Text('08524575556, Email@gmail.com', 
              textAlign: TextAlign.center,
              style: textTheme.subtitle2
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FlatButton(
                      color: colorScheme['primary'],
                      onPressed: () async => showPinjamanSheet(context),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text('PINJAMAN', style: textTheme.button.copyWith(
                        color: Colors.white
                      )),
                    ),
                  ),
                  const SizedBox(width: 24,),
                  Expanded(
                    child: FlatButton(
                      color: colorScheme['background2'],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: BorderSide(color: colorScheme['primary'])
                      ),
                      onPressed: () {},
                      child: Text('TABUNGAN', style: textTheme.button.copyWith(
                        color: colorScheme['primary']
                      )),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: colorScheme['primary'],
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text('anda memiliki', style: textTheme.subtitle1.copyWith(
                    color: Colors.white,
                  )),
                  const SizedBox(height: 6),
                  Text('Rp 200.000', style: textTheme.headline4.copyWith(
                    color: Colors.white
                  )),
                  const SizedBox(height: 6),
                  Text('hanya dari program referral code', style: textTheme.subtitle2.copyWith(
                    color: Colors.white,
                  )),
                  const SizedBox(height: 12),
                  Divider(
                    thickness: 1,
                    color: colorScheme['background2']
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('USRENS123', style: textTheme.subtitle1.copyWith(
                        color: colorScheme['accent1'],
                      )),
                      SvgPicture.asset('assets/logo/more.svg',
                        color: Colors.white,
                        width: 24,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: MainTextField(
                hint: 'Masukan kode promo',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Pelatihan yang diikuti', style: textTheme.subtitle1.copyWith(
                color: colorScheme['primary']
              )),
            ),
            SizedBox(
              height: 120+24.0,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (_, i) => const SizedBox(width: 12),
                itemBuilder: (_, i) => (i != 2) ? ContainerImage(
                  width: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Bingkisan Daerah', style: textTheme.subtitle2.copyWith(
                          color: Colors.white
                        )),
                      ],
                    ),
                  )
                ) : SizedBox(
                  width: 120,
                  child: Material(
                    clipBehavior: Clip.antiAlias,
                    color: colorScheme['accent1'],
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      splashColor: colorScheme['primary'].withOpacity(0.48),
                      highlightColor: colorScheme['primary'].withOpacity(0.24),
                      onTap: () {},
                      child: Center(
                        child: Icon(Icons.add, color: colorScheme['primary'], size: 32)
                      ),
                    ),
                  ),
                ), 
              )
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Ide Bisnis Favorit', style: textTheme.subtitle1.copyWith(
                color: colorScheme['primary']
              )),
            ),
            SizedBox(
              height: 120+24.0,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (_, i) => const SizedBox(width: 12),
                itemBuilder: (_, i) => (i != 2) ? ContainerImage(
                  width: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Bingkisan Daerah', style: textTheme.subtitle2.copyWith(
                        color: Colors.white
                      )),
                    ),
                  )
                ) : SizedBox(
                  width: 120,
                  child: Material(
                    clipBehavior: Clip.antiAlias,
                    color: colorScheme['accent1'],
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      splashColor: colorScheme['primary'].withOpacity(0.48),
                      highlightColor: colorScheme['primary'].withOpacity(0.24),
                      onTap: () {},
                      child: Center(
                        child: Icon(Icons.add, color: colorScheme['primary'], size: 32)
                      ),
                    ),
                  ),
                ), 
              )
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: FlatButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (_) => EntryPage()), 
                  (_) => false
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                color: colorScheme['background2'],
                child: Text('KELUAR', style: textTheme.button.copyWith(
                  color: colorScheme['primary']
                )),
              ),
            )
          ],
        ),
      )
    );
  }
}