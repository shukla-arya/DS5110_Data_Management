# DS5110_Data_Management
Builds and emulates a real-world library database from the ground up. Includes the idea proposal, code for reproducibility, and example user queries. Demonstrates knowledge about data collection, storage, tidying, and transformation.

## Features
* Tracks library metadata for each user involved in the system.
* Generate summaries on library usage, user activity, inventory levels, and borrowing patterns.

## Tech Stack
* **Language:** SQL, Python  
* **Libraries:** Pandas, Mysql.connector, GetPass
* **Visualization:** Matplotlib
  
## Requirements

Connect with the Server

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

