
if [ "$#" -lt 1 ]; then
  echo 'Syntax: $0 src-directory [run]'
  exit 1
fi

src_dir="$(pwd)/blog-data/$1/src"

if [ ! -d "$src_dir" ]; then
  echo "Directory $src_dir does not exist."
  cd blog-data
  find . -type d | egrep -v -e src -e git
  exit 1
fi

if [ "$2" != "run" ]; then
   docker run -d -p1313:1313 --name docker-hugo -v "$src_dir":/src:z stormzen/docker-hugo

else
   docker exec -it docker-hugo sh
fi

