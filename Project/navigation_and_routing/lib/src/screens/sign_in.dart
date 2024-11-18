// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

class Credentials {
  final String username;
  final String password;

  Credentials(this.username, this.password);
}

class SignInScreen extends StatefulWidget {
  final ValueChanged<Credentials> onSignIn;

  const SignInScreen({
    required this.onSignIn,
    super.key,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Card(
            child: Container(
              constraints: BoxConstraints.loose(const Size(700, 700)),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                
                
                children: [
                  Image.network("https://i.pinimg.com/1200x/90/e0/f9/90e0f94ff0fbcf4cc7131840c4a76141.jpg"),
                
                  Text( "IlliniConnect",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50.0,
                         
                        
                      ),
                  
                      ),
                  
                   TextButton(onPressed: null, 
                    child: const Text(
                      "Get Started!",
                      style: TextStyle(
                        color: Color.fromARGB(255, 12, 4, 130),
                        fontSize: 25.0
                      ),
                    )),
                  
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: TextButton(
                      onPressed: () async {
                        widget.onSignIn(Credentials(
                            _usernameController.value.text,
                            _passwordController.value.text));
                      },
                      child: const Text(
                        'Already a member? Sign in', 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0

                        ),

                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
