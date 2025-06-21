part of 'exports.dart';

class LowLatencySection extends StatelessWidget {
  final HeadphonesSettings<HuaweiFreeBuds5iSettings> headphones;

  const LowLatencySection(this.headphones, {super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return StreamBuilder(
      stream: headphones.settings.map((s) => s.lowLatency),
      initialData: false,
      builder: (_, snap) {
        return ListTileSwitch(
          title: Text(l.lowLatency),
          subtitle: Text(l.lowLatencyDesc),
          value: snap.data ?? false,
          onChanged: (newVal) => headphones.setSettings(
            HuaweiFreeBuds5iSettings(
              lowLatency: newVal,
            ),
          ),
        );
      },
    );
  }
}
