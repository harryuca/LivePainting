## (c) Harry Whalley hwhalley@uca.ac.uk (2022) 29-March-2022
## Developed for Live pAInting
## Made in Soinc Pi 3.1
## www.audio-research.com,  www.harrywhalley.com

## ================================================================= ##


live_loop :midi_out do # names a live_loop
  
  
  ## OSC_INTPUTS
  #  This section takes OSC data from the network, the IP and port number will need to be configured each time.
  #  Please note that **before the Sonic pi patch will run it needs to recieve osc data**. Also, Currently, Fader 8 recieves intergers from 0-7
  
  ## Select ip and port to recieve OSC data
  ip = "192.168.5.124" #Change this to your computers ip
  oscport = "54273" #Use cue to find recieving OSC port and change accordingly
  
  #Fader 1; root_note
  f1 = get "/osc:" + ip + ":" + oscport + "/fader1" #Concatincation of ip and osc port - recives OSC data from 0-1 as float
  f1 = (f1[0] * 10).round(0) #Scales number between 0-10
  print 'Fader 1 position ' + f1.to_s #Prints rounded Value to Log
  
  #Fader 2; BPM
  f2 = get "/osc:" + ip + ":" + oscport + "/fader2" #recives OSC data from 0-1 as float
  f2 = (f2[0] * 10).round(0) #Scales number between 0-10
  print 'Fader 2 position ' + f2.to_s
  
  #Fader 3; Volume
  f3 = get "/osc:" + ip + ":" + oscport + "/fader3" #recives OSC data from 0-1 as float
  f3 = (f3[0] * 10).round(0) #Scales number between 0-10
  print 'Fader 3 position ' + f3.to_s
  
  #Fader 4; scale_degree
  f4 = get "/osc:" + ip + ":" + oscport + "/fader4" #recives OSC data from 0-1 as float
  f4 = (f4[0] * 10).round(0) #Scales number between 0-10
  print 'Fader 4 position ' + f4.to_s
  
  #Fader 5; rhythm_density
  f5 = get "/osc:" + ip + ":" + oscport + "/fader5" #recives OSC data from 0-1 as float
  f5 = (f5[0] * 10).round(0) #Scales number between 0-10
  print 'Fader 5 position ' + f5.to_s
  
  #Fader 6; rhythm complexity
  f6 = get "/osc:" + ip + ":" + oscport + "/fader6" #recives OSC data from 0-1 as float
  f6 = (f6[0] * 10).round(0) #Scales number between 0-10
  print 'Fader 6 position ' + f6.to_s
  
  #Fader 7; staccato_legato
  f7 = get "/osc:" + ip + ":" + oscport + "/fader7" #recives OSC data from 0-1 as float
  f7 = (f7[0] * 10).round(0) #Scales number between 0-10
  print 'Fader 7 position ' + f7.to_s
  
  #Fader 8; mode
  f8 = get "/osc:" + ip + ":" + oscport + "/radio1" #recives OSC data from 0-10 as interger
  print 'Fader 8 position ' + f8.to_s
  
  
  #'Global settings'
  use_real_time
  use_midi_defaults port:"iac_driver_bus_1", channel: 1 #Sends Midi out of the bus and channel.
  
  ## Musical Params
  
  #Root note
  #The root not is quantised to fit within I, IV, V of D Major; if you want to let the OSC fader control directly use ** f1 = (f1[0] * 30 + 35).round(0) to scale number between 35-65
  if f1 == 0
    root_note = (38) #D2
  elsif f1 == 1
    root_note = (43) #G2
  elsif f1 == 2
    root_note = (45) #A2
  elsif f1 == 3
    root_note = (50) #D3
  elsif f1 == 4
    root_note = (55) #G3
  elsif f1 == 5
    root_note = (62) #D4
  elsif f1 == 6
    root_note = (67) #G4
  elsif f1 == 7
    root_note = (69) #A4
  elsif f1 == 8
    root_note = (74) #D5
  elsif f1 == 9
    root_note = (81) #A5
  elsif f1 == 10
    root_note = (83) #B6
  end
  print "current root_note " + root_note.to_s
  
  # Tempo/BMP

  if f2 == 0
    tempo = (56) #D2
  elsif f2 == 1
    tempo = (60) #G2
  elsif f2 == 2
    tempo = (66) #A2
  elsif f2 == 3
    tempo = (72) #D3
  elsif f2 == 4
    tempo = (80) #G3
  elsif f2 == 5
    tempo = (88) #D4
  elsif f2 == 6
    tempo = (96) #G4
  elsif f2 == 7
    tempo = (104) #A4
  elsif f2 == 8
    tempo = (112) #D5
  elsif f2 == 9
    tempo = (120) #A5
  elsif f2 == 10
    tempo = (132) #B6
  end
  print "current tempo " + tempo.to_s

  #Velocity Range 
  if f3 == 0
    velocity_range = [0.05, 0.08, 0.09].choose
  elsif f3 == 1
    velocity_range = [0.1, 0.15, 0.19].choose
  elsif f3 == 2
    velocity_range = [0.2, 0.25, 0.28, 0.29].choose
  elsif f3 == 3
    velocity_range = [0.3, 0.35, 0.36, 0.39].choose
  elsif f3 == 4
    velocity_range = [0.4, 0.45, 0.47, 0.49].choose
  elsif f3 == 5
    velocity_range = [0.5, 0.55, 0.57, 0.59].choose
  elsif f3 == 6
    velocity_range = [0.6, 0.65, 0.68, 0.69].choose
  elsif f3 == 7
    velocity_range = [0.7, 0.72, 75, 0.79].choose
  elsif f3 == 8
    velocity_range = [0.8, 0.83, 0.85, 0.89].choose
  elsif f3 == 9
    velocity_range = [0.9, 0.92, 0.96, 0.97, 0.99 ].choose
  elsif f3 == 10
    velocity_range = [0.9, 0.95, 1].choose
  end
  print "current velocity: " + velocity_range.to_s
  
  
  #Scale-Degree, Note selector from Scale. ie Scale-degree -> Map to 'Frequency'
  if f4 == 0
    scale_degree = [0].choose#root note of selected mode only
  elsif f4 == 1
    scale_degree  = [0,2].choose #root and 3rd
  elsif f4 == 2
    scale_degree  = [0,2,4].choose
  elsif f4 == 3
    scale_degree  = [0,2,4,5].choose
  elsif f4 == 4
    scale_degree  = [0,1,2,3,5].choose
  elsif f4 == 5
    scale_degree  = [0,1,2,3,4,5].choose
  elsif f4 == 6
    scale_degree  = [0,1,2,3,4,5,6].choose
  elsif f4 == 7
    scale_degree  = [0,1,2,3,4,5,6].choose
  elsif f4 == 8
    scale_degree  = [0,1,2,3,4,5,6,7].choose
  elsif f4 == 9
    scale_degree  = [0,1,2,3,4,5,6,7,8].choose
  elsif f4 == 10
    scale_degree  = [0,1,2,3,4,5,6,7,8,9].choose
  end
  print "current scale degee: " +scale_degree .to_s
  
  #Rhythmic Density -> Map to 'Proportion of Canvas covered'
  
  if f5 == 0
    rhythm_density = spread(1, 16) #creates an array of 16 values of which 1 is true
  elsif f5 == 1
    rhythm_density = spread(4, 16)
  elsif f5 == 2
    rhythm_density = spread(5, 16)
  elsif f5 == 3
    rhythm_density = spread(9, 16)
  elsif f5 == 4
    rhythm_density = spread(10, 16)
  elsif f5 == 5
    rhythm_density = spread(11, 16)
  elsif f5 == 6
    rhythm_density = spread(12, 16)
  elsif f5 == 7
    rhythm_density = spread(13, 16)
  elsif f5 == 8
    rhythm_density = spread(14, 16)
  elsif f5 == 9
    rhythm_density = spread(15, 16)
  elsif f5 == 10
    rhythm_density = spread(16, 16) #creates an array of 16 values of which 16 are true
  end
  print "current rhythmic density: " + rhythm_density.to_s
  
 
  #Rhythmic Complexity -> Map to Distance
  
  if f6 == 0
    rhythm_complexity_a = [[2].choose, [2].choose]
  elsif f6 == 1
    rhythm_complexity_a = [[2].choose, [1, 1].choose]
  elsif f6 == 2
    rhythm_complexity_a = [[2].choose, [1, 1, 0.5].choose]
  elsif f6 == 3
    rhythm_complexity_a = [[1].choose, [0.5].choose]
  elsif f6 == 4
    rhythm_complexity_a = [[1].choose, [0.5, 0.5].choose]
  elsif f6 == 5
    rhythm_complexity_a = [[1].choose, [0.75, 0.25].choose]
  elsif f6 == 6
    rhythm_complexity_a = [[0.5, 0.5].choose, [0.75, 0.25].choose]
  elsif f6 == 7
    rhythm_complexity_a = [[0.5, 0.5, 0.25].choose, [0.75, 0.25].choose]
  elsif f6 == 8
    rhythm_complexity_a = [[0.5, 0.25].choose, [0.75, 0.25].choose]
  elsif f6 == 9
    rhythm_complexity_a = [[0.5, 0.25].choose, [0.75, 0.25].choose]
  elsif f6 == 10
    rhythm_complexity_a = [[0.25].choose, [0.75, 0.25, 0.75].choose]
  end
  print "current rhytmic complexity: " + rhythm_complexity_a.to_s
  

  #'Staccto - Legato
  if f7 == 0
    staccato_legato = [0.05, 0.1, 0.2].choose
  elsif f7 == 1
    staccato_legato = [0.2, 0.3].choose
  elsif f7 == 2
    staccato_legato = [0.3, 0.4].choose
  elsif f7 == 3
    staccato_legato = [0.4, 0.5, 0.6].choose
  elsif f7 == 4
    staccato_legato = [0.5, 0.6, 0.7].choose
  elsif f7 == 5
    staccato_legato = [0.6, 0.7, 0.8].choose
  elsif f7 == 6
    staccato_legato = [0.8, 0.9, 1.0].choose
  elsif f7 == 7
    staccato_legato = [1.1, 1.2, 1.3, 1.4].tick
  elsif f7 == 8
    staccato_legato = [1.1, 1.2, 1.3, 1.4].tick
  elsif f7 == 9
    staccato_legato = [1.1, 1.2, 1.3, 1.4].tick
  elsif f7 == 10
    staccato_legato = [1.4, 1.5, 1.6, 1.7].tick
  end
  print "current staccato_legato: " + staccato_legato.to_s

  #Musical Mode
  if f8 == [0]
    mode = :minor_pentatonic
  elsif f8 == [1]
    mode = :dorian
  elsif f8 == [2]
    mode = :minor
  elsif f8 == [3]
    mode = :blues_minor
  elsif f8 == [4]
    mode = :major
  elsif f8 == [5]
    mode = :lydian
  elsif f8 == [6]
    mode = :chromatic
  end
  print "current mode: " + mode.to_s
  
  
  #Playback section
  #  rt = Root note (or f1 if direct from fader), mode choice 0-7,  vr = velocity range,
  #  sus = sustain length, rd = rhthmic density, rc =rhthmic complexity
  #BPM
  set :bpm ,tempo
  use_bpm get(:bpm)  

  ## Outputs to midi on chosen ports and channels - comment out if not needed
  midi scale(root_note, mode) [scale_degree], vel_f:[velocity_range].choose, sustain: staccato_legato, release: 1 if (rhythm_density).tick
  sleep (rhythm_complexity_a).tick

  ## Outputs to internal sounds - comment out if not needed
  play scale(root_note, mode) [scale_degree], vel_f:[velocity_range].choose, sustain: staccato_legato, release: 1 if (rhythm_density).tick
  sleep (rhythm_complexity_a).tick

end

