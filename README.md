# Real Estate Management System

A full-stack web application for managing commercial real estate properties, built with Spring Boot.

**Live Demo:** [https://real-estate-management-web-production.up.railway.app/trang-chu](https://real-estate-management-web-production.up.railway.app/trang-chu)

## Tech Stack

### Backend
- **Framework:** Spring Boot 2.x
- **Language:** Java 8
- **Database:** MySQL 8.0
- **ORM:** Spring Data JPA / Hibernate
- **Security:** Spring Security + JWT (stateless authentication)
- **API:** RESTful endpoints
- **Real-time:** WebSocket (STOMP)
- **Build:** Maven

### Frontend
- JSP / JSTL with SiteMesh decorators
- Bootstrap, jQuery, AJAX

## Architecture

```
├── api/                  # REST controllers
│   ├── admin/            # Admin-only endpoints
│   │   ├── BuildingAPI
│   │   ├── CustomerAPI
│   │   ├── TransactionAPI
│   │   └── UserAPI
│   └── web/              # Public endpoints
├── controller/           # MVC controllers
├── entity/               # JPA entities
├── repository/           # Data access layer
│   └── custom/           # Custom query implementations
├── service/              # Business logic
├── security/             # JWT filter, handlers
├── config/               # App configuration
└── converter/            # DTO ↔ Entity mappers
```

## Core Features

### Building Management
- CRUD operations for commercial buildings
- Multi-criteria search (name, district, area, price, orientation, etc.)
- Image upload with Base64 encoding
- Server-side pagination

### Customer Management
- Customer information tracking
- Transaction history per customer
- Status management (active, pending, closed)

### User & Authorization
- Role-based access control (ADMIN, MANAGER, STAFF)
- Building-to-staff assignment (Many-to-Many)
- Staff can only access assigned buildings

### Security
- JWT-based stateless authentication
- BCrypt password encryption
- Session management with cookie tracking
- Role-based endpoint protection

### Real-time Notifications
- WebSocket integration for live updates
- Notification persistence

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/building` | List buildings with filters |
| POST | `/api/building` | Create building |
| PUT | `/api/building/{id}` | Update building |
| DELETE | `/api/building` | Delete buildings |
| GET | `/api/building/{id}/staffs` | Get assigned staff |
| POST | `/api/building/assignment` | Assign staff to building |
| GET | `/api/customer` | List customers |
| POST | `/api/customer` | Create customer |
| PUT | `/api/customer/{id}` | Update customer |
| DELETE | `/api/customer` | Delete customers |
| POST | `/api/transaction` | Create transaction |

## Database Schema

**Entities:**
- `BuildingEntity` - Property details, rent areas, types
- `CustomerEntity` - Customer information
- `UserEntity` - System users
- `RoleEntity` - User roles
- `TransactionEntity` - Customer transactions
- `RentAreaEntity` - Building rent areas
- `NotificationEntity` - System notifications

## Setup

### Requirements
- JDK 8+
- Maven
- MySQL Server

### Configuration
Set environment variables:
```
DB_HOST=localhost
DB_PORT=3306
DB_NAME=estateadvance
DB_USERNAME=root
DB_PASSWORD=your_password
JWT_SECRET=your_secret_key
```

### Run
```bash
mvn spring-boot:run
```

## Deployment

Deployed on Railway with:
- MySQL database service
- Environment-based configuration
- Automatic builds from GitHub

## License

MIT
