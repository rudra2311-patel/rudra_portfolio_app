import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_app/models/app_model.dart';
import 'package:portfolio_app/models/color_model.dart';
import 'package:portfolio_app/models/device_model.dart';
import 'package:portfolio_app/screen/miniProjects/education/education.dart';
import 'package:portfolio_app/screen/miniProjects/experience/experience.dart';

import '../models/experience_model.dart';
import '../models/skill_model.dart';
import '../screen/miniProjects/about/about.dart';
import '../screen/miniProjects/skills/skills.dart';

const double baseHeight = 790;
const double baseWidth = 1440;

List<DeviceModel> devices = [
  DeviceModel(
    device: Devices.android.onePlus8Pro,
    icon: Icons.android,
  ),
  DeviceModel(
    device: Devices.ios.iPhone13,
    icon: Icons.apple,
  ),
  DeviceModel(
    device: Devices.ios.iPad,
    icon: Icons.tablet,
  ),
];

List<ColorModel> colorPalette = [
  ColorModel(
    svgPath: "assets/images/cloudRed.svg",
    color: Colors.yellowAccent,
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      // transform: Grad,
      end: Alignment.topRight,
      colors: [Colors.yellowAccent, Colors.deepOrange],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.blue,
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      colors: [Colors.blue, Colors.black45],
    ),
  ),
  ColorModel(
      svgPath: "assets/images/cloudyBlue.svg",
      color: const Color(0xff00d6ca),
      gradient: const LinearGradient(
        colors: [Color(0xff00ebd5), Color(0xff293474)],
        stops: [0, 1],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      )),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xff123cd1),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(-0.31, 0.95),
      colors: [Color(0xFF1042F4), Color(0x00203EA6)],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: Colors.purple,
    gradient: const LinearGradient(
      colors: [Color(0xffc95edb), Colors.black12],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xfff35a32),
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.indigo, Colors.deepOrange], // Adjust colors as needed
    ),
  ),
];

List<AppModel> apps = [
  AppModel(
      title: "About",
      color: Colors.white,
      icon: Icons.person,
      screen: const AboutMe()),
  AppModel(
      title: "Skills",
      color: Colors.white,
      icon: Icons.ac_unit_rounded,
      screen: const Skills()),
  AppModel(
    title: "Resume",
    color: Colors.white,
    icon: Icons.description, // ✅ inbuilt icon instead of youtube.svg
    link: resume,
  ),
  AppModel(
    title: "LinkedIn",
    assetPath: "assets/icons/linkedin.svg",
    color: Colors.white,
    link: linkedIn,
  ),
  AppModel(
    title: "CodeForces",
    assetPath: "assets/icons/download.svg",
    color: Colors.white,
    link: codeforces,
  ),
  AppModel(
    title: "LeetCode",
    assetPath: "assets/icons/leetcode.svg",
    color: Colors.white,
    link: leetcode,
  ),
  AppModel(
    title: "Achievements",
    color: Colors.white,
    icon: FontAwesomeIcons.trophy, // Updated icon
    screen: const Experience(),
  ),
  AppModel(
    title: "Education",
    color: Colors.white,
    icon: Icons.school, // 🎓 better icon for education
    screen: const Education(),
  ),
  AppModel(
    title: "Github",
    assetPath: "assets/icons/github.svg",
    color: Colors.white,
    link: github,
  ),
  AppModel(
    title: "Email",
    assetPath: "assets/icons/Gmail_Logo.svg",
    color: Colors.white,
    link: playApps,
  ),
];

