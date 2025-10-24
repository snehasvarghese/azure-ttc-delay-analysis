# Azure Data Pipeline for Public Transit Delay Analysis (TTC)

### Overview
This project demonstrates a **modern Azure Data Engineering & Analytics pipeline** built to analyze **Toronto Transit Commission (TTC) bus delay data** using a **medallion architecture** (Bronze–Silver–Gold).  
The goal is to transform raw transit data into actionable insights through **Azure Synapse Analytics** and **Power BI dashboards**.

---

## Architecture

### Bronze Layer (Raw)
- Source: CSV / TTC Open Data API
- Storage: Azure Data Lake Storage Gen2 (ADLS)
- Ingestion: Azure Data Factory (ADF) pipelines copy raw data into `adls/bronze/`

### Silver Layer (Transformed & Curated)
- Transformation logic applied through Synapse SQL scripts:
  - Data type corrections
  - Null value handling
  - Standardized schema  
- Stored as Parquet files in `adls/silver/`

### Gold Layer (Aggregated / Analytics)
- Aggregated and analytical data views created in **Azure Synapse Serverless SQL Pool**:
  - `vw_peak_vs_offpeak` → delay trends by time of day  
  - `vw_top_stations` → station-wise performance metrics  
  - `vw_monthly_delay_trend` → delay trends by month  
- These views are connected to **Power BI Desktop** for visualization.

---

## Tech Stack

| Layer | Technology Used |
|-------|------------------|
| Data Storage | Azure Data Lake Gen2 |
| Orchestration | Azure Data Factory |
| Transformation | Synapse Serverless SQL Pool |
| Visualization | Power BI Desktop |
| Scripting | SQL, DAX |
| Data Format | CSV → Parquet |

---

## Data Flow Diagram
![TTC Data Model](assets/ttc_data_model.png)


## Key Learnings
- Implemented full Azure Medallion architecture (ADF → Synapse → Power BI)
- Improved data query performance using Parquet & Serverless SQL
- Designed analytical visuals showing delay trends and station performance

