			SETLOC	604
			OCT	0			# VAC4USE
EMPSTART	TC NEWMODEX		# Replace program indicator with 23
			MM 23
OPTCAL		TC INTPRET		# Set up marking info
			SSP
			MARKSTAT
			0
			SSP      CLEAR
			MARKINDX
			1
			TARG2FLG
			CLEAR    SSP
			TARG1FLG
			STARIND
			0
			SSP      CLEAR
			BESTI
			0
			R57FLAG
			CLEAR    EXIT
			V94FLAG
			TC       INTPRET
			RTB
				E/CALL
			CADR	R57    # Perform optics cal
			RTB
				E/CALL
			CADR	R53    # Perform mark
			EXIT
COPYANGS	EBANK= MRKBUF1
			INHINT
            CAF     EBANK7 # Make sure data is stored in correct EBANK
            TS      EBANK
			CA MARKSTAT	   # Obtain mark data and place in correct
			MASK LOW10	   # spot for mark display
			TS MARKDATA
			EXTEND
			INDEX MARKDATA
			DCA 0
			DXCH DSPTEM1
			INDEX MARKDATA
			CA 3
			XCH MRKBUF1 +3
			INDEX MARKDATA
			CA 5
			XCH MRKBUF1 +5
			RELINT
			TC DSPANGS
			OCT 0		# VAC5USE
DSPANGS		CA V0687	# Show mark optics position
			TC BANKCALL
			CADR E/BKCALL
			CADR GOFLASH
			TC GOTOPOOH
			TC +2
			TC DSPANGS
DSPTIME		CA V0634    # Show mark time
			TC BANKCALL
			CADR E/BKCALL
			CADR GOFLASH
			TC GOTOPOOH
			TC +2
			TC DSPTIME
REPEAT?		CA CHKCODE	# Take another mark?
			TC BANKCALL
			CADR E/BKCALL
			CADR GOPERF1
			TC GOTOPOOH
			TC GOTOPOOH
CLEANUP		CA MARKDATA + 1
			TS MARKDATA
			TC OPTCAL
V0687		VN 0687
V0634		VN 0634
CHKCODE		OCT 17

			SETLOC 1045
			OCT 10001
			OCT 605
			OCT 14007