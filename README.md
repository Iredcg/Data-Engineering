## Data Engineering: Forecasting Movements of e-Scooters
Medium Article: [My Journey in Creating Automated Pipelines: Web Scraping, APIs, and Cloud Automation](https://medium.com/@iredcguerisol/my-journey-in-creating-automated-pipelines-web-scraping-apis-and-cloud-automation-46e1d553d515)

## 1. Project Objectives & Overview

### 1.1 The Business Challenge

Gans, an emerging e-scooter rental service, aims to establish a footprint in major global cities. They plan to deploy hundreds of e-scooters across city streets, offering them for rent by the minute. Despite gaining traction through an eco-friendly marketing strategy, their operational efficiency is critically dependent on the strategic positioning of these scooters.

Optimal positioning would naturally balance scooter distribution through user movement between key points. Nonetheless, several factors disrupt this balance:

In cities with varied elevation, scooters are preferred for uphill travel, leaving them unevenly distributed.

Morning routines typically involve commuting from residential areas to city centers.

Rainfall significantly reduces e-scooter usage.

The arrival of tourists, particularly those with backpacks arriving by plane, spikes demand at airports and train stations connecting to city centers.

My role as a Data Engineer at Gans involved gathering external data to anticipate e-scooter movement patterns. This entailed daily, real-time data collection accessible company-wide, thus necessitating the development and automation of a cloud-based data pipeline.


### 1.2 Skills Utilized

  Python (Pandas)
  
  Data acquisition via Web Scraping (Beautifulsoup) and APIs
  
  Cloud Computing with Google Cloud Platform
  
  SQL Database Management (SQLAlchemy for Python-MySQL interaction)

## 2. Gathering Data

### 2.1. Web Scraping for City Data

Employing web scraping, I extracted city-related data from Wikipedia using Beautiful Soup. This method facilitated the retrieval of structured data from HTML, allowing for dataframe creation. By leveraging Wikipedia's consistent URL structure across city pages, I devised a function to automate data extraction. This approach addressed Wikipedia's varied HTML structures for different cities, particularly for data like population figures, by incorporating conditional logic to ensure continuity in data collection.

### 2.2. API Integration for Weather and Flight Data

#### 2.2.1. Weather Data via API

For weather forecasts, I utilized OpenWeather's API, specifically their 5-day forecast offering. The API's data, formatted in JSON, allowed for easy manipulation and integration into our data model.

#### 2.2.2. Flight Arrival Information

Flight data was sourced through AeroDataBox via Rapid API, a marketplace simplifying API usage. Functions were developed to fetch and structure this data into dataframes, focusing on acquiring next-day flight arrival times to aid operational planning.

## 3. Data Storage

### 3.1. Local Storage with MySQL

Following data collection, the resultant city, weather, and flight data were organized into dataframes and stored in a MySQL database for analysis.

## 4.Google Cloud Platform Integration

Transitioning the local data pipeline to the cloud was a crucial step for enhancing Gans' operational efficiency by providing real-time insights into e-scooter demand influenced by weather changes and flight arrivals. The migration to Google Cloud Platform (GCP) entailed setting up a scalable, cloud-based infrastructure for data storage and processing.

### 4.1 Creating and Connecting to a SQL Instance

Initially, I established a MySQL database within GCP to serve as our central repository for storing weather, city, and flight data. This involved creating a relational database instance and configuring it for secure access.

### 4.2. Serverless Computing with Google Cloud Functions

To modernize our approach to data processing, I leveraged Google Cloud's serverless computing solution, specifically Google Cloud Functions. This Function as a Service (FaaS) model enabled me to deploy individual functions that execute in response to cloud events, such as HTTP requests or Cloud Scheduler triggers, without the need to manage server infrastructure.

### 4.3. Automating Data Updates with Cloud Functions

A pivotal component of our cloud-based solution was a set of Google Cloud Functions designed to update our database with the latest weather and flight information. These functions were triggered automatically, ensuring that our data remains current and reliable for making operational decisions.

### 4.4. Scheduling Tasks with Cloud Scheduler

To automate the execution of our data collection and processing tasks, I utilized GCP's Cloud Scheduler. This fully managed cron job service allowed us to schedule our Cloud Functions to run at predetermined intervals, guaranteeing that Gans always has access to the most recent data without manual intervention.
