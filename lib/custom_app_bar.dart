// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hmis/main.dart';

class CustomAppBarModel {}

class CustomAppBar extends UI implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final void Function()? onDoubleTap;

  const CustomAppBar({
    this.title = 'NONE',
    this.leading,
    this.bottom,
    this.onDoubleTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: DefaultTabController(
        length: 1,
        child: AppBar(
          title: title.text(textScaleFactor: 1.2),
          automaticallyImplyLeading: false,
          leading: leading ??
              IconButton(
                onPressed: () {
                  navigator.to(HomePage());
                },
                icon: const FaIcon(FontAwesomeIcons.house),
              ),
          bottom: bottom ??
              TabBar(
                onTap: (_) {
                  navigator.to(
                    AlertDialog(
                      title: 'User'.text(),
                      content: TextFormField(
                        initialValue: userName(),
                        onChanged: userName,
                        onEditingComplete: () => navigator.to(HomePage()),
                      ),
                    ),
                  );
                },
                tabs: [
                  Tab(
                    text: userName(),
                  ),
                ],
                overlayColor: WidgetStateProperty.all(Colors.transparent),
              ),
          centerTitle: true,
        ).pad(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130);
}
