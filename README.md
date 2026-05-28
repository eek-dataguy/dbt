# Learning dbt with Snowflake

This repository is dedicated to learning and practicing **dbt (data build tool)** with **Snowflake** as the data warehouse.

## Overview

dbt is a transformation workflow that helps you organize, test, and document your data analysis code. This project demonstrates how to use dbt with Snowflake to build reliable, modular data pipelines.

## Project Structure

```
├── README.md                           # This file
├── download-citibike-tripdata.sh      # Script to download Citibike data
├── snowflake/
│   └── initial.sql                    # Initial Snowflake setup SQL
├── snowsql/                           # SnowSQL installation directory
└── 2023-citibike-tripdata/            # Downloaded Citibike data (after running script)
```

## Prerequisites

- Snowflake account
- SnowSQL (Snowflake CLI tool)
- dbt installed locally or in a virtual environment
- Basic SQL and Python knowledge

## Getting Started

### 1. Download Data

Run the script to download Citibike trip data:

```bash
bash download-citibike-tripdata.sh
```

This will:
- Download the 2023 Citibike trip data
- Extract all zip files
- Clean up temporary files

### 2. Set Up Snowflake

Execute the SQL setup script to create databases, schemas, and tables:

```bash
snowsql -f snowflake/initial.sql
```

### 3. Initialize dbt Project

```bash
dbt init
```

### 4. Configure dbt Connection

Update your `~/.dbt/profiles.yml` with your Snowflake credentials.

## Key Concepts

- **Transformations**: Using dbt to transform raw data into analytics-ready tables
- **Models**: dbt models (SQL files) that define data transformations
- **Tests**: Data quality tests to ensure data integrity
- **Documentation**: Auto-generating documentation for your data warehouse

## Resources

- [dbt Documentation](https://docs.getdbt.com/)
- [Snowflake Documentation](https://docs.snowflake.com/)
- [dbt Snowflake Adapter](https://docs.getdbt.com/reference/warehouse-setups/snowflake-setup)
- [Citibike Trip Data](https://www.citibikenyc.com/system-data)

## License

This project is for educational purposes.