final List<JobExperience> education = [
  JobExperience(
    color: Colors.red,
    location: "Gujrat, India",
    title: 'Computer Science and  Engineering',
    company: 'Indian Institute of Information and Technology Vadodara(IIITV)',
    startDate: '2022',
    endDate: 'Present',
    bulletPoints: [
      "Currently in the final year of my college!",
    ],
  ),
  JobExperience(
    color: Colors.blue,
    location: "Vadodara Gujrat, India",
    title: 'Higher Secondary School',
    company: 'Parth Institute ',
    startDate: 'June 2019',
    endDate: 'June 2022',
    bulletPoints: [
      'Some of the best years of my school life',
    ],
  ),
];
final List<JobExperience> jobExperiences = [
  JobExperience(
    color: Colors.deepPurple,
    location: "Peer-Reviewed International Conference",
    title: 'Research Paper Publication',
    company: 'ICVARS 2025',
    startDate: 'Accepted',
    endDate: '2025',
    bulletPoints: [
      "Authored the accepted research paper 'Mixed Reality LEGO vs. Physical LEGO: Cognitive, Emotional, and Motor Advantages'.",
      "Accepted for presentation at the 9th International Conference on Intelligent Computing and Virtual & Augmented Reality Simulations.",
      "Conducted hands-on experiments in a university metaverse lab, analyzing cognitive and emotional benefits.",
      "Paper to be published in the official IEEE Xplore post-conference proceedings.",
    ],
  ),
  JobExperience(
    color: Colors.blueAccent,
    location: "IIITV",
    title: 'Project & Competition Achievements',
    company: 'College Achievements',
    startDate: '',
    endDate: '',
    bulletPoints: [
      "Top 5 Finalist in a VR Project competition at IIITV, receiving a Rs. 5,000 grant for further research.",
      "Secured 5th rank in the competitive Mathematics event (Enigma) at IIITV.",
    ],
  ),
  JobExperience(
    color: Colors.orangeAccent,
    location: "IIITV Chapter",
    title: 'Leadership & Community Engagement',
    company: 'Microsoft Learn Student Ambassador',
    startDate: '',
    endDate: '',
    bulletPoints: [
      "Served as Marketing Lead, executing a digital marketing campaign that increased student engagement by 60%.",
      "Organized the Annual Gaming Fest (Arcadia), attracting over 200 student participants.",
      "Core Member of the College Gaming Club, responsible for organizing tournaments for 150+ participants.",
    ],
  ),
];

const String resume =
    "https://drive.google.com/file/d/1nmWHnTMTUSv4haJoPzJ31j3CzUQ1PWLf/view?usp=sharing";
const String linkedIn = "https://www.linkedin.com/in/rudra-patel-32859425b/";
const String github = "https://github.com/rudra2311-patel";
const String codeforces = "https://codeforces.com/profile/RuDrA1e3";
const String resumeLink =
    "https://drive.google.com/file/d/1LO3Km6fFkJVW92MNXRLSYl--E9YlTHJd/view";
const String email = "rudrawillofd@gmail.com";
const String leetcode = "https://leetcode.com/u/K2HtnEmE3O/";
String introduction =
    "Welcome to my portfolio website — a little corner of the internet where I build, break, and rebuild things (sometimes intentionally 😅).\n\n"
    "I am a Developer with a strong focus on Flutter and a never-ending love for problem-solving. Whether it’s fixing a tricky bug, finding the most efficient way to write code, or cracking a tough chess puzzle, I enjoy challenges that make me think differently. My curiosity often leads me down rabbit holes of figuring out how things actually work under the hood — from apps to algorithms.\n\n"
    "When I’m not coding, you’ll probably find me watching a good series, exploring random tech stuff, or staring at a chessboard trying to outsmart myself.";

const String playApps =
    "https://play.google.com/store/apps/developer?id=AppyMonk";

List<SkillsModel> skills = [
  SkillsModel(skillName: "Flutter", colorS: Colors.blue, iconPath: "random"),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Github",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Dart",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Provider",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Riverpod",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "CI/CD",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Code Magic",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "REST API",
    colorS: Colors.yellow,
  ),
];

List<SkillsModel> languages = [
  SkillsModel(skillName: "Gujarati", colorS: Colors.orange),
  SkillsModel(skillName: "Hindi", colorS: Colors.black),
  SkillsModel(skillName: "English", colorS: Colors.blueGrey),
];
