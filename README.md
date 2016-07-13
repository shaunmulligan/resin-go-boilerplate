# Golang example project on Raspberry Pi 3 with Resin.io

A small resin.io boilerplate project to show how to develop quickly with the Go language.
This example shows you how to use `resin sync` to quickly sync and testing a cross-compiled golang binary to a single device before releasing the whole App/fleet of devices.

## Prerequisites
To use this boilerplate effectively you will need the following installed on your dev laptop.
* at least go version `go1.6.2 darwin/amd64`, cross compilation is earlier versions is much more difficult
* [Resin.io CLI](http://docs.resin.io/tools/cli/)
* git

## Usage

1. First clone this repo:
```
$ git clone https://github.com/shaunmulligan/goapp.git
```
2. Change into the repo, add your resin.io application git remote and push.
```
$ cd goapp
$ git remote add resin shaun@git.resin.io:shaun/myfleet.git
$ git push resin master
```
After the build completes you should see a friendly unicorn on your console and the device should start downloading the new container. When the container starts you should see `hello` and `world` printed multiple times

3. Now change a line in the main.go and run resin sync with the devices UUID as a parameter.
```
$ resin sync <UUID>
```
You should see something like this:
```
resin:goapp hobochild$ resin sync 598e029
Connecting with: 598e029
runtime/internal/sys
runtime/internal/atomic
runtime
errors
internal/race
sync/atomic
math
unicode/utf8
sync
syscall
io
strconv
time
reflect
os
fmt
github.com/shaunmulligan/goapp
Application container stopped.
/ Syncing to /usr/src/app on 598e029...building file list ...
3 files to consider
/ Syncing to /usr/src/app on 598e029..../
/ Syncing to /usr/src/app on 598e029....dockerignore
          85 100%    0.00kB/s    0:00:00 (xfer#1, to-check=1/3)
goapp
\ Syncing to /usr/src/app on 598e029...     1863336 100%   16.30MB/s    0:00:00 (xfer#2, to-check=0/3)
/ Syncing to /usr/src/app on 598e029...
sent 390876 bytes  received 8278 bytes  20469.44 bytes/sec
total size is 1863421  speedup is 4.67
Synced /usr/src/app on 598e029.
Application container started.
```
And your new code should be running on the device in about 30 seconds. Whenever you are happy with a version of your code and it looks like it is working, just commit and push. Now all your devices should be running the newest code you pushed. You will also need to do this if you install any external dependencies for your golang project like `dbus` or something.
