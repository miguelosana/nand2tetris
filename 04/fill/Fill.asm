// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)

@KBD
D=M
@ON
D;JGT

@OFF
D;JEQ
(ON)
@state
M=-1
@DRAW
0;JMP

(OFF)
@state
M=0
@DRAW
0;JMP


(DRAW)
@n
M=1

@SCREEN
D=A

@addr
M=D

(EXEC)
@state
D=M

@addr
A=M
M=D

@1
D=A

@addr
M=D+M

@n
M=M+1
D=M
@8192
D=D-A
@EXEC
D;JLE

@LOOP
D;JEQ

@LOOP
0;JMP



