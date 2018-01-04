Containerized Wallets:

This Dockerfile is not the one we would build from for CI of PR's, as that should not be a persistent wallet, making it easier to spin up 10 or 100 wallets for testing without needing changes. Also need to still test if we can forward X sessions from inside docker to the host OS to verify GUI testing would be viable.

The first example Dockerfile is setup to build from wget by downloading the tar.gz source of the Windows 2.1 wallet release. It was built with a Docker Volume to allow persistent storage of the configuration file and wallet.dat. It shows how to select a FROM image, how to RUN commands, COPY a file (for a patch) and build the entire system. Each of these actions are then cached into another image. Such that if you have to change a RUN or COPY command and rebuild the image all the prior steps are cached and do not need to be repeated, however the command you alter and all following commands will execute again and build another image for the cache.

To easily understand docker image cache benefits perform a docker build one time, then perform another docker build and see the speed difference. Now change a RUN line by adding an "echo 'something' && " to the list of commands and execute docker build again. Notice where cached images are used for each RUN command of apt-get, wget, etc. and from your change onward the steps are repeated to recreate the cached images.

Once we get some time together for review we can create a dockerhub repository for buzzcoin-project and we can push images up, so there is no requirement to actually build it yourself each time with the Dockerfile.


