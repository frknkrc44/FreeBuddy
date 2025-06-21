part of 'exports.dart';

class AutoPauseSection extends StatelessWidget {
  final HeadphonesSettings<HuaweiFreeBuds5iSettings> headphones;

  const AutoPauseSection(this.headphones, {super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return StreamBuilder(
      stream: headphones.settings.map((s) => s.autoPause),
      initialData: false,
      builder: (_, snap) {
        return ListTileSwitch(
          title: Text(l.autoPause),
          subtitle: Text(l.autoPauseDesc),
          value: snap.data ?? false,
          onChanged: (newVal) => headphones.setSettings(
            HuaweiFreeBuds5iSettings(autoPause: newVal),
          ),
        );
      },
    );
  }
}
