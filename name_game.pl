% ===== Lab 9 - The Name Game =====

% letter/1 changes while the program runs, so it must be dynamic
:- dynamic letter/1.

% The starting set of letters
letter(a).
letter(b).
letter(c).

% Start the game
start :-
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

% Show the menu, read the choice, do it, then show the menu again
menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    choice(Choice),
    (   Choice == 7
    ->  true                 % stop
    ;   menu                 % show the menu again
    ).

% 1- Display the current set of letters
choice(1) :- !,
    findall(X, letter(X), List),
    write('Current letters: '), write(List), nl.

% 2- Add a letter (assert adds it to the end)
choice(2) :- !,
    write('Enter the letter: '), nl, read(L),
    assert(letter(L)),
    write(L), write(' was added.'), nl.

% 3- Add a letter at the top (asserta = first)
choice(3) :- !,
    write('Enter the letter: '), nl, read(L),
    asserta(letter(L)),
    write(L), write(' was added at the top.'), nl.

% 4- Add a letter at the bottom (assertz = last)
choice(4) :- !,
    write('Enter the letter: '), nl, read(L),
    assertz(letter(L)),
    write(L), write(' was added at the bottom.'), nl.

% 5- Delete a letter (retract removes the first match)
choice(5) :- !,
    write('Enter the letter to delete: '), nl, read(L),
    (   retract(letter(L))
    ->  write(L), write(' was deleted.'), nl
    ;   write(L), write(' is not in the set.'), nl
    ).

% 6- Delete all letters
choice(6) :- !,
    retractall(letter(_)),
    write('All letters were deleted.'), nl.

% 7- Exit
choice(7) :- !,
    write('Goodbye!'), nl.

% Any other input
choice(_) :-
    write('Invalid choice, please enter a number from 1 to 7.'), nl.
