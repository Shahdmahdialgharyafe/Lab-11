==================================================
  >>> THIS README IS FOR: LAB 11 - Name Game <<<
==================================================

ARTI - Lab 11: Input/Output and Database Manipulation
Student: Shahd Algharyafe
Tool: SWI-Prolog

Files
-----
name_game.pl -> Lab Activity: The Name Game

The Name Game
-------------
The user starts with the letters a, b, c and can add, move or
delete letters to build his/her name. The letters are stored as
dynamic facts letter/1 and changed while the program runs.

Menu:
  1- Display the current set of letters   (findall)
  2- Add a letter                          (assert)
  3- Add a letter at the top               (asserta)
  4- Add a letter at the bottom            (assertz)
  5- Delete a letter                       (retract)
  6- Delete all letters                    (retractall)
  7- Exit

Run:
  ?- start.
Then type the number of your choice followed by a full stop, e.g. 1.
Type letters in lowercase followed by a full stop, e.g. s.

Example (building the name "shahd"):
  6.          -> delete all letters
  4. s.       -> add s at the bottom
  4. h.
  4. a.
  4. h.
  4. d.
  1.          -> Current letters: [s,h,a,h,d]
  7.          -> Goodbye!
