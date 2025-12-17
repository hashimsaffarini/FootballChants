<div align="center">
  <a href="#">
    <img src="https://github.com/hashimsaffarini/FootballChants/blob/main/FootballChants/Assets.xcassets/football.imageset/football.png?raw=1" alt="App Logo" width="160" height="160" style="border-radius: 35px;">
  </a>  

# ⚽ Football Chants – iOS Native App  

A modern, high-performance football fans application built using **Swift** and **UIKit**. Moving beyond Storyboards, this project implements a full **Programmatic UI** approach combined with the **MVVM Architecture** to ensure scalability, maintainability, and smooth user experience.

---

<div align="start">

## 🏗️ Architecture & System Design
The project is structured using the **MVVM (Model-View-ViewModel)** pattern, separating business logic from UI components for cleaner code and better testability.

### 📂 Directory Structure
- **Core (Controllers):** Managing the lifecycle of views (`TeamsVC`, `PlayersVC`, `FavoritesVC`).
- **ViewModels:** Handling data preparation and business rules (The "Brain" of the app).
- **Models:** Defining data structures for `Team` and `Player` objects.
- **Managers:** Centralized services like `FavoritesManager` and `NotificationCenter` extensions.
- **Views:** Reusable custom UI components and cells built entirely in code.
- **Resources:** Managing assets, colors, and localizations.

---

## 🚀 Key Technical Features
- **Programmatic UI**: 100% built with code using **Auto Layout** (No Storyboards/XIBs).
- **Advanced CollectionViews**: Utilizing `UICollectionViewDiffableDataSource` for efficient, crash-free data management and native animations.
- **Optimized Image Caching**: Integrated **Kingfisher** with `DownsamplingImageProcessor` and shadow rasterization to maintain a buttery-smooth **60 FPS scrolling**.
- **Local Persistence**: Custom management for favorite players using lightweight local storage.
- **Reactive UI Updates**: Leveraging `NotificationCenter` to synchronize state across multiple tabs (e.g., updating Favorites when a player is added).
- **Audio Integration**: Seamlessly playing team chants using **AVFoundation**.

---

## 📱 App Preview

### 🏟️ Explore Teams & Chants
Browse through legendary football clubs and feel the stadium atmosphere with high-quality chants.

| Team List | Audio Player |
|:----------:|:------------:|
| <img width="320" src="https://github.com/hashimsaffarini/FootballChants/blob/main/FootballChants/Assets.xcassets/team.imageset/team.png?raw=1" /> | <img width="320" src="https://github.com/hashimsaffarini/FootballChants/blob/main/FootballChants/Assets.xcassets/youtubeLink.imageset/youtubeLink.png?raw=1" /> |

---

### 🏃‍♂️ Squads & Personal Favorites
Modern grid layouts to view player details and manage your personal favorite squad.

| Player Squad | Favorite Players |
|:------------:|:----------------:|
| <img width="320" src="https://github.com/hashimsaffarini/FootballChants/blob/main/FootballChants/Assets.xcassets/players.imageset/players.png?raw=1" /> | <img width="320" src="https://github.com/hashimsaffarini/FootballChants/blob/main/FootballChants/Assets.xcassets/favorites.imageset/favorites.png?raw=1" /> |

---

## 🛠️ Installation
1. Clone the repo:
   ```bash
   git clone [https://github.com/hashimsaffarini/FootballChants.git](https://github.com/hashimsaffarini/FootballChants.git)
