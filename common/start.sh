#!/bin/bash

# server.properties
sed -i s/MC_MAX_PLAYERS/$MC_MAX_PLAYERS/g /home/mc/server/server.properties
sed -i s/MC_PORT/$MC_PORT/g /home/mc/server/server.properties
sed -i s/MC_VIEW_DISTANCE/$MC_VIEW_DISTANCE/g /home/mc/server/server.properties

/usr/bin/java -Xms$MC_MIN_RAM -Xmx$MC_MAX_RAM -jar /home/mc/common/spigot/$MC_VERSION.jar