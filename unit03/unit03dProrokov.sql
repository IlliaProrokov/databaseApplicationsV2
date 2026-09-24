**Before you start:** rename this file to `unit3d_lastname.md`, using your own last name. Watch the video and read `unit3d_Walkthrough.md`. Commit and push when you're done.

**Name:** Illia Prorokov

---

# Unit 3d — Types of Databases

Answer every question. No SQL today.

---

## While you watch the video

**1.** Fill in the table while you watch [7 Database Paradigms – Fireship](https://www.youtube.com/watch?v=W2Z7fbCLSTw).

| Type | One product he names | Good for |
|---|---|---|
| Key-value | Caching, session management, and real-time leaderboards/counters requiring sub-millisecond speed.| |
| Wide-column | Massive time-series data, high-volume write workloads, and IoT/sensor telemetry across distributed clusters.| |
| Document | Storing flexible, schema-less JSON objects like e-commerce product catalogs with varying attributes.| |
| Relational |Structured data requiring strict integrity, foreign keys, and ACID-compliant transactions. | |
| Graph |Managing highly interconnected network data, social media friend networks, and recommendation engines. | |
| Full-text search |Searching large bodies of text quickly with fuzzy matching, auto-complete, and relevance scoring. | |
| Multi-model | Applications requiring multiple database paradigms (e.g., document + relational + graph) within a single engine.| |

---

## After the video

**2.** Key-value databases keep their data in memory. What does that make them good at? What can't you do with them?

**Answer:**
In-memory storage makes them exceptionally fast for ultra-low latency reads and writes, making them ideal for caching, user session storage, and live counters.
You cannot run complex queries, filter by internal values, or perform relational joins—you must know the exact lookup key to retrieve data.
**3.** What is the downside of a document database, according to the video?

**Answer:**
Data duplication and redundancy. Because document databases lack native relational joins, data is often duplicated across multiple documents, creating a risk that data will become inconsistent when updated.

**4.** A relational database needs a join table to connect many things to many things. In a graph database, what does that job instead?

**Answer:**
Edges direct relationships or pointers connect entities nodes directly, eliminating the need for intermediate join tables.

**5.** Name one relational database product from the video.

**Answer:**
PostgreSQL (or MySQL / SQLite).

---

## Pick the database

**6.** For each client, pick the best type of database and give one reason. Use the "How to pick one" table in the walkthrough.

**Choose from:** Relational · Document · Graph · Key-value · Full-text search · Wide-column

| # | Client says… | Type | One reason |
|:-:|---|---|---|
| a | "We run a pharmacy. Every prescription must link to one patient and one doctor, and nothing can ever be out of sync." |ACID transactions and foreign keys enforce strict data integrity so records never lose alignment | |
| b | "Our store sells 40,000 products. Shoes have sizes, laptops have RAM. Every category has different information." | | |
| c | "We want to suggest new friends: people who are friends with your friends." Flexible JSON schemas accommodate products with completely different fields without empty, unused columns.| | |
| d | "Our game needs a leaderboard. Scores change thousands of times a second." |Nodes and edges natively map complex network connections, making multi-level relationship traversals fast and efficient. | |
| e | "Our website has 50,000 recipes, and people need to search them by any word." |In-memory processing provides the ultra-fast read/write throughput needed for rapid real-time updates. | |
| f | "We have 10,000 weather sensors sending a reading every second." |Inverted indexes allow instant text parsing, fuzzy searching, and relevance ranking across unstructured text. | |

**7.** In 3a, the `teams` + `games` tables stored each team once and linked games to teams with `team_id`. Why is a relational database a good fit for NBA data?

**Answer:**
NBA data has fixed, structured entities (teams, games, players) with clear relationships. A relational database prevents duplicate entries, enforces consistency through primary/foreign keys, and allows seamless queries across interconnected tables using SQL joins.

**8.** You're building an app for our school that keeps track of students, classes, and grades. Which type of database would you pick, and why?

**Answer:**
A Relational Database (such as PostgreSQL or SQLite). School records consist of structured, highly interrelated data (students enrolled in courses taught by teachers with specific grades). Relational integrity ensures that deleting or modifying a record updates correctly without leaving orphan records or corrupted grade entries.