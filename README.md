## to build the image
```
docker build -t elbasso/wiki:0.1
```

## to run the demo content
```
docker run -v `pwd`/content/:/data/content/ -v `pwd`/config/config.default.js:/opt/raneto/example/config.default.js -p 3000:3000 -d elbasso/wiki:0.1
```

## to run your own content in an other directory
```
export DOC_DIR=/Users/sebas/Documents/werk/Vialis/documentatie/VTC-Documentatie
docker run -v $DOC_DIR:/data/content/ -v `pwd`/config/config.default.js:/opt/raneto/example/config.default.js -p 3000:3000 -d --name wiki --rm elbasso/wiki:0.1
```

## Then navigate to http://localhost:3000
