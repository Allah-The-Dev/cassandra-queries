-- import
copy <table_name> (<table columns>) from '<file_path_of_csv>' with delimiter=',' and header=true;

-- export whole table
copy <table_name> to '<filename_with_location>' with delimiter=',';

-- export selected columns from table
copy <table_name> (<table_columns>) to '<filename_with_location>' with delimiter=',';