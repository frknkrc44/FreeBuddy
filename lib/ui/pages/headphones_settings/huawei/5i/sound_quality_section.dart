part of 'exports.dart';

class SoundQualitySection extends StatelessWidget {
  final HeadphonesSettings<HuaweiFreeBuds5iSettings> headphones;

  const SoundQualitySection(this.headphones, {super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return StreamBuilder(
      stream: headphones.settings.map((s) => s.soundQualityMode),
      initialData: false,
      builder: (_, snap) {
        return ListTileSwitch(
          title: Text(l.soundQuality),
          subtitle: Text(l.soundQualityDesc),
          value: snap.data ?? false,
          onChanged: (newVal) => headphones.setSettings(
            HuaweiFreeBuds5iSettings(
              soundQualityMode: newVal,
            ),
          ),
        );
      },
    );
  }
}
