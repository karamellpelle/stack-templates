# stack templates

## usage
```
$ stack new appname karamellpelle/relude-app <-p,--param KEY:VALUE> 
```

## skeletons
* Use `./test-skeleton.sh` to create a project in temporary folder from a skeleton (with dummy variables written). This requires commands `sponge` and `haskell-mustache` (`stack install mustache`)
* Use [stack-templatizer](https://github.com/prikhi/stack-templatizer) to generate _.hsfiles_ from a directory in `skeletons/`: `stack-templatizer <folder>`

## resources
* [stack-templates/wiki](https://github.com/commercialhaskell/stack-templates/wiki)
* [https://docs.haskellstack.org/en/stable/GUIDE/#templates](https://docs.haskellstack.org/en/stable/GUIDE/#templates)
