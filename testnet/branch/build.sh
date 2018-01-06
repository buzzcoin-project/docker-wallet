#!/bin/bash

cd ./firstnode
docker build . -t firstnode_branch
docker run -d --name firstnode_branch firstnode_branch
echo "BUILD OF FIRSTNODE COMPLETE, CHECKING RUNNING CONTAINERS:"
docker ps

cd ../wallet
docker build . -t wallet_branch
echo "BUILD OF  WALLET COMPLETE, CHECKING RUNNING CONTAINERS:"
docker run -d -P --name wallet_branch --link firstnode_branch wallet_branch

# IF YOU WANT TO CONNECT TO ONE OF THE CONTAINERS CLI TO CHECK ON THINGS USE THE FOLLOWING COMMANDS
# TO DISCONECT FROM THE CONTAINER AFTER YOU CONNECT WITHOUT KILLING IT USE <CTRL-P> <CTRL-Q>
# docker exec -it wallet_branch /bin/bash or docker exec -it firstnode_branch /bin/bash
