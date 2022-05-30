import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/movie.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FocusNode passwordfield = FocusNode();
  final _formkey = GlobalKey<FormState>();

  // Google Sign-in
  final credential = GoogleAuthProvider.credential(idToken: "");

  String password = "";
  String email = "";
  bool hide = true;
  String username1 = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/Login": (context) {
          return const Login();
        },
        "/Signup": (context) => Signup(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      title: "Signup",
      home: Container(
        decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/Images/p2.jpg"),
              fit: BoxFit.cover,
            ),
            color: Colors.yellowAccent,
            border: Border.all(color: Colors.yellowAccent, width: 5)),
        child: Center(
            child: Container(
          color: Colors.black,
          height: 380,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  " MOVIES",
                  style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 30,
                      decoration: TextDecoration.none),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                      child: Form(
                    key: _formkey,
                    child: Container(
                      color: Colors.black,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: TextFormField(
                              onChanged: ((value) => username1 = value),
                              textInputAction: TextInputAction.next,
                              style: TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  fillColor: Colors.yellowAccent,
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  hintText: "Enter Username",
                                  hintStyle: TextStyle(
                                      fontSize: 20.0, color: Colors.black38),
                                  labelText: "Enter Username",
                                  labelStyle: TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.yellowAccent)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.yellowAccent))),
                            ),
                          ),
                          TextFormField(
                            onChanged: ((value) => email = value),
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(passwordfield);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Cannot be empty!";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                errorStyle: TextStyle(
                                  backgroundColor: Colors.black,
                                  color: Colors.yellowAccent,
                                ),
                                fillColor: Colors.yellowAccent,
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.black,
                                ),
                                hintText: "Enter Email id",
                                hintStyle: TextStyle(
                                    fontSize: 20.0, color: Colors.black38),
                                labelText: "Email address",
                                labelStyle: TextStyle(
                                    fontSize: 20.0, color: Colors.black),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.yellowAccent)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.yellowAccent))),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: TextFormField(
                              onChanged: ((value) => password = value),
                              validator: (value) {
                                if (value!.length < 6) {
                                  return "Must be greater than 6 character!";
                                } else {
                                  return null;
                                }
                              },
                              focusNode: passwordfield,
                              obscureText: hide,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                  errorStyle: const TextStyle(
                                    backgroundColor: Colors.black,
                                    color: Colors.yellowAccent,
                                  ),
                                  fillColor: Colors.yellowAccent,
                                  filled: true,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        hide = !hide;
                                      });
                                    },
                                    child: hide
                                        ? const Icon(
                                            Icons.visibility_outlined,
                                            color: Colors.black,
                                          )
                                        : const Icon(
                                            Icons.visibility_off_outlined,
                                            color: Colors.black,
                                          ),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.enhanced_encryption,
                                    color: Colors.black,
                                  ),
                                  hintText: "Enter your password",
                                  hintStyle: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black38,
                                  ),
                                  labelText: "Password",
                                  labelStyle: const TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.yellowAccent)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.yellowAccent))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Forgot Password?",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          color: Colors.yellowAccent)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: GestureDetector(
                      child: const Text("Click Here",
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15,
                              color: Colors.yellowAccent)),
                      onTap: () {},
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () async {
                      Create(email1: email, username: username1);
                      if (_formkey.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homescreen()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            var snackBar = const SnackBar(
                                content: Text('No user found for that email.'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else if (e.code == 'wrong-password') {
                            var snackBar =
                                const SnackBar(content: Text('wrong-password'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellowAccent,
                    ),
                    child:
                        Text("Log In", style: TextStyle(color: Colors.black))),
              ),
              Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/Signup");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellowAccent,
                      ),
                      child: Text("Create a New Acoount",
                          style: TextStyle(color: Colors.black))),
                );
              }),
              GestureDetector(
                child: Text("Sign in with google",
                    style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15,
                        decoration: TextDecoration.none)),
                onTap: () async {
                  // try {
                  //   final userCredential = await FirebaseAuth
                  //       .instance.currentUser
                  //       ?.linkWithCredential(credential);
                  // } on FirebaseAuthException catch (e) {
                  //   switch (e.code) {
                  //     case "provider-already-linked":
                  //       var snackBar = const SnackBar(
                  //           content: Text(
                  //               'The provider has already been linked to the user.'));
                  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //       print(
                  //           "The provider has already been linked to the user.");
                  //       break;
                  //     case "invalid-credential":
                  //       var snackBar = const SnackBar(
                  //           content: Text(
                  //               "The provider's credential is not valid."));
                  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //       print("The provider's credential is not valid.");
                  //       break;
                  //     case "credential-already-in-use":
                  //       var snackBar = const SnackBar(
                  //           content: Text(
                  //               'The account corresponding to the credential already exists'));
                  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //       print(
                  //           "The account corresponding to the credential already exists, "
                  //           "or is already linked to a Firebase User.");
                  //       break;
                  //     // See the API reference for the full list of error codes.
                  //     default:
                  //       var snackBar =
                  //           const SnackBar(content: Text('Unknown error.'));
                  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  //       print("Unknown error.");
                  //   }
                  // }
                  // ;
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final FocusNode passwordfield = FocusNode();

  final FocusNode confirmpasswordfield = FocusNode();
  final _formkey = GlobalKey<FormState>();
  bool hide1 = true;
  bool hide2 = true;
  String email = "";
  String password = "";
  var confirmpass;
  String username1 = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      title: "Signup",
      home: Container(
        decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("images/p2.jpg"),
              fit: BoxFit.cover,
            ),
            color: Colors.yellowAccent,
            border: Border.all(color: Colors.yellowAccent, width: 5)),
        child: Center(
            child: Container(
          color: Colors.black,
          height: 500,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 30,
                      decoration: TextDecoration.none),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  child: Form(
                    key: _formkey,
                    child: TextFormField(
                      onChanged: ((value) => email = value),
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(passwordfield);
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.yellowAccent,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.black,
                          ),
                          hintText: "Enter Email id",
                          hintStyle:
                              TextStyle(fontSize: 20.0, color: Colors.black38),
                          labelText: "Email address",
                          labelStyle:
                              TextStyle(fontSize: 20.0, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.yellowAccent)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.yellowAccent))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  child: Form(
                    child: TextFormField(
                      onChanged: ((value) => username1 = value),
                      textInputAction: TextInputAction.next,
                      style: TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.yellowAccent,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          hintText: "Enter Username",
                          hintStyle:
                              TextStyle(fontSize: 20.0, color: Colors.black38),
                          labelText: "Enter Username",
                          labelStyle:
                              TextStyle(fontSize: 20.0, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.yellowAccent)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.yellowAccent))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  child: Form(
                    child: TextFormField(
                      onChanged: ((value) => password = value),
                      validator: (value1) {
                        confirmpass = value1;
                        if (value1!.length < 6) {
                          return "Must be greater than 6 character!";
                        } else {
                          return null;
                        }
                      },
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(confirmpasswordfield);
                      },
                      focusNode: passwordfield,
                      obscureText: hide1,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.yellowAccent,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.enhanced_encryption,
                            color: Colors.black,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                hide1 = !hide1;
                              });
                            },
                            child: hide1
                                ? const Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility_off_outlined,
                                    color: Colors.black,
                                  ),
                          ),
                          hintText: "Enter your password",
                          hintStyle: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black38,
                          ),
                          labelText: "Password",
                          labelStyle: const TextStyle(
                              fontSize: 20.0, color: Colors.black),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.yellowAccent)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.yellowAccent))),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  child: Form(
                    child: TextFormField(
                      validator: (value) {
                        if (value != confirmpass) {
                          return "Password dosen't match";
                        } else {
                          return null;
                        }
                      },
                      focusNode: confirmpasswordfield,
                      obscureText: hide2,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Colors.yellowAccent,
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.enhanced_encryption,
                            color: Colors.black,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                hide2 = !hide2;
                              });
                            },
                            child: hide2
                                ? const Icon(
                                    Icons.visibility_outlined,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility_off_outlined,
                                    color: Colors.black,
                                  ),
                          ),
                          hintText: "Retype password",
                          hintStyle: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black38,
                          ),
                          labelText: "Confirm Password",
                          labelStyle: const TextStyle(
                              fontSize: 20.0, color: Colors.black),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.yellowAccent)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.yellowAccent))),
                    ),
                  ),
                ),
              ),
              Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        Create(email1: email, username: username1);
                        if (_formkey.currentState!.validate()) {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                                    email: email, password: password);
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homescreen()));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              var snackBar = const SnackBar(
                                  content: Text(
                                      'The password provided is too weak'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              var snackBar = const SnackBar(
                                  content: Text(
                                      'The account already exists for that email.'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              print(
                                  'The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellowAccent,
                      ),
                      child: const Text("Sign up",
                          style: TextStyle(color: Colors.black))),
                );
              }),
              Builder(builder: (context) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellowAccent,
                        ),
                        child: Text("Go back to login page",
                            style: TextStyle(color: Colors.black))));
              })
            ],
          ),
        )),
      ),
    );
  }
}

Create({
  required email1,
  required username,
}) async {
  await FirebaseFirestore.instance.collection("Movieapp").doc("users").set({
    "username": username,
    "email": email1,
  });
  print("database created");
}
