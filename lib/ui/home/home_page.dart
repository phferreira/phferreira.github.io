import 'package:flutter/material.dart';
import 'package:phferreira/ui/about/about_page.dart';
import 'package:phferreira/ui/contact/contact_page.dart';
import 'package:phferreira/ui/experience/experience_page.dart';
import 'package:phferreira/ui/work/work_page.dart';
import 'package:phferreira/data/repositories/navigation_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: constraints.maxWidth < 480.0
              ? AppBar(
                  backgroundColor: const Color(0xFF747569),
                )
              : null,
          drawer: constraints.maxWidth < 480.0
              ? Drawer(
                  backgroundColor: const Color(0xFF747569),
                  child: ListView(
                    children: [
                      for (int pageCount = 0;
                          pageCount < NavigationRepository.items.length;
                          pageCount++)
                        ListTile(
                          selectedColor: const Color(0xFF80955D),
                          textColor: const Color(0xFF80955D),
                          selected: _selectedIndex == pageCount,
                          selectedTileColor: const Color(0xFF80955D),
                          title: Text(
                            NavigationRepository.items[pageCount].label,
                            style: TextStyle(
                              color: _selectedIndex == pageCount
                                  ? Colors.white70
                                  : const Color(0xFF80955D),
                            ),
                          ),
                          leading: Icon(
                            NavigationRepository.items[pageCount].icon,
                            color: _selectedIndex == pageCount
                                ? Colors.white70
                                : const Color(0xFF80955D),
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
                        )
                    ],
                  ),
                )
              : null,
          body: Row(
            children: [
              Visibility(
                visible: constraints.maxWidth >= 480.0,
                child: NavigationRail(
                  minWidth: 80,
                  minExtendedWidth: 200,
                  elevation: 9,
                  extended: constraints.maxWidth > 1440.0 || _isExtended,
                  useIndicator: true,
                  selectedIconTheme: const IconThemeData(
                    color: Colors.white70,
                  ),
                  selectedIndex: _selectedIndex,
                  selectedLabelTextStyle: const TextStyle(
                    color: Color(0xFF80955D),
                  ),
                  backgroundColor: const Color(0xFF747569),
                  indicatorColor: const Color(0xFF80955D),
                  unselectedIconTheme:
                      const IconThemeData(color: Color(0xFF80955D)),
                  unselectedLabelTextStyle: const TextStyle(
                    color: Color(0xFF80955D),
                  ),
                  leading: Visibility(
                    visible: constraints.maxWidth < 1440.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: _isExtended ? 200 : 80,
                      alignment: _isExtended
                          ? Alignment.centerRight
                          : Alignment.center,
                      padding: EdgeInsets.only(right: _isExtended ? 18 : 0),
                      curve: Curves.linear,
                      child: IconButton(
                        // icon: const Icon(Icons.menu),
                        icon:
                            Icon(_isExtended ? Icons.chevron_left : Icons.menu),
                        color: const Color(0xFF80955D),
                        onPressed: () {
                          setState(() {
                            _isExtended = !_isExtended;
                          });
                        },
                      ),
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
                    // _selectedIndex = index;
                  },
                  destinations: [
                    for (int pageCount = 0;
                        pageCount < NavigationRepository.items.length;
                        pageCount++)
                      NavigationRailDestination(
                        icon: Icon(NavigationRepository.items[pageCount].icon),
                        label: Text(NavigationRepository.items[pageCount].label),
                      )
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
