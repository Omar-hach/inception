# Description: Nginx Dockerfile

# pull the base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# # open the port on which the container will exchange traffic
EXPOSE 443


# define the command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]