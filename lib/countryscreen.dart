import 'package:covidapp/countrydetail.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatefulWidget {
  //although password is allowed to be null here, but when in the homescreen user login time, we ady restrict the user cannot key in null value
  final String username; //var to hold the username value passed from the homescreen
  final String? password; //var to hold the password value passed from the homescreen
  
  //Constructor
  const CountryScreen({ Key? key ,required this.username,this.password}) : super(key: key);

  //Create a route, to jump between screen
  //if static here, so we only need to change one place here if any changes in future/prevent typo in different places
  //now we can use the name 'country', because this is user defined word, wont crash wif system
  static const routeName='/country';

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  //before build widget, create array first
  //list is array here
  //below three list are same purpose => create countries
  List<String> countries=[
    'Malaysia','Singapore','Thailand', 'Indonesia', 'Brunei'
  ];
  List<String> flag=[
    'malaysia.png','singapore.png','thailand.png','indonesia.png', 'brunei.png'
  ];
  List<MyCountries> myCountries=[];
  
  //below method is used to initiate a state, and it only run once if just quick hot reload without restart whole reload
  //if renew, hot reload cannot see, because only build method will undergo hot reload
  //so except build, others will be ignored 
  @override
  void initState(){
    super.initState();
    countries.add('Korea');

    for(String name in countries){
      if(name=='Malaysia'){
        myCountries.add(MyCountries(name,name.toLowerCase()+'.png',"This is Malaysia","MY"));
      }
      else if(name=='Singapore'){
        myCountries.add(MyCountries(name,name.toLowerCase()+'.png',"This is Singapore","SG"));
      }else if(name=='Thailand'){
        myCountries.add(MyCountries(name,name.toLowerCase()+'.png',"This is Thailand","TH"));
      }else if(name=='Indonesia'){
        myCountries.add(MyCountries(name,name.toLowerCase()+'.png',"This is South Korea","SK"));
      }else if(name=='Brunei'){
        myCountries.add(MyCountries(name,name.toLowerCase()+'.png', "This is Brunei", "Br"));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //reason to use widget.username is because username is belong to class above, which is countryscreen
      //username is not in this class, so need to borrow
      appBar:AppBar(title:Text(widget.username)),
      body:ListView.separated(
        separatorBuilder: (c,i)=>const Divider(thickness:2.0), 
        itemCount: myCountries.length,//determine the array how long, so the item count how long
        itemBuilder: (context,int index){
          return ListTile(
            leading:Image.asset('assets/${myCountries[index].imageName}'),//start of the row of one list tile
            title:Text(myCountries[index].name),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),//end of the row of one list tile
            subtitle: Text(myCountries[index].subtitle),
            onTap: (){
              //navigate to next page
              Navigator.pushNamed(context, CountryDetail.routeName,arguments: {'myCountry':myCountries[index]});
            },
          );
        } 
        )
    );
  }

  //this method is to make sure to stop the program completely
  @override 
  void dispose(){
    super.dispose();
  }
}

class MyCountries{
  String name;
  String imageName;
  String subtitle;
  String countryCode;

  //Constructor
  MyCountries(this.name,this.imageName,this.subtitle,this.countryCode);
  
}


