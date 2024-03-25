The goal of this project was to dockerize nginx, wordpress and mariadb without fetching dockerhub images.
Everything had to be handmade, from the Dockerfile configurations to the tiniest details such as a custom conf file for nginx, custom entrypoint for wordpress or instructions for mariadb.

As seen in ft_transcendance, usually you can find usable docker images on duckerhub, but the goal of this project was to fully embrace what it is to make one yourself,
not because the school wants to annoy you, but to teach you problem solving.

You WILL 100% run into issues related to your docker architecture in every docker projects you'll work on, and this project is here to show you a glimpse of how useful it is to tinker not around the images,
but docker itself.

I won't post the .env file as it is not recommended to do in general, but you can make on yourself and find out how it works.
Also, this repo contains the most basic Inception you'll find, I posted commentaries pretty much everywhere, some Dockerfiles can be changed in order to make them cleaner, but it is not my priority right now.
