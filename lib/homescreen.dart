//import 'package:covidapp/countryscreen.dart';
import 'package:flutter/material.dart';
import 'package:covidapp/countryscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formkey = GlobalKey<FormState>();
   //to check the password with the confirm password, use TextEditingController.
   //for pwcontroller, 
  TextEditingController pwcontroller = TextEditingController();
  var conPass;
  var password;
  String ? username;
  @override
  Widget build(BuildContext context) {
    //to make sure all the device is able to fit the screen properly, use mediaquery
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //put in image in assets folder
                Image.asset("assets/potato.png", scale: 2.1),
                //use scale to adjust the size of the image 
                
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text(
                      "Username", 
                      style: TextStyle(color: Colors.cyanAccent),
                      )),
                      validator: (String? _){
                        if(_ != null && _.isEmpty) return "Username cannot be empty";
                        return null;
                      },
                      onSaved: (_) {
                        //cannot put (:)
                        username= _;
                      },
                ),
                //sized box is just to add extra space between each of the box. It is different with margin
                //margin is use to create white space between the text and the border.  
                SizedBox(height: 10),
                TextFormField(              
                  controller: pwcontroller,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    errorStyle: TextStyle(color: Colors.red),
                  ),
                  
                  validator: (password) {
                    
                    if(password != null && password.isEmpty) return "Password cannot be empty";
                    return null;
                  },
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Confirm Password", 
                    errorStyle: TextStyle(color: Colors.red),
                  ),
                  
                  validator: (conPass) {
                    
                    //create a variable call conpass to compare with the password
                    if(conPass != null && conPass.isEmpty) {
                      return "Confirm password cannot be empty";
                    }

                    // if the (_) not equal to conPass then return 
                    if (pwcontroller.text != conPass){
                      return "Confirm password incorrect";
                    }
                  },
                  obscureText: true,
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(top: height / 40),
                  child: ElevatedButton(
                    onPressed: () => _onSubmit(), 
                    child: Text("Login")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onSubmit () {
    if(_formkey.currentState?.validate() != true) return;

    //success no error input 
    _formkey.currentState?.save();
    print(username);
    //link to second page 
    Navigator.pushNamed(context, CountryScreen.routeName, 
    //pass argument 
      arguments:{'username':username, 'password':password}
      );
      
  
  }

}









