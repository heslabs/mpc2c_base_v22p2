##!/bin/bash -f
kill -9 $(ps aux | grep '[V]itis' | awk '{print $2}')
kill -9 $(ps aux | grep '[V]ivado' | awk '{print $2}')

