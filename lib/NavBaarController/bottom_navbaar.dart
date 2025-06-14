import 'package:flutter/material.dart';
import 'package:mr_pritam_client_app/NavBaarController/home.dart';
import 'package:mr_pritam_client_app/NavBaarController/mission.dart';
import 'package:mr_pritam_client_app/NavBaarController/profile.dart';
import 'package:mr_pritam_client_app/NavBaarController/tickting.dart';
import 'package:mr_pritam_client_app/Screens/ad_detail_screen.dart';
import 'package:mr_pritam_client_app/api_client.dart';
import 'package:mr_pritam_client_app/models/mission_model.dart';

class BottomNavbaar extends StatefulWidget {
  const BottomNavbaar({super.key});

  @override
  State<BottomNavbaar> createState() => _BottomNavbaarState();
}

class _BottomNavbaarState extends State<BottomNavbaar> {
  Map<String, dynamic>? userData;
  Map<String, dynamic>? adData;
  List<MissionModel>? missionData;

  @override
  void initState() {
    super.initState();
    loadHomeData();
  }

  void loadHomeData() async {
    final data = await ApiService.getMyDetails();
    final adDatas = await ApiService.getAdData();
    final missionDatas = await ApiService.getAllPreviousMission();
    print("missionDatas: $missionDatas");
    setState(() {
      userData = data;
      adData = adDatas;
      missionData = missionDatas;
    });

    if (userData != null) {
      debugPrint(
          "User Name: ${userData?['firstName']} ${userData?['lastName']}");
    } else {
      debugPrint("Failed to load user details");
    }
  }

  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screen = [
      const HomeScreen(),
      AdDetailScreen(
        adData: adData ?? {},
      ),
      MissionScreen(
        missionData: missionData ?? [],
      ),
      const TicketingScreen(),
      ProfileScreen(data: userData ?? {}),
    ];
    return userData == null
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  splashFactory: NoSplash.splashFactory,
                ),
                child: BottomNavigationBar(
                  currentIndex: screenIndex,
                  selectedItemColor: const Color(0xffF5A302),
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Colors.white,
                  onTap: (index) {
                    setState(() {
                      screenIndex = index;
                    });
                  },
                  type: BottomNavigationBarType.fixed,
                  elevation: 2,
                  items: [
                    BottomNavigationBarItem(
                        icon: Image.asset(
                          "assets/images/home_icon.png",
                          height: 30,
                          width: 30,
                          color: Colors.grey,
                        ),
                        label: "Home",
                        activeIcon: const Icon(
                          Icons.home,
                          size: 45,
                          color: Color(0xffF5A302),
                        )),
                    BottomNavigationBarItem(
                      icon: const Icon(
                        Icons.ad_units_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
                      label: "Advertisement",
                      activeIcon: Image.asset(
                        "assets/images/office1.png",
                        height: 55,
                        width: 55,
                        color: const Color(0xffF5A302),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(
                        "assets/images/office.png",
                        height: 30,
                        width: 30,
                        color: Colors.grey,
                      ),
                      label: "Mission",
                      activeIcon: Image.asset(
                        "assets/images/office1.png",
                        height: 55,
                        width: 55,
                        color: const Color(0xffF5A302),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset("assets/images/chat.png",
                          height: 35, width: 35, color: Colors.grey),
                      label: "Ticketing",
                      activeIcon: Image.asset(
                        "assets/images/chat1.png",
                        height: 55,
                        width: 55,
                        color: const Color(0xffF5A302),
                      ),
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset("assets/images/profile.png",
                          height: 35, width: 35, color: Colors.grey),
                      label: "profile",
                      activeIcon: Image.asset(
                        "assets/images/profile1.png",
                        height: 55,
                        width: 55,
                        color: const Color(0xffF5A302),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: screen[screenIndex],
          );
  }
}
