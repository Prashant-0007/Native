; Listing generated by Microsoft (R) Optimizing Compiler Version 19.24.28315.0 

include listing.inc

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	a
PUBLIC	b
_DATA	SEGMENT
COMM	div_1:DWORD
COMM	div_2:DWORD
_DATA	ENDS
_DATA	SEGMENT
a	DD	07H
b	DD	04H
_DATA	ENDS
PUBLIC	__local_stdio_printf_options
PUBLIC	_vfprintf_l
PUBLIC	printf
PUBLIC	main
EXTRN	__acrt_iob_func:PROC
EXTRN	__stdio_common_vfprintf:PROC
EXTRN	exit:PROC
EXTRN	_fltused:DWORD
_DATA	SEGMENT
COMM	?_OptionsStorage@?1??__local_stdio_printf_options@@9@9:QWORD							; `__local_stdio_printf_options'::`2'::_OptionsStorage
_DATA	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$_vfprintf_l DD imagerel $LN3
	DD	imagerel $LN3+67
	DD	imagerel $unwind$_vfprintf_l
pdata	ENDS
;	COMDAT pdata
pdata	SEGMENT
$pdata$printf DD imagerel $LN3
	DD	imagerel $LN3+87
	DD	imagerel $unwind$printf
pdata	ENDS
pdata	SEGMENT
$pdata$main DD	imagerel $LN3
	DD	imagerel $LN3+97
	DD	imagerel $unwind$main
pdata	ENDS
_DATA	SEGMENT
$SG10415 DB	'div_1=%d, div_2=%.4f', 0aH, 00H
_DATA	ENDS
xdata	SEGMENT
$unwind$main DD	010401H
	DD	04204H
xdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$printf DD 011801H
	DD	06218H
xdata	ENDS
;	COMDAT xdata
xdata	SEGMENT
$unwind$_vfprintf_l DD 011801H
	DD	06218H
xdata	ENDS
; Function compile flags: /Odtp
_TEXT	SEGMENT
main	PROC
; File C:\Users\yoges\OneDrive\Documents\CPA\CLASS\C\MST_2\SESSION_096\casting_app1.c
; Line 11
$LN3:
	sub	rsp, 40					; 00000028H
; Line 12
	mov	eax, DWORD PTR a
	cdq
	idiv	DWORD PTR b
	mov	DWORD PTR div_1, eax
; Line 13
	cvtsi2ss xmm0, DWORD PTR a
	cvtsi2ss xmm1, DWORD PTR b
	divss	xmm0, xmm1
	movss	DWORD PTR div_2, xmm0
; Line 14
	cvtss2sd xmm0, DWORD PTR div_2
	movaps	xmm2, xmm0
	movq	r8, xmm2
	mov	edx, DWORD PTR div_1
	lea	rcx, OFFSET FLAT:$SG10415
	call	printf
; Line 15
	xor	ecx, ecx
	call	exit
$LN2@main:
; Line 16
	add	rsp, 40					; 00000028H
	ret	0
main	ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
;	COMDAT printf
_TEXT	SEGMENT
_Result$ = 32
_ArgList$ = 40
_Format$ = 64
printf	PROC						; COMDAT
; File C:\Program Files (x86)\Windows Kits\10\include\10.0.18362.0\ucrt\stdio.h
; Line 954
$LN3:
	mov	QWORD PTR [rsp+8], rcx
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+32], r9
	sub	rsp, 56					; 00000038H
; Line 957
	lea	rax, QWORD PTR _Format$[rsp+8]
	mov	QWORD PTR _ArgList$[rsp], rax
; Line 958
	mov	ecx, 1
	call	__acrt_iob_func
	mov	r9, QWORD PTR _ArgList$[rsp]
	xor	r8d, r8d
	mov	rdx, QWORD PTR _Format$[rsp]
	mov	rcx, rax
	call	_vfprintf_l
	mov	DWORD PTR _Result$[rsp], eax
; Line 959
	mov	QWORD PTR _ArgList$[rsp], 0
; Line 960
	mov	eax, DWORD PTR _Result$[rsp]
; Line 961
	add	rsp, 56					; 00000038H
	ret	0
printf	ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
;	COMDAT _vfprintf_l
_TEXT	SEGMENT
_Stream$ = 64
_Format$ = 72
_Locale$ = 80
_ArgList$ = 88
_vfprintf_l PROC					; COMDAT
; File C:\Program Files (x86)\Windows Kits\10\include\10.0.18362.0\ucrt\stdio.h
; Line 642
$LN3:
	mov	QWORD PTR [rsp+32], r9
	mov	QWORD PTR [rsp+24], r8
	mov	QWORD PTR [rsp+16], rdx
	mov	QWORD PTR [rsp+8], rcx
	sub	rsp, 56					; 00000038H
; Line 643
	call	__local_stdio_printf_options
	mov	rcx, QWORD PTR _ArgList$[rsp]
	mov	QWORD PTR [rsp+32], rcx
	mov	r9, QWORD PTR _Locale$[rsp]
	mov	r8, QWORD PTR _Format$[rsp]
	mov	rdx, QWORD PTR _Stream$[rsp]
	mov	rcx, QWORD PTR [rax]
	call	__stdio_common_vfprintf
; Line 644
	add	rsp, 56					; 00000038H
	ret	0
_vfprintf_l ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
;	COMDAT __local_stdio_printf_options
_TEXT	SEGMENT
__local_stdio_printf_options PROC			; COMDAT
; File C:\Program Files (x86)\Windows Kits\10\include\10.0.18362.0\ucrt\corecrt_stdio_config.h
; Line 88
	lea	rax, OFFSET FLAT:?_OptionsStorage@?1??__local_stdio_printf_options@@9@9 ; `__local_stdio_printf_options'::`2'::_OptionsStorage
; Line 89
	ret	0
__local_stdio_printf_options ENDP
_TEXT	ENDS
END
