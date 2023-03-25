#!/usr/bin/python
import sys
from collections import defaultdict

# We store all keys on a default dictionary (unique keys)
reducer_keys = defaultdict(int)

# We split the previous output, remove any empty spaces and split using the previously inserted tab character between the Key and Value
for line in sys.stdin:
    line = line.strip()
    reducer_key, count = line.split('\t')
    try:
        # We use the key to search for a match and sum the count found
        reducer_keys[reducer_key] += int(count)
    except ValueError:
        pass

# We sort the dictionary in descending order, greater values will be above. 
sorted_dict = sorted(reducer_keys.items(), key=lambda x: x[1], reverse=True)

# Print the top 15 
for sorted_key, count in sorted_dict[:15]:
    print('{}\t{}'.format(sorted_key, count))