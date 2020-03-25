#!/bin/bash

if [[ `iwgetid -r` == "University of Washington" ]]; then
    echo "Connected to UW network"
else
    echo "Connecting to UW network"
    bash ${HOME}/vpn.sh
fi

firefox trello.com/lizzypresland/boards drive.google.com https://uw.service-now.com/nav_to.do?uri=%2Fu_simple_requests_list.do%3Fsysparm_first_row%3D1%26sysparm_query%3Dassignment_group%253D0f2e426113b2d70811cdd2f18144b003%255EstateNOT%2BIN6%252C7%26sysparm_view%3D
