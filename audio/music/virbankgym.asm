Music_VirbankGym: ; f48ae
	musicheader 4, 1, Music_VirbankGym_Ch1
	musicheader 1, 2, Music_VirbankGym_Ch2
	musicheader 1, 3, Music_VirbankGym_Ch3
	musicheader 1, 4, Music_VirbankGym_Ch4
; f48ba

Music_VirbankGym_Ch1: ; f48ba
	tempo 132
	volume $77
	stereopanning $ff
	vibrato $12, $24
	dutycycle $2
	notetype $c, $90
	note __, 16
Music_VirbankGym_Ch1_loop: ; f48c9
	intensity $90
	octave 3
	note B_, 12
	note F#, 2
	note B_, 2
	octave 4
	note C#, 2
	intensity $96
	octave 3
	note A_, 2
	note A_, 2
	intensity $90
	note __, 10
	note B_, 12
	note F#, 2
	note B_, 2
	note A#, 2
	note __, 1
	note B_, 1
	octave 4
	note C#, 8
	note __, 4
	note D#, 12
	note C#, 2
	note D#, 2
	note E_, 2
	intensity $96
	note C#, 2
	note C#, 2
	intensity $90
	note __, 10
	note D#, 12
	note C#, 2
	note D#, 2
	note E_, 2
	note C#, 1
	note E_, 1
	note A_, 8
	note G_, 4
	callchannel Music_VirbankGym_Ch1_branch_1
	callchannel Music_VirbankGym_Ch1_branch_2
	note D#, 2
	note __, 1
	note E_, 1
	note F#, 4
	note __, 2
	note F#, 2
	note B_, 2
	note F#, 2
	callchannel Music_VirbankGym_Ch1_branch_3
	callchannel Music_VirbankGym_Ch1_branch_1
	callchannel Music_VirbankGym_Ch1_branch_3
	note D#, 2
	note __, 1
	note E_, 1
	note F#, 3
	note __, 1
	notetype $6, $90
	note F#, 5
	note __, 1
	notetype $c, $90
	note G#, 1
	note A#, 4
	note B_, 2
	note __, 1
	octave 5
	note C#, 1
	note D_, 8
	note C#, 4
	octave 4
	note B_, 16
	note A_, 8
	octave 5
	note C#, 8
	octave 4
	notetype $6, $90
	note B_, 1
	octave 5
	note C#, 1
	notetype $c, $90
	octave 4
	note B_, 15
	intensity $97
	note B_, 12
	note __, 4
	loopchannel 0, Music_VirbankGym_Ch1_loop
	
Music_VirbankGym_Ch1_branch_1:
	note F#, 6
	note B_, 6
	note F#, 2
	note __, 2
	endchannel
	
Music_VirbankGym_Ch1_branch_2:
	note A_, 2
	note __, 2
	note G#, 2
	note __, 2
	note F#, 2
	note __, 2
	note E_, 4
	endchannel
	
Music_VirbankGym_Ch1_branch_3:
	note A_, 2
	note __, 2
	note G_, 2
	note __, 2
	note F#, 2
	note __, 2
	note E_, 4
	endchannel

Music_VirbankGym_Ch2: ; f497c
	dutycycle $0
	stereopanning $f0
	notetype $c, $a5
	octave 2
	note __, 10
	note E_, 1
	note E_, 1
	octave 3
	note E_, 4
Music_VirbankGym_Ch2_loop:
	callchannel Music_VirbankGym_Ch2_branch_1
	callchannel Music_VirbankGym_Ch2_branch_2
	callchannel Music_VirbankGym_Ch2_branch_1
	note F#, 2
	note A#, 2
	octave 3
	note C#, 2
	note E_, 6
	note C#, 4
	callchannel Music_VirbankGym_Ch2_branch_3
	callchannel Music_VirbankGym_Ch2_branch_2
	callchannel Music_VirbankGym_Ch2_branch_3
	octave 3
	note C#, 2
	octave 2
	note F#, 2
	note F#, 2
	octave 3
	note C#, 2
	octave 2
	note F#, 2
	note F#, 2
	octave 3
	note F#, 4
	callchannel Music_VirbankGym_Ch2_branch_4
	callchannel Music_VirbankGym_Ch2_branch_5
	note G#, 2
	note B_, 2
	octave 3
	note D#, 2
	note G#, 6
	note D#, 2
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note E_, 4
	callchannel Music_VirbankGym_Ch2_branch_4
	callchannel Music_VirbankGym_Ch2_branch_5
	octave 2
	note A#, 1
	note A#, 1
	octave 3
	note F#, 4
	octave 2
	note A#, 1
	note A#, 1
	octave 3
	note F#, 4
	note F#, 4
	note G_, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 2
	note B_, 1
	note B_, 1
	octave 3
	note G_, 4
	octave 2
	note B_, 1
	note B_, 1
	octave 3
	note G_, 4
	note G_, 4
	note C#, 1
	note C#, 1
	note A_, 4
	note C#, 1
	note C#, 1
	note A_, 4
	note A_, 4
	note D#, 1
	note D#, 1
	note B_, 4
	note D#, 1
	note D#, 1
	note B_, 4
	note B_, 4
	note D#, 1
	note D#, 1
	note B_, 4
	note D#, 1
	note D#, 1
	note B_, 2
	octave 2
	note E_, 1
	note E_, 1
	octave 3
	note E_, 4
	loopchannel 0, Music_VirbankGym_Ch2_loop
	
