part of 'component.dart';

Future<void> showPengajuanSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    clipBehavior: Clip.antiAlias,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24))
    ),
    builder: (context) => SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: 480,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 60,
                color: colorScheme['primary'],
                alignment: Alignment.center,
                child: Text('PENGAJUAN KREDIT', style: textTheme.subtitle1?.copyWith(
                  color: Colors.white,
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    MainTextField(
                      onChanged: (val) {},
                      hint: 'Pilih Ide bisnis Anda',
                    ),
                    const SizedBox(height: 24,),
                    MainTextField(
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
                              style: TextButton.styleFrom(
                                backgroundColor: colorScheme['primary'],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)
                                ),
                              ),
                              onPressed: () {},
                              child: Text('Upload', style: textTheme.button?.copyWith(
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
            ],
          ),
        ),
      ),
    )
  );
}