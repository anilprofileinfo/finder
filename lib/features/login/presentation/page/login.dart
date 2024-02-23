import 'package:finder/core/utils/app_colors.dart';
import 'package:finder/core/utils/app_router.dart';
import 'package:finder/features/login/presentation/provider/login_provider.dart';
import 'package:finder/features/login/presentation/widgets/login_input_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginProvider(),
        builder: (context, child) {
          return Consumer<LoginProvider>(builder: (context, data, _) {
            return Scaffold(
              backgroundColor: AppColors.white,
              body: Column(
                children: [
                  ClipPath(  //upper clippath with less height
                    clipper:WaveClipper(), //set our custom wave clipper.
                    child:Container(
                        padding: EdgeInsets.only(bottom: 50),
                        color:AppColors.primaryColorOrange,
                        height:220,
                        alignment: Alignment.center,
                        child: Text("finder",
                            style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 32.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const LoginHeader(),
                        Text(
                          "Sign in",
                          style: TextStyle(fontSize: 24),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 48.0),
                          child: Text("Enter your credential to sign in"),
                        ),
                        const LoginInputFields(),
                        SizedBox(
                          height: 12,
                        ),
                        _forgotPassword(context),
                        _signup(context),
                      ],
                    ),
                  )
                ],
              ),
            );
          });
        });
  }

  _forgotPassword(context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          "Forgot password?",
          style: TextStyle(color: AppColors.primaryColor),
        ),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, signupRoute);
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(color: AppColors.primaryColor),
            ))
      ],
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatelessWidget{
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        *//*appBar: AppBar(
            title:Text("Wave Clipper Design"),
            backgroundColor: Colors.redAccent
        ),*//*
        body:Container(
            child:Stack(children: <Widget>[ //stack overlaps widgets
              Opacity( //semi red clippath with more height and with 0.5 opacity
                opacity: 0.5,
                child: ClipPath(
                  clipper:WaveClipper(), //set our custom wave clipper
                  child:Container(
                    color:Colors.deepOrangeAccent,
                    height:200,
                  ),
                ),
              ),

              ClipPath(  //upper clippath with less height
                clipper:WaveClipper(), //set our custom wave clipper.
                child:Container(
                    padding: EdgeInsets.only(bottom: 50),
                    color:Colors.red,
                    height:180,
                    alignment: Alignment.center,
                    child: Text("Wave clipper", style: TextStyle(
                      fontSize:18, color:Colors.white,
                    ),)
                ),
              ),
            ],)
        )
    );
  }
}*/

//Costom CLipper class with Path
class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    var path = new Path();
    path.lineTo(0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}


/*Container(
                width: 428,
                height: 926,
                child: Stack(children: <Widget>[
                  /*Positioned(
                      top: 863,
                      left: 0,
                      child: Container(
                          width: 428,
                          height: 63,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 122, 47, 1),
                          ))),*/
                  Positioned(
                      top: -113,
                      left: -156,
                      child: Container(
                          width: 510,
                          height: 478,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 122, 47, 1),
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(510, 478)),
                          ))),
                  Positioned(
                      top: -47,
                      left: 214,
                      child: Container(
                          width: 458,
                          height: 400,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(7, 98, 93, 1),
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(458, 400)),
                          ))),
                  Positioned(
                      top: 456,
                      left: 37,
                      child: Transform.rotate(
                        angle: 1.4033419209422001e-14 * (math.pi / 180),
                        child: Divider(
                            color: Color.fromRGBO(138, 135, 135, 1),
                            thickness: 1),
                      )),
                  Positioned(
                      top: 550,
                      left: 37,
                      child: Transform.rotate(
                        angle: 1.4033419209422001e-14 * (math.pi / 180),
                        child: Divider(
                            color: Color.fromRGBO(138, 135, 135, 1),
                            thickness: 1),
                      )),
                  Positioned(
                      top: 422,
                      left: 37,
                      child: Text(
                        'Email',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(105, 102, 102, 1),
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  Positioned(
                      top: 516,
                      left: 37,
                      child: Text(
                        'Password',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(105, 102, 102, 1),
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  Positioned(
                      top: 598,
                      left: 37,
                      child: Container(
                          width: 354,
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(7, 98, 93, 1),
                          ))),
                  Positioned(
                      top: 139,
                      left: 28,
                      child: Text(
                        'Welcome Back',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Roboto',
                            fontSize: 40,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  Positioned(
                      top: 566,
                      left: 37,
                      child: Text(
                        'Forgot Password ?',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(48, 48, 48, 1),
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  Positioned(
                      top: 617,
                      left: 182,
                      child: Text(
                        'SIGN IN',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  Positioned(
                      top: 688,
                      left: 42,
                      child: Container(
                          width: 150,
                          height: 63,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(218, 218, 218, 1),
                          ))),
                  Positioned(
                      top: 688,
                      left: 236,
                      child: Container(
                          width: 150,
                          height: 63,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Color.fromRGBO(229, 229, 229, 1),
                          ))),
                  Positioned(
                      top: 884,
                      left: 89,
                      child: Text(
                        'Don’t have an account?  ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  Positioned(
                      top: 884,
                      left: 279,
                      child: Text(
                        'SIGN UP',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(7, 98, 93, 1),
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                ]),
              ),*/