Music_VirbankGym_Ch2_branch_1:
	octave 2
	note F#, 1
	note F#, 1
	note B_, 4
	note F#, 1
	note F#, 1
	note B_, 4
	note B_, 4
	endchannel
	
Music_VirbankGym_Ch2_branch_2:
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	endchannel
	
Music_VirbankGym_Ch2_branch_3:
	octave 2
	note F#, 1
	note F#, 1
	octave 3
	note D#, 4
	octave 2
	note F#, 1
	note F#, 1
	octave 3
	note D#, 4
	note D#, 4
	endchannel
	
Music_VirbankGym_Ch2_branch_4:
	octave 2
	note B_, 1
	note B_, 1
	octave 3
	note F#, 4
	octave 2
	note B_, 1
	note B_, 1
	octave 3
	note F#, 4
	note F#, 4
	endchannel
	
Music_VirbankGym_Ch2_branch_5:
	octave 2
	note A_, 1
	note A_, 1
	octave 3
	note E_, 4
	octave 2
	note A_, 1
	note A_, 1
	octave 3
	note E_, 4
	note E_, 4
	endchannel


Music_VirbankGym_Ch3: ; f4a37
	vibrato $14, $23
	stereopanning $ff
	notetype $c, $25
	note __, 12
	octave 2
	note C#, 4
Music_VirbankGym_Ch3_loop: ; f4a3c
	octave 2
	note A#, 2
	note B_, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	callchannel Music_VirbankGym_Ch3_branch_1
	note A_, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 2
	callchannel Music_VirbankGym_Ch3_branch_2
	note G_, 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 2
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F_, 2
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 3
	note F#, 2
	octave 2
	note F#, 1
	note __, 1
	note A#, 2
	note F#, 2
	callchannel Music_VirbankGym_Ch3_branch_3
	callchannel Music_VirbankGym_Ch3_branch_1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A#, 2
	callchannel Music_VirbankGym_Ch3_branch_1
	callchannel Music_VirbankGym_Ch3_branch_3
	callchannel Music_VirbankGym_Ch3_branch_1
	note F_, 2
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note A#, 3
	note __, 1
	callchannel Music_VirbankGym_Ch3_branch_4
	callchannel Music_VirbankGym_Ch3_branch_1
	note G#, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 2
	callchannel Music_VirbankGym_Ch3_branch_2
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 3
	note D#, 2
	octave 2
	note G#, 1
	note __, 1
	note B_, 2
	note G#, 1
	note __, 1
	note F#, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 3
	note E_, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note C#, 2
	octave 2
	note A_, 2
	callchannel Music_VirbankGym_Ch3_branch_4
	callchannel Music_VirbankGym_Ch3_branch_1
	note G#, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note A_, 1
	octave 3
	note E_, 2
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note B_, 2
	note F#, 2
	octave 3
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 2
	note A#, 2
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 2
	note G#, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 3
	note C#, 2
	note D#, 2
	note E_, 2
	note __, 1
	note E_, 1
	octave 2
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 3
	note E_, 2
	octave 2
	note E_, 1
	note __, 1
	octave 3
	note F_, 2
	note F#, 2
	note __, 1
	note F#, 1
	octave 2
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 3
	note F#, 2
	octave 2
	note F#, 1
	note __, 1
	octave 3
	note A#, 2
	note B_, 2
	note __, 1
	note B_, 1
	octave 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	note B_, 2
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note A#, 2
	note B_, 2
	note __, 1
	note B_, 1
	octave 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	note C#, 4
	loopchannel 0, Music_VirbankGym_Ch3_loop

Music_VirbankGym_Ch3_branch_1:
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	endchannel
	
Music_VirbankGym_Ch3_branch_2:
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	endchannel
	
Music_VirbankGym_Ch3_branch_3:
	note A#, 2
	note B_, 2
	note __, 2
	note A#, 2
	endchannel
	
Music_VirbankGym_Ch3_branch_4:
	note A#, 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A#, 2
	endchannel

Music_VirbankGym_Ch4:
	togglenoise $4
	notetype $6
	note B_, 8
	note B_, 8
	note B_, 4
	note C#, 2
	note C#, 2
	note D#, 4
	note F#, 4
Music_VirbankGym_Ch4_loop:
	note E_, 4
	note F#, 4
	note D#, 4
	note F#, 4
	callchannel Music_VirbankGym_Ch4_branch_1
	note E_, 2
	note A_, 2
	note F#, 2
	note E_, 2
	note A_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	callchannel Music_VirbankGym_Ch4_branch_1
	note E_, 4
	note B_, 6
	note B_, 6
	note A#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note D_, 2
	callchannel Music_VirbankGym_Ch4_branch_1
	note E_, 4
	note B_, 4
	note B_, 4
	note E_, 4
	note B_, 4
	note B_, 4
	note C#, 2
	note C#, 2
	note D_, 2
	note D_, 2
	callchannel Music_VirbankGym_Ch4_branch_1
	note E_, 4
	note B_, 4
	note B_, 4
	note E_, 4
	note B_, 4
	note B_, 4
	note C#, 2
	note C#, 2
	note D_, 2
	note D_, 2
	callchannel Music_VirbankGym_Ch4_branch_1
	note A#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note D_, 2
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note B_, 8
	loopchannel 0, Music_VirbankGym_Ch4_loop

Music_VirbankGym_Ch4_branch_1:
	note E_, 4
	note F#, 4
	note D#, 4
	note F#, 4
	loopchannel 6, Music_VirbankGym_Ch4_branch_1
	endchannel