#!/bin/bash
# 
# Script that prints the activity percentage of the GPU

# Get the percentage
get_perc=$(radeontop -l 1 -d - | grep "gpu" | awk '{print $5}')
perc=${get_perc::-1}

# Print the output
echo "%{F#7E57C2} %{F#ffffff}$perc"
