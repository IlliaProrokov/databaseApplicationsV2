**Before you start:** rename this file to `unit3a_lastname.md`, using your own last name. Read `unit3a_Walkthrough.md` first. Commit and push when you're done.

**Name:**

---

# Unit 3a — Redundancy

Open **`denormalized_demo.db`** in DB Browser for SQLite. The walkthrough used the **Cleveland Cavaliers**. In this task you do the same work for the **Chicago Bulls**.

The 30 teams, cities, states, conferences, and divisions are real. The games and scores are made up.

## 1. Count the repeats

Use the **Execute SQL** tab. You know enough SQL from Unit 2 for all of these. Paste each query you run into the code block under the question.

**a.** How many rows are in `games_flat`?

```sql
SELECT count (*)
FROM games_flat;
```

**Answer:**260


**b.** How many rows have `home_city = 'Chicago'`? How many have `away_city = 'Chicago'`?

```sql
SELECT COUNT(*) FROM games_flat WHERE home_city = 'Chicago';
SELECT COUNT(*) FROM games_flat WHERE away_city = 'Chicago';
```

**Answer:**
18

**c.** So how many times is the fact any team "plays in Chicago, Illinois" typed into this table?

**Answer:**
typed into the database equal to the total number of Chicago home games plus away games combined. Every time a game involves Chicago, the city "Chicago" and state "Illinois" are re-entered manually into that row, duplicating the exact same fact dozens of times.

## 2. Find the mistakes

There are **8** mistakes planted in `games_flat`. Two of them are the Cavaliers mistakes from the walkthrough. Find all 8.

Run `SELECT DISTINCT` on each of these six columns: `home_team`, `away_team`, `home_city`, `away_city`, `home_state`, `away_state`. Add `ORDER BY` so the list is sorted.

What each list should have if nothing is wrong:

- **Team names:** 30.
- **Cities:** 29. The Clippers and the Lakers both play in Los Angeles.
- **States:** 23. Toronto is in Ontario, and Washington is in District of Columbia, so those count too.

If a list has more than that, something in it is wrong. Once you find a wrong value, use `WHERE` to get its `game_id`.

| # | game_id | Which column | What it says | What it should say |
|---|---|---|---|---|
| 1 | 247|home team| Chicago Buls|Chicago Bulls |
| 2 |62 |home team |Clevland Cavaliers |Clevland Cavaliers |Cleveland Cavaliers
| 3 | | | | |
| 4 | | | | |
| 5 | | | | |
| 6 | | | | |
| 7 | | | | |
| 8 | | | | |
| 4 | | | | |



## 3. Spot the anomalies in a new table

A school keeps its class schedule in one table, `class_schedule`:

| student | course | period | teacher | room |
|---|---|---|---|---|
| Ava Brooks | Web Design | 1 | Mr. Grant | 214 |
| Ava Brooks | Algebra II | 2 | Ms. Ortiz | 108 |
| Liam Chen | Web Design | 1 | Mr. Grant | 214 |
| Liam Chen | Chemistry | 3 | Mrs. Hall | 122 |
| Noah Diaz | Web Design | 1 | Mr. Grant | 214 |
| Noah Diaz | Algebra II | 2 | Ms. Ortiz | 108 |
| Emma Fox | Art I | 4 | Mr. Kerr | 301 |

For each scenario, name the anomaly (**update**, **insert**, or **delete**) and explain what goes wrong.

**Scenario A** — Emma Fox drops Art I, so her Art I row is deleted.
Emma Fox drops Art I, so her Art I row is deleted.
**Which anomaly:**
Delete anomaly
**What goes wrong:**
Deleting Emma Fox's row removes the only record of Art I from the entire database.

**Scenario B** — The school hires a new teacher, Ms. Reyes, who will use Room 205. She has no students yet.

**Which anomaly:** Insert anomaly

**What goes wrong:** You cannot add Ms. Reyes, her room, or her course into the table without assigning a student at the same time. If no student is enrolled yet, you are forced to leave the student column blank or insert dummy data, which violates table rules or corrupts data integrity.


**Scenario C** — Mr. Grant moves from Room 214 to Room 220. How many rows have to change, and what happens if you miss one?
 
**Which anomaly:** Update anomaly

**What goes wrong:** 3 rows must be updated (Ava Brooks, Liam Chen, and Noah Diaz). If you miss updating even a single row, the database becomes inconsistent, showing Mr. Grant teaching in two different rooms (Room 214 and Room 220) at the exact same period.


**e.** In `denormalized_demo.db`, team facts (city, state, conference, division) were moved into their own table, `teams`. Which facts in `class_schedule` should be moved into their own table the same way?

**Answer:** : Course facts—specifically course, period, teacher, and room—should be moved into a separate courses or classes table. This decouples course details from individual student enrollments so class information exists independently.




## Closing 3a — Vocabulary

Your words, not the slide's.

| Term | Your definition |
|---|---|
| Redundancy |Storing the exact same piece of data multiple times across different rows in a database table. |
| Update anomaly | An error where changing data in one place requires updating multiple rows, and missing any row leaves contradictory information in the database.|
| Insert anomaly |An inability to add new information into a database table because required fields (like a student or primary key) are missing. |
| Delete anomaly |Unintentionally wiping out important secondary data when deleting a specific record from a table. |
| Normalization |The step-by-step process of restructuring a database into separate related tables to remove redundant data and prevent data anomalies. |


