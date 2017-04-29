
if [ "$1" != "-d" ]; then
	docker run -d --name docker-hugo -v ($pwd)/blog-data:/home/blog-data:z stormzen/docker-hugo

else
	docker run -it --name docker-hugo -v ($pwd)/blog-data:/home/blog-data:z stormzen/docker-hugo
fi


