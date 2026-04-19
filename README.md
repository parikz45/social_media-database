# Social Media Database System (PostgreSQL)

## 📌 Overview
This project implements a relational database schema for a social media application using PostgreSQL. It models core features such as users, posts, conversations, messages, and notifications.

## 🧠 Key Features
- User management with profile data and relationships
- Post creation and engagement tracking (likes)
- Real-time messaging structure with conversations and replies
- Notification system for interactions (likes, messages, etc.)

## 🏗️ Database Design
The schema is normalized and uses:
- Primary and foreign key constraints
- Self-referencing relationships (message replies)
- Array fields for lightweight relationship handling (followers, likes)

## ⚙️ Technologies
- PostgreSQL
- SQL (DDL & DML)

## 📊 Queries Implemented
The project includes queries demonstrating:
- JOIN operations
- Aggregations (COUNT, AVG)
- Filtering and sorting
- Array operations
- Subqueries and analytics

## 🚀 How to Run

### 1. Create Database

```sql
CREATE DATABASE social_db;
```

### 2. Run Schema:
```sql
psql -d social_db -f schema.sql
```

### 3. Run Queries:
```sql
psql -d social_db -f queries.sql
```

---

## ⚠️ Important Notes

```markdown
> Make sure PostgreSQL is installed and `psql` is available in your system path.

> Replace `postgres` with your username if different.
