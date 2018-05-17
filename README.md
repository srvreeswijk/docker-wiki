# personal wiki based on markdown documentation
wiki power from: https://github.com/gilbitron/Raneto  
Dockerfile inspiration from: https://github.com/appsecco/raneto-docker

## to build the image
Some changes I made to to appsecco dockerfile are
- specific node version (latest version 10 gave problems)
- update installed npm version to get rid of some warnings
```
docker build -t elbasso/wiki:0.1
```

## to run the demo content
This are de (empty)demo files in the content directory of this repo.  
```
docker run -v `pwd`/content/:/data/content/ -v `pwd`/config/config.default.js:/opt/raneto/example/config.default.js -p 3000:3000 -d elbasso/wiki:0.1
```

## to run my own content in an other directory
This is for my personal use, but feel free to ajust the commands to your own need.  
I give it the name wiki, so docker commands can be given with this name. Instead of container id or other long strings. 
```
export DOC_DIR=/Users/sebas/Documents/werk/Vialis/documentatie/VTC-Documentatie
docker run -v $DOC_DIR:/data/content/ -v `pwd`/config/config.default.js:/opt/raneto/example/config.default.js -p 3000:3000 -d --name wiki --rm elbasso/wiki:0.1

# to stop it
# docker stop wiki
```

## Then navigate to http://localhost:3000
default admin username and password: user=admin password=password  

