Design Project

Overview
This project is a part of our final thesis. It utilizes YOLOv8 to detect ingredients from images and provides corresponding recipes. The project is structured into three main components: mobile, server, and vision. Each component plays a crucial role in the overall functionality.

-Table of Contents-
Introduction
Features
Installation
Usage
Project Structure
Technologies Used
Contributing
Acknowledgements

Introduction
In today's fast-paced world, finding recipes based on available ingredients can be time-consuming. Our project aims to simplify this process by using advanced image recognition technology to detect ingredients from photos and suggest recipes. This not only saves time but also helps in reducing food waste.

Features
Ingredient Detection: Uses YOLOv8 for accurate and fast detection of ingredients from images.
Recipe Suggestions: Provides a list of recipes based on detected ingredients.
Mobile Integration: A mobile app for capturing images and displaying results.
Server-Side Processing: A robust backend for processing images and managing data.
Installation
Prerequisites
Node.js and npm
Python 3.x
Java (for Spring Boot)
Angular CLI
Other dependencies as mentioned in the respective sub-projects

How to Use
Open the mobile app and capture an image of the ingredients.
The app sends the image to the server.
The server processes the image using the vision component.
Detected ingredients are returned and displayed on the app.
The app fetches and displays recipes based on the detected ingredients.


Project Structure
design-project/
├── mobile/           # Angular-based mobile app
├── server/           # Spring Boot backend
├── vision/           # Python scripts for YOLOv8 detection
├── .gitignore
└── README.md

Technologies Used
YOLOv8: For image recognition and ingredient detection
Angular: For building the mobile app
Spring Boot: For the backend server
Python: For the vision component

Acknowledgements
We would like to thank our professors, classmates, and all those who supported us throughout this project.
