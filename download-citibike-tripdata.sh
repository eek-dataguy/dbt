!/bin/bash

# Download the latest Citibike trip data (2023) and save it to the current directory
wget https://s3.amazonaws.com/tripdata/2023-citibike-tripdata.zip

# # Unzip all files from the archive
unzip -a 2023-citibike-tripdata.zip

# Extract all zip files inside the 2023-citibike-tripdata folder
cd 2023-citibike-tripdata
for zip_file in *.zip; do
    if [ -f "$zip_file" ]; then
        unzip -o "$zip_file"
    fi
done

# Delete all zip files in the current directory
rm -f *.zip

# Go back to the parent directory
cd ..

# Download SnowSQL (Snowflake CLI tool)
# curl -O https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.5/linux_x86_64/snowsql-1.5.0-linux_x86_64.bash
# bash snowsql-1.5.0-linux_x86_64.bash

