# 🏠 Real Estate Management System

A web application for managing buildings, rental offices, and staff assignments, built with **Spring Boot** and **Bootstrap**.

## 📖 Introduction
This project is a real estate management system that allows administrators and staff to manage building information. The system supports advanced search, CRUD operations for buildings, image uploads, and staff assignments. It follows the **MVC architecture**, uses **RESTful APIs**, and communicates between client and server via **AJAX**.

## 🚀 Features

### 1. Building Management
- **Advanced Search**: Search buildings by multiple criteria (Name, District, Area, Rental Price, Basement count, Orientation, etc.).
- **CRUD Operations**: Add, update, and delete buildings.
- **Image Handling**: Upload building avatars (Base64 processing and file storage).
- **Pagination**: Server-side pagination for optimized performance.

### 2. Staff Management & Authorization
- **Role-based Security**:
  - **ADMIN/MANAGER**: Full permissions to add, edit, delete, and assign buildings.
  - **STAFF**: View and manage only assigned buildings.
- **Assignments**: Admin can assign one or multiple buildings to staff (Many-to-Many relationship).

### 3. Security
- Login/Logout functionality.
- Password encryption with **BCrypt**.
- Authentication & Authorization using **Spring Security**.
- (Optional) Stateless authentication with **JWT (JSON Web Token)**.

## 🛠️ Tech Stack

### Backend
- **Language**: Java 17 (or Java 8 if preferred)
- **Framework**: Spring Boot 2.x
- **Database**: MySQL
- **ORM**: Spring Data JPA / Hibernate
- **Security**: Spring Security
- **Build Tool**: Maven

### Frontend
- **View Engine**: JSP / JSTL
- **Framework**: Bootstrap 3 (Responsive Design)
- **Scripting**: JavaScript, jQuery
- **Communication**: AJAX (REST API calls)

## ⚙️ Installation & Setup

### Requirements
- Java Development Kit (JDK) 8 or 17
- Maven
- MySQL Server

  
