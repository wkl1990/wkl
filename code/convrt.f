*-----------------------------------------------------------------*
	Program CONVRT
*
*  This program reads an input value in kilowatt-hours,
*  and then converts it to joules.  Both values are printed.
*
	Real KWH, JOULES
*
	Print*, 'Enter energy in kilowatt-hours'
	Read*, KWH
*
	JOULES = 3.6E+06*KWH
*
	Print 5, KWH, JOULES
5	FORMAT(1X,F6.2,' Kilowatt-hours = ',E9.2, ' Joules')
*
	end
*-----------------------------------------------------------------*