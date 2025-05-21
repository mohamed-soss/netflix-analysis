# Netflix Content Analysis SQL Project

## Overview
This repository contains a comprehensive set of SQL queries designed to analyze Netflix content data stored in a SQL Server database. The project enables in-depth exploration of content trends, including release patterns, genre distribution, actor and director contributions, and more. Developed for SQL Server 2016 and later, it is an excellent resource for data analysts, SQL developers, and individuals interested in building data visualizations (e.g., using Power BI).

Key features include:
- Analysis of yearly content distribution and percentages (e.g., United States content).
- Classification of content based on descriptive keywords.
- Identification of documentaries, content without directors, and works by specific creators (e.g., Adam Sandler, Rajiv Chilaka).
- Insights into top actors in U.S. movies, common ratings, and longest movie durations.
- Tracking of content added in the last 5-10 years and TV shows with 5+ seasons.
- Exploration of genre diversity and country-wise content contributions.

## Prerequisites
- **SQL Server 2016 or later** (required for `STRING_SPLIT` function).
- **SQL Server Management Studio (SSMS)** for query execution and management.
- A database with a `netflix` table containing columns such as `type`, `country`, `date_added`, `director`, `description`, `duration`, `show_id`, `release_year`, `listed_in`, `cast`, and `rating`.

## Installation
1. **Clone the Repository**:
   ```bash
   https://github.com/mohamed-soss/netflix-analysis.git
   ```

2. **Set Up the Database**:
   - Create a new database in SQL Server (e.g., `NetflixDB`).
   - Import your Netflix dataset into a table named `netflix`. Ensure the schema matches the assumed columns (see `schema_notes.txt` for reference if provided).
   - Adjust connection strings in SSMS to point to your database instance (e.g., `DESKTOP-MR211KM\SQLEXPRESS`).

3. **Load Queries**:
   - Open the `.sql` files (e.g., `netflix_queries.sql`) in SSMS.
   - Execute the queries individually or as a batch after verifying the dataset compatibility.

## Usage
- **Run Queries**: Execute the SQL scripts to analyze the Netflix dataset. Examples include:
  - `SELECT * FROM netflix WHERE release_year = 2021 AND type = 'Movie';` (Movies released in 2021).
  - `SELECT director, type, COUNT(type) AS content_number FROM netflix WHERE director IS NOT NULL GROUP BY type, director ORDER BY COUNT(type) DESC;` (Titles per director by type).
- **Visualize Data**: Export query results to tools like Power BI or Excel for dashboards and reports.
- **Customize**: Modify queries to suit specific needs (e.g., add filters, join additional tables).

## Contributing
We welcome contributions to enhance this project! To contribute:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Make your changes and commit them (`git commit -m "Add your message"`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Open a pull request with a detailed description of your changes.

Please adhere to the following guidelines:
- Ensure code is well-commented and compatible with SQL Server 2016+.
- Include tests or validation for new queries.
- Follow the existing file structure and naming conventions.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact
For questions, suggestions, or support, please open an issue in this repository or contact the maintainer at [mohameedddmostaffaa@gmail.com](mailto:mohameedddmostaffaa@gmail.com).

## Acknowledgments
- Thanks to the Netflix dataset community for providing the data foundation.
- Appreciation to SQL Server and SSMS for enabling robust data analysis.
