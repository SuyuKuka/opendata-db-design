# OpenData DB Design — Paris Green Spaces & Trees

## About

**OpenData DB Design** is a SQL database design project developed as a first-year Master's (M1 IMPAIRS) project at Université Paris Cité. Built entirely from scratch, this project demonstrates a deep understanding of advanced relational database concepts, including conceptual and logical data modeling, functional dependency analysis, normalization, and complex SQL constraints.

The project models real-world urban datasets provided by the City of Paris, handling rigorous constraints for both the [Paris Green Spaces](https://opendata.paris.fr/explore/dataset/espaces_verts/) (`espaces_verts`) and [Paris Urban Trees](https://opendata.paris.fr/explore/dataset/les-arbres/) (`arbres`) datasets.

*Note: As this was originally an academic project evaluated on architectural design, the codebase emphasizes strict schema integrity, foreign key relations, and verification of non-trivial functional dependencies. The source code and comments might contain some French.*

## Tech Stack

- **Language / Query Language:** SQL (PostgreSQL / Relational Databases)
- **Modeling & Design:** Entity-Relationship (ER) diagrams, Functional Dependencies (FDs)
- **Documentation:** PDF technical reports (`Rapport_BDA_M1.pdf`)
- **Version Control:** Git 

## Key Features

- **Rigorous Schema Design:** Complete normalization and architecture built from raw open-data structures.
- **Functional Dependency Validation:** Implementation of SQL queries and checks to ensure data integrity and verify non-trivial FDs (e.g., relations between varieties, species, addresses, and municipal districts).
- **Advanced Constraints:** Heavy use of primary keys, foreign keys, unique constraints, and `CHECK` clauses to maintain strict database rules.
- **Comprehensive Documentation:** Detailed technical reports and ER schemas outlining the full database design lifecycle.

## Project Structure

```text
📁 opendata-db-design
│
├── 📁 arbres                           # Paris Trees dataset module
│   ├── 📄 abres_graph.png              # Data graph visualization
│   ├── 📄 arbres.sql                   # SQL table creation & constraints
│   ├── 📄 arbres_er.png                # Entity-Relationship diagram
│   └── 📄 arbres_req.sql               # Verification & analytical SQL queries
│
├── 📁 espaces_verts                    # Paris Green Spaces dataset module
│   ├── 📄 espaces.png                  # Data graph visualization
│   ├── 📄 espaces_verts.dot            # Data graph visualization
│   ├── 📄 espaces_verts.pdf            # Data graph visualization
│   ├── 📄 espaces_verts.sql            # SQL table creation & constraints
│   ├── 📄 ev_query.sql                 # Verification & analytical SQL queries
│   └── 📄 schema_ev.pdf                # Entity-Relationship diagram
│
├── 📄 LICENSE                          # License of the project
├── 📄 Rapport_BDA_M1.pdf               # Final technical report
└── 📄 README.md                        # Project documentation
```

## Getting Started

### Prerequisites

* A relational database management system supporting standard SQL (e.g., PostgreSQL, SQLite, MySQL).

### Usage

1. Clone the repository:

```Bash
git clone https://github.com/SuyuKuka/opendata-db-design.git
cd opendata-db-design
```

2. Execute SQL schemas:
* For green spaces: run `espaces_verts/espaces_verts.sql`
* For trees: run `arbres/arbres.sql`

3. Run validation & analytical queries:
* Use `espaces_verts/ev_query.sql` and `arbres/arbres_req.sql` to verify functional dependencies and test data integrity.

## Authors

This project was developed collaboratively as a 2-person team:

- **CHEN Michel** - Database Architecture & SQL Development
  [![GitHub](https://img.shields.io/badge/GitHub-Profile-181717?logo=github)](https://github.com/SuyuKuka)
  [![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-0A66C2?logo=linkedin)](https://linkedin.com/in/chen-michel)

- **HUYNH Minh Van Claude** - Database Architecture & SQL Development
  [![GitHub](https://img.shields.io/badge/GitHub-Profile-181717?logo=github)](https://github.com/huynh-claude)

## License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.