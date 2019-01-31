---
layout: post
title:  "ignite tech stacks"
categories: linux
---
# ignite tech stacks
## basic tech stacks
### ignite
1. ignite -h
```
add (a)        Adds an Ignite plugin.                                
attach         Attaches Ignite CLI to an existing project.           
doctor         Checks your dev environment for dependencies.         
generate (g)   Generates some files.                                 
info           Displays info about a given Ignite plugin.            
list           Lists known Ignite plugins.                           
new (n)        Generate a new React Native project with Ignite CLI.  
plugin (p)     Manages ignite plugins                                
remove (r)     Removes an Ignite CLI plugin.                         
search         Searches known Ignite plugins.                        
spork          Copy templates as blueprints for this project         
version (v)    Prints current version of installed ignite
```
1. [ignite-boilerplate workthough](https://github.com/infinitered/ignite-ir-boilerplate)
 - Contains ``` ignite g container/list/screen New```
 - Components
 - Navigation [react-navigation](https://reactnavigation.org/)
 "react-navigation": "1.0.0-beta.26",
 - Storybook ``` npm run storybook ```
 - Themes
 - Config
 - Fixtures
 - Redux,Sagas [reduxsauce](https://github.com/infinitered/reduxsauce) [redux-saga](https://github.com/redux-saga/redux-saga)
 - Service [apisauce](https://github.com/infinitered/apisauce)

### react-native
upgrade to given version ``` react-native-git-upgrade 0.52.2 ```

https://reactnative.cn/

### reactotron
console.tron.log(`object:${object}`)
if (__DEV__) console.tron.log(formatTime)

### jest
[jest]()

## additional tech stacks
### yarn
- yarn /*update all dependencies*/
- yarn add package-1@1.2.3
- yarn upgrade package-1@1.2.3
- yarn remove package-1
- [yarn managing-dependencies](https://yarnpkg.com/lang/en/docs/managing-dependencies/)

### fastlane

## extend tech stacks
### react-native-amap3d
### bluetooth

## tips: full work steps
```
$ ignite new bleController && cd  bleController
$ yarn upgrade
$ react-navigation@1.0.0-beta.26
$ react-native-git-upgrade 0.52.2
```
- latest ignite-ir-boilerplate 2.3.1
- [fix react-native-vector-icons issue](https://github.com/oblador/react-native-vector-icons/issues/626)
