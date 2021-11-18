// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'google_login_controller.dart';
import 'home_page.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _value=false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Login", style: GoogleFonts.poppins(color: Colors.grey.shade50, fontSize: 26,fontWeight: FontWeight.bold,),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.05),

            //email
            Container(
              color: Colors.grey.shade900,
              height: 40,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter your email id";
                  }
                  return null;
                },
                decoration:  InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10,bottom: 5),
                  focusColor: Colors.white,
                  border: InputBorder.none,
                  hintText: "   E-mail",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey.shade300,fontSize: 14),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),

            //Passsword
            Container(
              color: Colors.grey.shade900,
              height: 40,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: passwordcontroller,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter your password";
                  }
                  return null;
                },
                decoration:  InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10,bottom: 5),
                  border: InputBorder.none,
                  hintText: "   Password",
                  hintStyle: GoogleFonts.poppins(color: Colors.grey.shade300,fontSize: 14),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            //Remember login
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15,),
                  width: 40,
                  height: 40,
                  child: Checkbox(
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        if(_value==false){
                          _value=true;
                        }
                        else
                          {
                            _value=false;
                          }

                      });
                    },
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                  ),
                ),

                Container(
                  child: Text(
                    "Remember Login",
                    style: GoogleFonts.poppins(
                      // decoration: TextDecoration.underline,
                      fontSize: 15,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            //Continue button
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow.shade800,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      if(emailcontroller.text=="test@gmail.com" && passwordcontroller.text=="Test@12345"){

                        Fluttertoast.showToast(msg: "Login successfully",backgroundColor: Colors.white,textColor: Colors.black);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()));
                      }
                      else {
                        FocusScope.of(context).unfocus();
                        Fluttertoast.showToast(msg: "Login failed",backgroundColor: Colors.white,textColor: Colors.black);
                      }
                      return;
                    }
                  },
                  child: Text(
                    "CONTINUE",
                    style: GoogleFonts.poppins(color: Colors.black,fontSize: 15),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.001),
            //forgot password
            Container(
              alignment: Alignment.center,
              child: Text(
                "Forgot Password",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.yellow.shade800,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            //Or login with
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              alignment: Alignment.centerLeft,
              child: Text(
                "Or Login with",
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  color: Colors.white70,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            //google button
            loginUI(),
            SizedBox(height: size.height * 0.01),
            //facebook button
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo.shade800,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  onPressed: () {},
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const FaIcon(FontAwesomeIcons.facebook,size: 18,),
                      SizedBox(width: size.width*0.01,),
                      Text(
                        "Facebook",
                        style: GoogleFonts.poppins(color: Colors.white,fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            //instagram button
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink.shade300,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const FaIcon(FontAwesomeIcons.instagram,size: 15,),
                      SizedBox(width: size.width*0.01,),
                      Text(
                        "Instagram",
                        style: GoogleFonts.poppins(color: Colors.white,fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  loginUI(){
    return Consumer<GoogleSignInController>(
      builder: (context,model,child){
        if(model.googleAccount != null){
          return Center(child: loggedInUI(model),);
        }
        else{
          return loginControls(context);
        }

      },
    );
  }

  loggedInUI(GoogleSignInController model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(backgroundImage: Image.network(model.googleAccount!.photoUrl ?? '').image,radius: 50,
        ),
        Text(model.googleAccount!.displayName ?? ''),
        Text(model.googleAccount!.email),
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text("Logout"),
        onPressed: (){
          Provider.of<GoogleSignInController>(context,listen: false).logOut();
        },
        ),
      ],
    );
  }

  loginControls(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1),
            ),
            padding: EdgeInsets.all(10),
          ),
          onPressed: () {

            Provider.of<GoogleSignInController>(context,listen: false).login(context);

          },
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(FontAwesomeIcons.google,color: Colors.indigo.shade400,size: 15,),
              SizedBox(width: 1.5,),
              Text(
                "Google",
                style: GoogleFonts.poppins(color: Colors.black,fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
