
if [ "$#" -lt 1 ]; then
  echo 'Syntax: $0 src-directory [run|debug]'
  exit 1
fi

src_dir="$(pwd)/blog-data/$1/src"
blg_data="$(pwd)/blog-data"

if [ ! -d "$src_dir" ]; then
  echo "Directory $src_dir does not exist."
  cd blog-data
  find . -type d | egrep -v -e src -e git
  exit 1
fi

if [ "$2" = "run" ]; then
   docker stop docker-hugo && docker rm -v docker-hugo 2> /dev/null
   docker run -d -p1313:1313 --name docker-hugo -v "$src_dir":/src:z -v "$blg_data":/blog_data:z stormzen/docker-hugo
elif [ "$2" = "debug" ]; then
   docker stop docker-hugo && docker rm -v docker-hugo 2> /dev/null
   docker run -it -p1313:1313 --name docker-hugo -v "$src_dir":/src:z -v "$blg_data":/blog_data:z stormzen/docker-hugo sh
else
   docker exec -it docker-hugo sh
fi

