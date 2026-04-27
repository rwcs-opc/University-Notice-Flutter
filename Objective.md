# University Notice Management System
Build a **complete production-ready Flutter application** named **University Notice Management System** with **Flutter (latest stable)** for frontend and **Laravel REST API + MySQL** for backend.

## Core Objective

Create a secure centralized platform where universities can publish, manage, and distribute notices digitally. Users can register/login, view notices by category, receive alerts, and admins can manage notices through role-based dashboards.

---

# Tech Stack

## Frontend

* Flutter (Android + iOS + Web ready)
* Riverpod / Provider for state management
* Dio / HTTP for API integration
* GoRouter for navigation
* SharedPreferences / Secure Storage for auth tokens
* Responsive modern Material 3 UI

## Backend

* Laravel latest version
* REST API with Sanctum / JWT Authentication
* MySQL database
* Role-based access control

---

# User Roles

## 1. Student / User

* Register account
* Login / Logout
* Forgot password
* Update profile
* View notices
* Filter notices by:

  * Department
  * Category
  * Date
  * Priority
* Download PDF notices
* Bookmark notices
* Receive push notifications
* Search notices
* Dark mode

## 2. Admin

* Admin login
* Publish notices
* Edit / Delete notices
* Manage categories
* Upload PDF/image attachments
* Manage departments
* View analytics
* Approve notices before publish

## 3. Super Admin

* Super admin login
* Manage all admins
* Manage university settings
* Manage users
* Global reports
* Role assignment
* Access logs
* Backup system

---

# Notice Categories

Create dynamic category management:

* Academic
* Examination
* Admission
* Scholarship
* Hostel
* Placement
* Events
* Circular
* Emergency
* Others

Admin can add/edit/delete categories.

---

# Flutter Screens Required

## Public Screens

1. Splash Screen
2. Onboarding
3. Login
4. Register
5. Forgot Password

## User Screens

6. Home Dashboard
7. Notice Feed
8. Notice Detail
9. Search Notice
10. Categories Screen
11. Saved Notices
12. Notifications Screen
13. Profile Screen
14. Settings

## Admin Screens

15. Admin Dashboard
16. Create Notice
17. Edit Notice
18. Category Management
19. Department Management
20. User Management

## Super Admin Screens

21. Super Admin Dashboard
22. Admin Management
23. System Reports
24. App Settings

---

# UI Requirements

Create beautiful modern UI:

* University theme colors
* Responsive for mobile/tablet/web
* Clean cards for notices
* Notice badges:

  * Urgent
  * New
  * Expiring Soon
* Drawer navigation
* Bottom navigation
* Smooth animations
* Charts in admin dashboard

---

# Notice Card Must Show

* Title
* Category
* Department
* Publish date
* Short description
* Attachment icon
* Priority badge
* View count

---

# Backend API Modules

## Authentication APIs

POST /register
POST /login
POST /logout
POST /forgot-password

## Notice APIs

GET /notices
GET /notices/{id}
POST /notices
PUT /notices/{id}
DELETE /notices/{id}

## Category APIs

GET /categories
POST /categories
PUT /categories/{id}
DELETE /categories/{id}

## User Management APIs

GET /users
PUT /users/{id}
DELETE /users/{id}

## Admin APIs

GET /dashboard/stats

---

# Database Tables

## users

* id
* name
* email
* phone
* password
* role

## notices

* id
* title
* description
* category_id
* department_id
* attachment
* priority
* published_by
* publish_date
* expiry_date
* views

## categories

* id
* name

## departments

* id
* name

## bookmarks

* id
* user_id
* notice_id

---

# Security Features

* JWT / Sanctum auth
* Role-based middleware
* SQL injection prevention
* File upload validation
* API rate limit
* Secure token storage in Flutter
* Admin access restrictions

---

# Advanced Features

* Push notifications (Firebase)
* PDF viewer in app
* Export notices to PDF
* Analytics dashboard
* Multi-language support
* Offline cached notices
* Real-time updates
* Notice expiry auto hide

---

# Folder Structure (Flutter)

lib/
├── core/
├── models/
├── services/
├── providers/
├── screens/
├── widgets/
├── routes/
└── main.dart

---

# Deliverables

Generate full source code with:

1. Flutter frontend complete
2. Laravel backend complete
3. SQL database schema
4. API integration
5. Responsive UI
6. Clean code architecture
7. README setup guide

---

# Git commands
