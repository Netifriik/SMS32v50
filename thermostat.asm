	CLO

check:
	MOV	AL,0
	OUT	03

	IN	03
	AND	AL,1
	JZ	soojust

soojust:
	MOV	AL,80
	OUT	03
	JMP	check

	END