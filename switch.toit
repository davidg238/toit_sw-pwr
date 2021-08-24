import gpio show Pin
import monitor show Channel
import .switch_events show Rise Fall

class Switch:

  io_ := 0   // the physical pin number
  sw/Pin
  on_ := 0   // the debounced switch state
  channel_/Channel

//todo generalize pin definition for pull up/down

  constructor --io/int --eventTo/Channel:
    io_ = io
    channel_ = eventTo
    sw = Pin io --input --pull_up=false
    on_ = sw.get  // no debounce, but have to start in the right state (which may be pressed)
    
  on -> none:
    while true:
      if on_==1: 
        sw.wait_for 0        // wait for a transition to low
      else:
        sw.wait_for 1        //                       or high
      debounce               // now poll, to eliminate bounce

  debounce -> none:
    sleep --ms=50  // you got here after an edge, the FIRST thing to do is wait before sampling
                   // assumes symmetric bounce times
    if on_==1:
        if 0==sw.get:
            on_ = 0
            channel_.send (Fall io_)
    else:
        if 1==sw.get:
            on_ = 1
            channel_.send (Rise io_)
    
  get -> int:
    return on_