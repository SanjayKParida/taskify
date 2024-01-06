import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:taskify/controller/auth_controller.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String buildVersion = '0.0.1';

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Profile Page',
              style: GoogleFonts.ubuntu(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0),
            )),
        body: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                SizedBox(
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage('assets/images/dp.jpg')),
                    )),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'Stephen',
                  style: GoogleFonts.ubuntu(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  'stephen123@gmail.com',
                  style: GoogleFonts.ubuntu(fontSize: 18, color: Colors.black),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: const StadiumBorder()),
                    child: Text(
                      'Update Profile',
                      style: GoogleFonts.ubuntuCondensed(fontSize: 15.0),
                    ),
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: height * 0.1,
                ),

                //MENU
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.25, vertical: height * 0.12),
                  child: GestureDetector(
                    onTap: () => AuthController().logOutUser(),
                    child: Container(
                        padding: const EdgeInsets.all(14.0),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Row(children: [
                            const Icon(
                              IconlyBold.logout,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Logout',
                              style: GoogleFonts.ubuntuCondensed(
                                  fontSize: 15.0, color: Colors.white),
                            )
                          ]),
                        )),
                  ),
                ),
                Text(
                  'Version $buildVersion | By 0_PRTCL',
                  style:
                      GoogleFonts.bebasNeue(color: Colors.grey, fontSize: 12.0),
                )
              ]),
            ),
          ),
        ));
  }
}
