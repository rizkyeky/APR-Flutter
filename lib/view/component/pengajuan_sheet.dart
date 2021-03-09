part of 'component.dart';

Future<void> showPengajuanSheet(BuildContext context) async {
  final ValueNotifier<bool> keyboardShowup = ValueNotifier(false);
  final FocusNode focusKeyboard1 = FocusNode();
  final FocusNode focusKeyboard2 = FocusNode();

  focusKeyboard1.addListener(() {
    keyboardShowup.value = !keyboardShowup.value;
  });

  focusKeyboard2.addListener(() {
    keyboardShowup.value = !keyboardShowup.value;
  });

  await showModalBottomSheet(
    context: context,
    clipBehavior: Clip.antiAlias,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24))
    ),
    builder: (context) => ValueListenableBuilder<bool>(
      valueListenable: keyboardShowup,
      builder: (context, isShowup, child) {
        final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        return SizedBox(
          height: isShowup ? 500 + keyboardHeight : 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Container(
                height: 60,
                color: colorScheme['primary'],
                alignment: Alignment.center,
                child: Text('PENGAJUAN KREDIT', style: textTheme.subtitle1.copyWith(
                  color: Colors.white,
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: child
              )
            ],
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        textBaseline: TextBaseline.alphabetic,
        children: [
          MainTextField(
            focusNode: focusKeyboard1,
            onChanged: (val) {},
            hint: 'Pilih Ide bisnis Anda',
          ),
          const SizedBox(height: 24,),
          MainTextField(
            focusNode: focusKeyboard2,
            onChanged: (val) {},
            hint: 'Alasan Kenapa Memilih ide Bisnis ini',
            maxLines: 5,
          ),
          const SizedBox(height: 24,),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colorScheme['background2'],
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: const Text('Proposal. max 3MB')
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextButton(
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(12)
                    // ),
                    // color: colorScheme['primary'],
                    onPressed: () {},
                    child: Text('Upload', style: textTheme.button.copyWith(
                      color: Colors.white
                    ))
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 24,),
          MainButton(
            label: 'SUBMIT PINJAMAN',
            onPressed: () {},
          ),
        ]
      ),
    )
  ).whenComplete(() async {
    await Future.delayed(const Duration(seconds: 1)).whenComplete(() {
      focusKeyboard1.dispose();
      focusKeyboard2.dispose();
      keyboardShowup.dispose();
    });
  });
}