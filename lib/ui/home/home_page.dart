import 'package:flutter/material.dart';
import 'package:phferreira/core/theme/app_theme.dart';
import 'package:phferreira/data/repositories/navigation_repository.dart';
import 'package:phferreira/ui/about/about_page.dart';
import 'package:phferreira/ui/contact/contact_page.dart';
import 'package:phferreira/ui/experience/experience_page.dart';
import 'package:phferreira/ui/home/widgets/theme_dropdown.dart';
import 'package:phferreira/ui/work/work_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.currentThemeMode,
    required this.onThemeChanged,
  });

  final AppThemeMode currentThemeMode;
  final ValueChanged<AppThemeMode> onThemeChanged;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const double _phoneBreakpoint = 600;
  static const double _desktopBreakpoint = 1024;

  int _selectedIndex = 0;
  bool _isExtended = false;

  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _selectedIndex = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isPhone = width < _phoneBreakpoint;
        final isTablet =
            width >= _phoneBreakpoint && width < _desktopBreakpoint;
        final isDesktop = width >= _desktopBreakpoint;

        return Scaffold(
          appBar: isPhone
              ? AppBar(
                  backgroundColor: colorScheme.surface,
                )
              : null,
          drawer: isPhone
              ? Drawer(
                  backgroundColor: colorScheme.surface,
                  child: SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              for (int pageCount = 0;
                                  pageCount < NavigationRepository.items.length;
                                  pageCount++)
                                ListTile(
                                  selected: _selectedIndex == pageCount,
                                  selectedTileColor: colorScheme.primary,
                                  title: Text(
                                    NavigationRepository.items[pageCount].label,
                                    style: TextStyle(
                                      color: _selectedIndex == pageCount
                                          ? colorScheme.onPrimary
                                          : colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  leading: Icon(
                                    NavigationRepository.items[pageCount].icon,
                                    color: _selectedIndex == pageCount
                                        ? colorScheme.onPrimary
                                        : colorScheme.onSurfaceVariant,
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      _pageController.animateToPage(
                                        pageCount,
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.linear,
                                      );
                                    });
                                  },
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: ThemeDropdown(
                            currentThemeMode: widget.currentThemeMode,
                            onThemeChanged: widget.onThemeChanged,
                            compact: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : null,
          body: Row(
            children: [
              Visibility(
                visible: isTablet || isDesktop,
                child: NavigationRail(
                  minWidth: 80,
                  minExtendedWidth: 230,
                  elevation: 9,
                  extended: _isExtended,
                  groupAlignment: -1,
                  trailingAtBottom: true,
                  useIndicator: true,
                  selectedIconTheme: IconThemeData(
                    color: colorScheme.onPrimary,
                  ),
                  selectedIndex: _selectedIndex,
                  selectedLabelTextStyle: TextStyle(
                    color: colorScheme.onSurface,
                  ),
                  backgroundColor: colorScheme.surface,
                  indicatorColor: colorScheme.primary,
                  unselectedIconTheme:
                      IconThemeData(color: colorScheme.onSurfaceVariant),
                  unselectedLabelTextStyle: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  leading: Visibility(
                    visible: !isPhone,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: _isExtended ? 200 : 80,
                      alignment:
                          _isExtended ? Alignment.centerRight : Alignment.center,
                      padding: EdgeInsets.only(right: _isExtended ? 18 : 0),
                      curve: Curves.linear,
                      child: IconButton(
                        icon: Icon(
                          _isExtended ? Icons.chevron_left : Icons.menu,
                        ),
                        color: colorScheme.onSurfaceVariant,
                        onPressed: () {
                          setState(() {
                            _isExtended = !_isExtended;
                          });
                        },
                      ),
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.all(12),
                    child: ThemeDropdown(
                      currentThemeMode: widget.currentThemeMode,
                      onThemeChanged: widget.onThemeChanged,
                      compact: !_isExtended,
                    ),
                  ),
                  onDestinationSelected: (index) {
                    setState(() {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(seconds: 1),
                        curve: Curves.linear,
                      );
                    });
                  },
                  destinations: [
                    for (int pageCount = 0;
                        pageCount < NavigationRepository.items.length;
                        pageCount++)
                      NavigationRailDestination(
                        icon: Icon(NavigationRepository.items[pageCount].icon),
                        label: Text(NavigationRepository.items[pageCount].label),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Scrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  controller: _pageController,
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    controller: _pageController,
                    pageSnapping: false,
                    children: const [
                      AboutPage(),
                      ExperiencePage(),
                      WorkPage(),
                      ContactPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
