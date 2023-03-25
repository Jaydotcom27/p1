# #!/usr/bin/env python
# # coding: utf-8
# #!/usr/bin/python3

# import sys
# import re

# # Generates regular expresion for the form 0000A/PM -> This is the format of the time column in the dataset
# value = re.compile('[^\s]{4}[A|P]')

# # Iterates every line of the CSV (using the standard in)
# for line in sys.stdin:
#   # Removes commas and splits it into a list of different values (each column), we also week reference of the length 
#   line=line.strip(',').split(',')
#   line_len = len(line)

#   # Checking if the lenght is 43 is a way to ensure the data point has all 43 attributes, excluding the header or any other useless row
#   if line_len == 43:

#     # The time column is at the 20th position 
#     time = line[19]

#     # Searching based on the regex
#     time_value = value.search(time)

#     # If a match is found we extract the needed chars to print by "most ticketed hour" across the data 
#     if time_value:
#       time=time[:2]+time[-1:]

#       # Prints the KVP (00A/PM, 1)
#       print('%s\t%s' % (time, 1))
#   else:
#       continue

import sys
import re
value = re.compile('[^\s]{4}[A|P]')

for line in sys.stdin:
  line=line.strip(',').split(',')
  line_len = len(line)
  if line_len ==43:
    time = line[19]
    time_value = value.search(time)
    if time_value:
      time=time[:2]+time[-1:]
      print('%s\t%s' % (time, 1))
  else:
      continue