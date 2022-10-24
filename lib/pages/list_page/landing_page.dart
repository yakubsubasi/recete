import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recete/model/disease_model.dart';
import 'package:recete/pages/category_page/category_catalog/view/category_page.dart';
import 'package:recete/pages/category_page/category_results/category_results_page.dart';
import 'package:recete/pages/detail_page/detail_page.dart';
import 'package:recete/pages/list_page/landing_page_controller.dart';
import 'package:recete/pages/search/view/search_box_widget.dart';
import 'package:recete/pages/settings/settings.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  // key to scafold
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text(
          "Kolay Reçete",
        ),
        leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState?.openDrawer()),
      ),
      body: const HomePageBody(),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/icons/doctor_avatar.png'),
            ),
            accountName: Text('Dr. Yakub Subaşı'),
            accountEmail: Text(''),
          ),
          ListTile(
            title: const Text('Branşlar'),
            leading: const Icon(Icons.local_hospital),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoryPage(),
                ),
              );
            },
          ),

          // settings

          ListTile(
            title: const Text('Ayarlar'),
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      Provider.of<ListPageController>(context, listen: false).getDiseases();
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<ListPageController>();
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          pinned: true,
          delegate: SliverAppBarDelegate(
            minHeight: 80,
            maxHeight: 80,
            child: SearchWidget(
              hintText: 'Arama yapınız',
              onChanged: controller.search,
              text: 'merhaba',
            ),
          ),
        ),

        // animated CategoriesSection
        SliverToBoxAdapter(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 175),
            child: controller.isSearching ? SizedBox() : CategoriesSection(),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Tüm reçeteler',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                title: Text(controller.searchedResults[index].name!),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DiseaseDetailPage(
                        disease: controller.searchedResults[index],
                      ),
                    ),
                  );
                },
              );
            },
            childCount: controller.searchedResults.length,
          ),
        ),
      ],
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minHeight;
  final double maxHeight;
  SliverAppBarDelegate({
    required this.child,
    required this.minHeight,
    required this.maxHeight,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;
  @override
  double get minExtent => minHeight;
  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Branşlar",
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      child: Text(
                        "hepsini gör",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.blue,
                            ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoryPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 150,
          width: double.infinity,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 12),
            itemCount: Speciality.values.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return CategoryResultsPage(
                          speciality: Speciality.values[index],
                        );
                      }),
                    );
                  },
                  child: IconImagWithHero(index: index));
            },
          ),
        )
      ],
    );
  }
}

class IconImagWithHero extends StatelessWidget {
  const IconImagWithHero({Key? key, required this.index}) : super(key: key);

  //index
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Container(
          padding: const EdgeInsets.all(4),
          height: 100,
          width: 100,
          child: Column(
            children: [
              Hero(
                tag: Speciality.values[index].toString(),
                child: Image.asset(Speciality.values[index].imagepath,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              Text(Speciality.values[index].valeu)
            ],
          ),
        ));
  }
}
