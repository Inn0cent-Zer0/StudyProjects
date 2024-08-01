import json
import csv


def json_to_csv(json_filename, csv_filename):
    with open(json_filename, 'r') as json_file:
        data = json.load(json_file)

    with open(csv_filename, 'w', newline='') as csv_file:
        writer = csv.writer(csv_file)
        writer.writerow(data["people"][0].keys())

        for person in data["people"]:
            writer.writerow(person.values())


json_to_csv('sample4.json', 'output.csv')
