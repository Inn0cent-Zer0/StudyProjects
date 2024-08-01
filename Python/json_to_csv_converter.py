import json
import csv

def json_to_csv(json_filename, csv_filename):
    try:
        with open(json_filename, 'r') as json_file:
            data = json.load(json_file)
        
        # Ensure 'people' key exists and is a list
        if 'people' not in data or not isinstance(data['people'], list):
            raise ValueError("JSON file must contain a 'people' key with a list of dictionaries.")
        
        # Check if 'people' list is not empty
        if not data['people']:
            raise ValueError("'people' list in JSON file is empty.")
        
        # Open CSV file for writing
        with open(csv_filename, 'w', newline='') as csv_file:
            writer = csv.writer(csv_file)
            # Write header row
            writer.writerow(data['people'][0].keys())
            
            # Write data rows
            for person in data['people']:
                writer.writerow(person.values())

    except FileNotFoundError:
        print(f"Error: The file {json_filename} does not exist.")
    except json.JSONDecodeError:
        print("Error: The JSON file could not be decoded.")
    except ValueError as e:
        print(f"Error: {e}")

json_to_csv('sample4.json', 'output.csv')
