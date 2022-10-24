import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recete/model/disease_model.dart';
import 'package:recete/pages/detail_page/detail_page.dart';
import 'package:recete/pages/list_page/landing_page_controller.dart';

class CategoryResultsPage extends StatelessWidget {
  const CategoryResultsPage({Key? key, required this.speciality})
      : super(key: key);

  final Speciality speciality;

  @override
  Widget build(BuildContext context) {
    var controller = context.read<ListPageController>();
    List<Disease> categroizedList = controller.allResutls
        .where((disease) => disease.specialities!.contains(speciality))
        .toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(speciality.valeu),
              background: Hero(
                tag: speciality.toString(),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    speciality.imagepath,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),

          // text 'Tüm reçeteler'
          //
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
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
                  title: Text(categroizedList[index].name!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DiseaseDetailPage(
                          disease: categroizedList[index],
                        ),
                      ),
                    );
                  },
                );
              },
              childCount: categroizedList.length,
            ),
          ),
        ],
      ),
    );
  }
}
