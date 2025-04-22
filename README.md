## Running the SQL Scripts

### Prerequisites
- PostgreSQL installed on your system
- Access to a PostgreSQL database
- SQL Shell (psql) or a PostgreSQL client like pgAdmin

### Setup Instructions

#### For Windows Users (using SQL Shell - psql):

1. **Open SQL Shell (psql)**:
   - Click Start and search for "SQL Shell (psql)"

2. **Connect to your database**:
   - When prompted, enter:
     - Server: `localhost` (or your server name)
     - Database: `your_database_name`
     - Port: `5432` (default)
     - Username: your PostgreSQL username
     - Password: your PostgreSQL password

3. **Run the scripts**:
   - First, run the unnormalized schema script:
     ```sql
     \i path\to\unnormalized_schema.sql
     ```
   - Then, run the normalized schema script:
     ```sql
     \i path\to\normalized_schema.sql
     ```
   Note: Replace `path\to\` with the actual path to your SQL files. For example:
   ```sql
   \i C:\Users\YourUsername\Documents\StudentEnrollment\unnormalized_schema.sql
   ```

#### For Linux/Mac Users:
1. **Connect to your PostgreSQL database**:
   ```bash
   psql -U your_username -d your_database_name
   ```

2. **Run the scripts in order**:
   ```bash
   psql -U your_username -d your_database_name -f unnormalized_schema.sql
   psql -U your_username -d your_database_name -f normalized_schema.sql
   ```

### Verifying the Setup

After running the scripts, you can verify the setup by:
1. Checking that all tables were created successfully
2. Running the example queries included in the normalized_schema.sql file
3. Testing your own queries against the sample data

### Troubleshooting

If you encounter any issues:
- Ensure PostgreSQL is running
- Verify your database credentials
- Check that the SQL files are in the correct location
- Make sure you have the necessary permissions to create tables and insert data
- For Windows users, ensure you're using forward slashes (/) or double backslashes (\\) in file paths

