part of 'component.dart';

Future<void> showPinjamanSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    builder: (context) => SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            MainButton(
              label: 'PINJAMAN BANK',
              labelStyle: textTheme.button.copyWith(color: Colors.white),
              color: colorScheme['primary'],
              onPressed: () {},
            ),
            const Spacer(),
            MainButton(
              label: 'PROPOSAL KE INVESTOR',
              color: colorScheme['background2'],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: colorScheme['primary'])),
              icon: const Tooltip(
                message: 'Penjelasan Tooltip',
                child: Icon(Icons.info_outline),
              ),
              onPressed: () {},
            ),
            const Spacer(),
          ],
        ),
      ),
    ),
  );
}
