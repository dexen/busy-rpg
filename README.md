# Busy RPG
### Your character advances as you are working

Inspired by the good old Idle RPG, this is a not-quite-opposite game with focus on being enjoyable while requiring very little to no interactions.

#### Overview:
A web app ran on localhost with two HTTP APIs:
* end-user HTML GUI
* API for receiving events denoting work progress

#### Usage:
* install PicoLisp (https://picolisp.com/)
* install `listen1` (known source: plan9port, https://github.com/9fans/plan9port)
  * I plan on doing away with this requirement eventually
* clone Busy RPG ( ` git clone https://github.com/dexen/busy-rpg ` )
* start the HTTP server with ./SERVE
* navigate to end-user GUI at http://localhost:7172
* fill out character attributes
* add XP
