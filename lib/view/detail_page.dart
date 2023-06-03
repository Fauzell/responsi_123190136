import 'package:flutter/material.dart';
import 'package:responsi_123190136/main.dart';
import 'package:responsi_123190136/model/meal_detail_model.dart';
import 'package:responsi_123190136/model/meal_list_model.dart';
import 'package:responsi_123190136/source/meal_source.dart';
import 'package:responsi_123190136/view/meal_category.dart';

class DetailPage extends StatefulWidget {
  final Uri youtube =
      Uri.parse('https://www.youtube.com/results?search_query=');
  final MealList data;
  final int index;
  DetailPage({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late int no = widget.index;
  bool isFavorite = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Detail of ${widget.data.meals?[no].strMeal}".toTitleCase()),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainApp()),
                (_) => false,
              );
            },
            icon: const Icon(Icons.home),
            iconSize: 30,
          )
        ],
      ),
      body: _buildDetailMeal(),
    );
  }

  Widget _buildDetailMeal() {
    debugPrint("${widget.data.meals?[no].idMeal}");
    return FutureBuilder(
        future: MealSource.instance
            .loadDetail(idMeal: "${widget.data.meals?[no].idMeal}"),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            MealDetail mealdetail = MealDetail.fromJson(snapshot.data);
            return _buildSuccessSection(mealdetail);
          }
          return _buildLoadingSection();
        });
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorSection() {
    return const Text("Error2");
  }

  Widget _buildSuccessSection(MealDetail data) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildHeader(data),
            _buildDescription(data),
            _buildIngredient(data),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(MealDetail data) {
    return Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 5.0, color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(25),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  "${data.meals![0].strMealThumb}",
                  fit: BoxFit.fill,
                  width: 120.0,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 200.0,
              height: 140.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${data.meals![0].strMeal}".toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      "Meal ID. ${data.meals![0].idMeal}",
                      style:
                          const TextStyle(fontSize: 18.0, fontFamily: 'Koulen'),
                    ),
                    Text(
                      "Meal Category: ${data.meals![0].strCategory}",
                      style:
                          const TextStyle(fontSize: 18.0, fontFamily: 'Koulen'),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }

  Widget _buildDescription(MealDetail data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 9),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 5.0, color: Colors.blueGrey.shade700),
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey.withOpacity(0.6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "INSTRUCTIONS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Text(
                "${data.meals![0].strInstructions}",
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIngredient(MealDetail data) {
    List<String> value = [
      "${data.meals![0].strIngredient1}",
      "${data.meals![0].strIngredient2}",
      "${data.meals![0].strIngredient3}",
      "${data.meals![0].strIngredient4}",
      "${data.meals![0].strIngredient5}",
      "${data.meals![0].strIngredient6}",
      "${data.meals![0].strIngredient7}",
      "${data.meals![0].strIngredient8}",
      "${data.meals![0].strIngredient9}",
      "${data.meals![0].strIngredient10}",
      "${data.meals![0].strIngredient11}",
      "${data.meals![0].strIngredient12}",
      "${data.meals![0].strIngredient13}",
      "${data.meals![0].strIngredient14}",
      "${data.meals![0].strIngredient15}",
    ];
    List<String> valueMeasure = [
      "${data.meals![0].strMeasure1}",
      "${data.meals![0].strMeasure2}",
      "${data.meals![0].strMeasure3}",
      "${data.meals![0].strMeasure4}",
      "${data.meals![0].strMeasure5}",
      "${data.meals![0].strMeasure6}",
      "${data.meals![0].strMeasure7}",
      "${data.meals![0].strMeasure8}",
      "${data.meals![0].strMeasure9}",
      "${data.meals![0].strMeasure10}",
      "${data.meals![0].strMeasure11}",
      "${data.meals![0].strMeasure12}",
      "${data.meals![0].strMeasure13}",
      "${data.meals![0].strMeasure14}",
      "${data.meals![0].strMeasure15}",
    ];

    value.removeWhere((value) => value == "");
    valueMeasure.removeWhere((value) => value == "");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blueGrey.shade800,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(2),
          color: Colors.blueGrey.withOpacity(0.6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "MAIN INGREDIENTS",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 8),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, i) {
                    return Card(
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 2, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          splashColor: Colors.lightBlueAccent,
                          highlightColor: Colors.lightBlueAccent,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              children: [
                                Image.network(
                                  "https://www.themealdb.com/images/ingredients/${value[i]}-Small.png",
                                  width: 80.0,
                                ),
                                Text(
                                  value[i].toTitleCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Text(
                                  valueMeasure[i].toTitleCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                  itemCount: value.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
