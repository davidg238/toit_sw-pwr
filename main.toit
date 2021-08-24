// Copyright (c) 2021 Ekorau LLC

import gpio show Pin

import .switch show Switch
import .switch_events show Rise Fall

import monitor show *

button0 := null
button1 := null
events := Channel 20
event := null

d2 := Pin 7 --output
led := Pin 15  --output

main:
  
  task:: report_task
  task:: sw0_task
//  task:: sw1_task

sw0_task:
  // print "...start sw0_task"
  button0 = Switch --io=5 --eventTo=events
  button0.on

sw1_task:
  // print "...start sw1_task"
  button1 = Switch --io=5 --eventTo=events
  button1.on

report_task:
  // print "...start report_task"
  while true:
    event = events.receive
    if event is Rise:
      // print "$(event.sw) rise"
      led.set 1
    if event is Fall:
      // print "$(event.sw) fall"
      led.set 0
