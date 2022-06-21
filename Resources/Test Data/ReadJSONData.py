# Python program to read json file

import json

# Opening JSON file
f = open('InputData.json', )

# returns JSON object as a dictionary
data = json.load(f)

# Iterating through the json list
for key, value in data.items():
    print(value)

# Closing file
f.close()