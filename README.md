# 📶 WiFi Brand Analysis MySQL Project

## 📘 Overview
The **WiFi Brand Analysis** project is an SQL-based analytical system that evaluates WiFi router brands, their performance, sales, and pricing trends.  
It provides insights into **brand popularity, product ratings, speed-to-price value,** and **market distribution**.

---

## 🏗️ Database Schema

### 1. `wifi_brands`
| Column | Type | Description |
|---------|------|-------------|
| brand_id | INT | Primary key, auto-increment |
| brand_name | VARCHAR(50) | Brand name (e.g., TP-Link, Netgear) |
| country | VARCHAR(50) | Country of origin |

### 2. `wifi_models`
| Column | Type | Description |
|---------|------|-------------|
| model_id | INT | Primary key, auto-increment |
| brand_id | INT | Foreign key referencing `wifi_brands(brand_id)` |
| model_name | VARCHAR(50) | Model name of the router |
| speed_mbps | INT | Maximum supported speed (in Mbps) |
| price | DECIMAL(10,2) | Price of the model |
| rating | DECIMAL(3,2) | Average user rating |
| stock | INT | Number of units in stock |
| sold_units | INT | Total units sold |

---

## 📊 Key SQL Insights & Queries

| Feature | Description |
|----------|--------------|
| 🛒 **Total Routers Sold per Brand** | Measures total sales per brand |
| ⭐ **Average Rating per Brand** | Finds the mean customer rating |
| 💰 **Average Price per Brand** | Analyzes pricing strategy across brands |
| 🚀 **Top 3 High-Speed Routers** | Lists routers with the highest Mbps |
| ⚖️ **Best Value Routers** | Calculates performance-to-price ratio |
| 🌍 **Model Count per Country** | Shows how many router models each country produces |
| 👍 **Top-Rated Brands (Rating > 3)** | Highlights consistently well-rated brands |
| 📦 **Total Stock and Sold Units by Brand** | Tracks inventory vs. sales |
| 🏎️ **Fastest Model per Brand** | Displays each brand’s fastest router |
| 🐢 **Slowest Model per Brand** | Displays each brand’s slowest router |

---

## ⚙️ How to Use

1. Open **MySQL Workbench** or any SQL-compatible RDBMS.
2. Create the database and tables by running:
   ```sql
   SOURCE wifi brand analysis.sql;
