; Listing generated by Microsoft (R) Optimizing Compiler Version 19.24.28315.0 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

_DATA	SEGMENT
COMM	num:DWORD
_DATA	ENDS
PUBLIC	main
EXTRN	printf:PROC
EXTRN	scanf:PROC
EXTRN	exit:PROC
pdata	SEGMENT
$pdata$main DD	imagerel $LN3
	DD	imagerel $LN3+67
	DD	imagerel $unwind$main
pdata	ENDS
_DATA	SEGMENT
$SG6022	DB	'Enter an integer:', 00H
	ORG $+2
$SG6023	DB	'%d', 00H
	ORG $+1
$SG6024	DB	'Entered number is = %d', 0aH, 00H
_DATA	ENDS
xdata	SEGMENT
$unwind$main DD	010401H
	DD	04204H
xdata	ENDS
; Function compile flags: /Odtp
_TEXT	SEGMENT
main	PROC
; File C:\Users\yoges\OneDrive\Documents\CPA\CLASS\C\MST_2\SESSION_038\TEST.C
; Line 8
$LN3:
	sub	rsp, 40					; 00000028H
; Line 9
	lea	rcx, OFFSET FLAT:$SG6022
	call	printf
; Line 10
	lea	rdx, OFFSET FLAT:num
	lea	rcx, OFFSET FLAT:$SG6023
	call	scanf
; Line 11
	mov	edx, DWORD PTR num
	lea	rcx, OFFSET FLAT:$SG6024
	call	printf
; Line 12
	xor	ecx, ecx
	call	exit
; Line 13
	xor	eax, eax
	add	rsp, 40					; 00000028H
	ret	0
main	ENDP
_TEXT	ENDS
END
