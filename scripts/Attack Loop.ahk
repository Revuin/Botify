	Tooltip, Weapon 2,0,0 ;Weapon 2
	Loop, 20
	{
		send e
		sleep 100
		send 123
		click left, down
		sleep 100
		click left, up
	}
	send {shift}
	sleep 500
	
	Tooltip, Weapon 1,0,0 ;Weapon 1
	Loop, 20
	{
	send q
	sleep 100
	send 123
	click left, down
	sleep 100
	click left, up
	}
	send {shift}
	sleep 500

	Tooltip, Weapon 3 jump,0,0 ;Weapon 3
	send r
	sleep 500
	Loop, 10
	{
		send r1
		sleep 100
		click left, down
		sleep 100
		click left, up
	}
	Loop, 4
	{
		send r1{Space}
		sleep 500
		click left, down
		sleep 100
		click left, up
		sleep 400
	}
	
	Tooltip, Weapon 3,0,0
	Loop, 70 {
		send r23{Tab}
		sleep 100
		click left, down
		sleep 100
		click left, up
		sleep 100
	}