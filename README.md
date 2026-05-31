# 🚚 Automated Cold-Chain ESG & Regulatory Compliance Pipeline
**Engineering-Grade Data Architecture for Mid-Atlantic Logistics**

## 📑 Executive Summary
Mid-sized logistics and cold-storage operations along the I-95 corridor are facing a dual mandate: aggressive **Scope 3 supply chain carbon reporting** from corporate enterprise partners, and strict local **criteria pollutant limits (NOx, SOx, PM)** from state environmental agencies. 

This repository demonstrates an automated engineering data pipeline designed to replace manual, error-prone spreadsheet tracking. By treating operational emissions as an engineering mass-balance problem rather than a financial accounting exercise, this architecture transforms raw fleet telematics and facility utility data into real-time, audit-ready compliance dashboards.

## 🏭 The Business Scenario (Simulated)
**Client:** A regional cold-storage facility and 45-truck diesel freight fleet based near the Port of Wilmington. 
**The Crisis:** The client's anchor tenant—a global pharmaceutical enterprise—requires verified carbon intensity metrics (g CO2e / ton-mile) for all shipments to maintain their contract. Concurrently, state regulators are auditing the facility's 250kW emergency backup diesel generators.
**The Solution:** Deployment of a localized Microsoft data stack to automatically ingest operational logs, apply physical mass balances against rigid EPA emission factors, and visualize the output for executive reporting.

## 🏗️ Technical Architecture & Tech Stack
This pipeline is built on a scalable Microsoft-native stack, designed to handle messy operational data while maintaining strict relational data discipline.

* **Backend Data Warehouse:** Microsoft SQL Server Express
* **Data Engineering & ETL:** T-SQL Stored Procedures & Views (Handling combustion stoichiometry and mass balance conversions)
* **Presentation Layer:** Power BI Desktop (Dual-Audience Dashboards)

### Core Pipeline Flow:
1. **Ingestion (The Influent):** Raw fleet fuel cards, vehicle telematics, and facility natural gas/generator runtimes are loaded into relational staging tables.
2. **The Calculation Engine (The Reactor):** SQL Views dynamically `JOIN` raw operational data with a centralized table of validated EPA AP-42 and MOVES emission factors.
3. **Visualization (The SCADA):** Data is pumped into Power BI, split into two distinct operational views:
   * *The Commercial RFP Shield:* Carbon intensity metrics for corporate ESG auditors.
   * *The Facility Permit Guard:* Real-time criteria pollutant tracking against local state permit thresholds.

## 📂 Repository Structure (Deployment Guide)
Technical auditors and database administrators can review the infrastructure build by executing the SQL scripts in sequence:

* `/database-engine/01_init_tables.sql` - Establishes the rigid relational schema to prevent data entry errors.
* `/database-engine/02_mock_data_load.sql` - Populates the EPA reference tables and injects highly realistic, varying operational fleet data (including heavy loads, port idling, and deadheading).
* `/database-engine/03_compliance_views.sql` - Production-Ready The mass balance calculation engine.
* `/powerbi-dashboards/ColdChain_Fleet_Emissions_v1.pbix` - Production-Ready The interactive `.pbit/pbix` reporting files.

## 📐 About the Architect 
This architecture was designed and built by **Asymmetric Insight**, a boutique analytics consultancy operating in the Delaware Valley. We specialize in building automated intelligence systems for SMEs. 

Unlike traditional business intelligence analysts, our systems are rooted in physical realities. Engineered by a professional holding a Bachelor of Environmental Engineering from the University of Delaware (with a concentration in pollution transport and control processes) and an Engineer Intern designation issued in April 1999, our pipelines ensure all data transformations accurately reflect real-world combustion stoichiometry and localized regulatory constraints.

**Contact:** Reach out via [Value Asymmetry](https://asymmetric-insight.github.io/) 
