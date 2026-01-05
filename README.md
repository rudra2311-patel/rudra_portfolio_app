# 🚀 Rudra Patel - Portfolio

> A modern, interactive Flutter portfolio showcasing my projects, skills, and experience with dynamic day/night themes and smooth animations.

**Live Site:** [rudrabuilds.me](https://rudrabuilds.me)

---

## 📸 Screenshots

<!-- Add your portfolio screenshots here -->
<div align="center">
  <img src="" alt="Portfolio Home" width="800"/>
  <p><i>Interactive portfolio with dynamic theme switching</i></p>
</div>

<div align="center">
  <img src="" alt="Projects Section" width="800"/>
  <p><i>Featured projects with detailed information</i></p>
</div>

---

## ✨ Features

### 🎨 **Dynamic UI**
- **Auto Day/Night Mode** - Automatically switches theme based on time
- **Smooth Animations** - Rive animations and Flutter Animate transitions
- **Responsive Design** - Optimized for all screen sizes (mobile, tablet, desktop)
- **Device Previews** - Interactive device frames showcasing mobile apps

### 🛠️ **Project Showcase**
- **PhytoLens** - Offline-first AI plant disease detection app
  - Detailed engineering landing page: [View Project Site]()
  - 98% accuracy with 14ms inference time
  - 22 Indian languages support
  - FastAPI + PostgreSQL backend
- **[Other Projects]** - Add your other featured projects

### 📱 **Sections**
- 🏠 **About** - Introduction and profile
- 💼 **Experience** - Work history and achievements
- 🎓 **Education** - Academic background
- 🛠️ **Skills** - Technical expertise with visual indicators
- 📂 **Projects** - Detailed project showcases
- 📧 **Contact** - Get in touch links

---

## 🛠️ Tech Stack

### **Frontend**
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

### **Deployment**
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)

### **Key Packages**
- `flutter_svg` - SVG rendering
- `rive` - Interactive animations
- `flutter_animate` - Smooth transitions
- `device_frame` - Device mockups
- `google_fonts` - Typography
- `provider` - State management
- `url_launcher` - External links

---

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (>=3.3.0)
- Dart SDK
- Firebase CLI (for deployment)

### Installation

```bash
# Clone the repository
git clone https://github.com/rudra2311-patel/rudra_portfolio_app.git

# Navigate to project
cd rudra_portfolio_app

# Install dependencies
flutter pub get

# Run the app
flutter run -d chrome
```

### Build for Web

```bash
# Build for production
flutter build web --release

# Output will be in build/web/
```

---

## 📁 Project Structure

```
portfolio_app/
├── lib/
│   ├── consts/
│   │   └── data.dart          # Portfolio data (projects, skills, experience)
│   ├── models/                # Data models
│   ├── providers/             # State management
│   ├── screen/                # UI screens
│   │   └── miniProjects/      # Section components
│   └── widgets/               # Reusable widgets
├── assets/
│   ├── icons/                 # Project icons & logos
│   ├── images/                # UI images
│   ├── rive/                  # Animation files
│   └── phytolens/            # PhytoLens project assets
├── webpateofproject/          # PhytoLens Engineering Landing Page
│   ├── index.html            # Main HTML
│   ├── css/                  # Stylesheets
│   ├── js/                   # JavaScript
│   └── assets/               # Screenshots & diagrams
└── web/                       # Flutter web config
```

---

## 🎨 Features Highlights

### Auto Theme Switching
Automatically changes between day and night themes based on system time (6 AM - 6 PM = Day Mode).

### Interactive Animations
- Rive animations for profile avatar
- Smooth page transitions
- Hover effects on project cards
- Animated skill progress indicators

### Project Deep Dives
Each project includes:
- Detailed description
- Tech stack badges
- Live demo links
- GitHub repository links
- Architecture diagrams (where applicable)

---

## 🌐 Featured Project: PhytoLens

A standalone engineering landing page showcasing the complete architecture and features of the PhytoLens plant disease detection system.

**Features:**
- 25 app screenshots organized into 7 categories
- 16 technical architecture diagrams
- Interactive image gallery with modal lightbox
- Detailed microservices architecture breakdown
- Dark theme with emerald green accents

**View:** [PhytoLens Engineering Guide]()

---

## 📊 Analytics

Integrated with **Google Analytics** for tracking site performance and visitor insights.

---

## 🚢 Deployment

The portfolio is automatically deployed to Firebase Hosting via GitHub Actions on every push to the `main` branch.

### Deployment Workflow
1. Push changes to GitHub
2. GitHub Actions triggers automatically
3. Flutter builds web app
4. Deploys to Firebase Hosting
5. Live at [rudrabuilds.me](https://rudrabuilds.me)

---

## 📝 Customization

To customize for your own portfolio:

1. **Update Personal Info**: Edit `lib/consts/data.dart`
2. **Add Projects**: Add to `List<AppModel> apps` in `data.dart`
3. **Update Skills**: Modify `List<SkillModel> skills`
4. **Change Colors**: Edit `List<ColorModel> colorPalette`
5. **Add Assets**: Place images in `assets/` folders
6. **Update Resume**: Replace resume link in contact section

---

## 📬 Connect with Me

- 🌐 **Portfolio:** [rudrabuilds.me](https://rudrabuilds.me)
- 💼 **LinkedIn:** [rudra-patel](https://www.linkedin.com/in/rudra-patel-32859425b/)
- 💻 **GitHub:** [@rudra2311-patel](https://github.com/rudra2311-patel)
- 📧 **Email:** rudrawillofd@gmail.com

---

## 📄 License

This project is open source and available for reference. Feel free to use it as inspiration for your own portfolio!

---

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for hosting and analytics
- Rive community for animation assets
- Open source contributors

---

<div align="center">
  <p>Made with ❤️ using Flutter</p>
  <p>© 2026 Rudra Patel. All rights reserved.</p>
</div>
