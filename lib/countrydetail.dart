import 'package:covidapp/api/models/api.dart';
import 'package:covidapp/api/models/statistics_response.dart';
import 'package:covidapp/countryscreen.dart';
import 'package:flutter/material.dart';

class CountryDetail extends StatefulWidget {
  //Variable to accept value from previous screen
  //This is to pass whole object from country screen
  //So the type is MyCountries
  final MyCountries myCountry;

  //Constructor
  const CountryDetail({Key? key, required this.myCountry}) : super(key: key);

  //Route
  static const routeName = '/countrydetail';

  @override
  _CountryDetailState createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {

  Statistic? statistic;

  //ready to call the API
  @override
  void initState(){
    super.initState();


    //to access to the class, need the MAGIC KEYWORD and that is widget
    //need to use then, because got the keyword future
    //when got future, need to have the keyword then

    Api().getStatistics(widget.myCountry.name).then((StatisticResponse _){
      //it will never have any error anymore 
      if(_.response.length > 0){
        //to get rid of the loading screen 

        setState(() => statistic = _.response[0]);
        statistic=_.response[0];
      }

      print(_.response[0].continent);
      print(_.response[0].country);
      print(_.response[0].population);
      print(_.response[0].cases.newCase);
      print(_.response[0].cases.critical);
      print(_.response[0].cases.active);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.myCountry.name)),
        body: statistic == null
            ? const Center(child:CircularProgressIndicator())
            : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cases",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                  ),
                  Container(
                    height: 200,
                    //row is a widget
                    child: Row(
                      children: [
                        Expanded(child: CardComponent(title: "New Cases", value: statistic?.cases.newCase ?? "0", title_color: Colors.black45, value_color: Colors.red, background_color: Colors.lightBlue.shade50)), //able to fill in the rest of the space of the width and the height 
                        Expanded(child: CardComponent(title: "Active Cases", value: statistic?.cases.active.toString() ?? "0", title_color: Colors.black45, value_color: Colors.red, background_color: Colors.lightBlue.shade50)),
                      ],
                    )),
                  Container(
                    height: 200,
                    child: Row(
                      children: [
                        Expanded(child: CardComponent(title: "Critical", value: statistic?.cases.critical.toString() ?? "0", title_color: Colors.black45, value_color: Colors.red, background_color: Colors.lightBlue.shade50)),
                        Expanded(child: CardComponent(title: "Recovered", value: statistic?.cases.recovered.toString() ?? "0", title_color: Colors.black45, value_color: Colors.red, background_color: Colors.lightBlue.shade50)),
                      ],
                    )),
                  Container(
                    height:200,
                    child: Row(
                      children: [
                        Expanded(child: CardComponent(title: "1M_POP", value: statistic?.cases.oneMPop ?? "0", title_color: Colors.black45, value_color: Colors.red, background_color: Colors.lightBlue.shade50)),
                        Expanded(child: CardComponent(title: "Total", value: statistic?.cases.total.toString() ?? "0", title_color: Colors.black45, value_color: Colors.red, background_color: Colors.lightBlue.shade50)),
                      ],
                    )),

                  const SizedBox(height: 15),
                  const Text(
                    "Deaths",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 200,
                    //row is a widget
                    child: Row(
                      children: [
                        Expanded(child: CardComponent(title: "New Cases", value: statistic?.deaths.newCase ?? "0", title_color: Colors.black45, value_color: Colors.red, background_color: Colors.lightBlue.shade50)), //able to fill in the rest of the space of the width and the height 
                        Expanded(child: CardComponent(title: "1M_POP", value: statistic?.deaths.oneMPopulation ?? "0", title_color: Colors.black45, value_color: Colors.red, background_color: Colors.lightBlue.shade50)),
                      ],
                    )),
                  Container(
                    height: 200,
                    child: Row(
                      children: [
                        Expanded(child: CardComponent(title: "Total", value: statistic?.deaths.total.toString() ?? "0", title_color: Colors.black45, value_color: Colors.red, background_color: Colors.lightBlue.shade50)),
                      ],
                    )),

                  SizedBox(height: 15),
                   const Text(
                    "Tests",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 200,
                    //row is a widget
                    child: Row(
                      children: [
                        Expanded(child: CardComponent(title: "1M_POP", value: statistic?.tests.oneMPopulation ?? "0", title_color: Colors.black45, value_color: Colors.red, background_color: Colors.lightBlue.shade50)), //able to fill in the rest of the space of the width and the height 
                        Expanded(child: CardComponent(title: "Total", value: statistic?.tests.total.toString()?? "0", title_color: Colors.black45, value_color: Colors.red, background_color: Colors.lightBlue.shade50)),
                      ],
                    )),
                  
                  
                  
                ],
              )));
  }
}

class CardComponent extends StatelessWidget {
  final String title, value;
  final Color title_color, background_color, value_color;

  const CardComponent({ Key? key, required this.title, required this.value, required this.title_color, required this.background_color, required this.value_color  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card( //square box
        color:background_color,
        child: Column( //vertical. use to arrange things
        mainAxisAlignment:MainAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(color: Colors.lightBlue)),
        Text(value,
          style: TextStyle(fontSize: 30, color: value_color),
        )
      ],
    ));
  }
}

















