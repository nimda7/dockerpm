# dockerpm
Build RPM in a Docker

docker run -v $(pwd)/rpmbuild:/root/rpmbuild/ -ti my_image helloworld.spec
