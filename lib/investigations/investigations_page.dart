import 'package:hmis/main.dart';

class InvestigationsPage extends UI {
  const InvestigationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Investigations'),
      body: ListView(
        children: investigationsBloc.get.cache.values.map(
          (investigationEntry) {
            return ListTile(
              title: investigationEntry.name.text(textScaleFactor: 1.2),
              trailing: IconButton.outlined(
                onPressed: () {
                  investigationsBloc.remove(investigationEntry.id);
                },
                icon: investigationEntry.price.text(),
              ),
            );
          },
        ).toList(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilledButton(
            onPressed: () {
              investigationsBloc.add(const Investigation());
            },
            child: 'Add New Investigation'.text(),
          ).pad(),
        ],
      ),
    );
  }
}
