# Moopack Server

### Commands

Docker Compose
```
  moopack:
    image: edymoo/moopack-server
    restart: always
    stdin_open: true
    tty: true
    volumes:
     - /mnt/docker/mc/moopack:/home/mc/server
    environment:
     - DOCKER_MAX_PLAYERS=100
     - DOCKER_PORT=25565
     - DOCKER_VIEW_DISTANCE=3
     - DOCKER_MAX_RAM=3G
```

## Minecraft Environment Variables
| Variable         | Description                               | Default value |
|------------------|-------------------------------------------|---------------|
| DOCKER_MAX_PLAYERS   | Max amount of players the server can hold | 100           |
| DOCKER_PORT          | Port server will use                      | 25565         |
| DOCKER_VIEW_DISTANCE | Max distance server will use              | 3             |
| DOCKER_MAX_RAM       | Amount of ram server is limited to        | 3G            |