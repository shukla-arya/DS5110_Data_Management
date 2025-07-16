# DS5110_Data_Management
Builds and emulates a real-world library database from the ground up. Includes the idea proposal, code for reproducibility, and example user queries. Demonstrates knowledge about data collection, storage, tidying, and transformation.

## Features
- Selects a mood from a dropdown menu and optionally allows the ability to add a note.
- A bar chart will visually demonstrate the frequency of logged moods for the day.

## Tech Stack
- **Language:** SQL, Python  
- **Libraries:** Pandas, Mysql.connector, GetPass
- **Visualization:** Matplotlib
  
## Requirements

```bash
try:
    conn = connect(
        host = "localhost",
        user = input("Enter Username: "),
        password = getpass("Enter Password: "),
        database = "library"
    )

except Error as e:
    print(e)```

