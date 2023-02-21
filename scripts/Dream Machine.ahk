Difficulty = 0
Assist = 1

Loop {
	Tooltip, Weapon 3,0,0
	Loop, 60 {
			send r123{Tab}
			click left, down
			sleep 100
			click left, up
			sleep 250
	}
	send {shift}
	sleep 1000
	Tooltip, Weapon 2,0,0
	Loop, 4 {
		send q123{Tab}
		click left, down
		sleep 100
		click left, up
		sleep 250
	}
	Tooltip, Weapon 3,0,0
	Loop, 60 {
			send r123{Tab}
			click left, down
			sleep 100
			click left, up
			sleep 250
	}
	send {shift}
	sleep 1000
	Tooltip, Weapon 2,0,0
	Loop, 4 {
		send e123{Tab}
		click left, down
		sleep 100
		click left, up
		sleep 250
	}
}
