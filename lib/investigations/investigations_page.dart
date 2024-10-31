import 'package:hmis/main.dart';

class InvestigationsPage extends UI {
  const InvestigationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Investigations'),
      body: ListView(
        children: iterableOfInvestigations.map(
          (investigation) {
            return ListTile(
              title: investigation.name.text(textScaleFactor: 1.2),
              trailing: IconButton.outlined(
                onPressed: () {
                  // investigationsBloc.remove(investigation.id);
                },
                icon: investigation.price.text(),
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
              // investigationsBloc.add(const Investigation());
            },
            child: 'Add New Investigation'.text(),
          ).pad(),
        ],
      ),
    );
  }
}
