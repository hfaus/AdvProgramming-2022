/* New syntax (Prolog): variables begin with upper case or _ and lower case is for constants
% Comments can be either '/*' or '%'

/*
Atomic sentences:
    john is a child of sue.     john is a child of sam.
    jane is a child of sue.     jane is a child of sam.
    sue is a child of george.   sue is a child of gina.

    john is male.       jane is female.     june is female.
    sam is male.        sue is female.      george is male.

Conditional sentences:
    If X is a child of Y then Y is a parent of X.
    If X is a child of Y and Y is a male then Y is a father of X.
    If X is a male and Y is female then X is the opposite sex from Y.
    If X is male and Y is female then Y is the opposite sex from X.
    If X is a father of Y and Y is a parent of Z then X is the grandfather of Z.

Backchaining (returns success of failure):
    To establish a sentence Q (query):
    ...
    desirable features:
        - goal-directed
        - sound
        - complete (sometimes)
        - forms the basis of prolog programming
*/

% example - establish "george is a father of sue"
- no atomic rule for father
- there is a conditional rule "If X is a child of Y and Y is a male then Y is a father of X."
    sue is a child of george (success)
        &&
    george is a male (success)
        so
    george is a father of sue (success)

% example - establish "jane is of opposite sex from george"
- no atomic rule for both
- atomic rule for jane is female
- there is a conditional rule "If X is male and Y is female then Y is the opposite sex from X."
    jane is not male (failure)
        so...
    go back, atomic rule for george is male (success)
        &&
    atomic rule for jane is female (success)
        so
    george is the opposite sex of jane (success)
    
% This sis the Prolog version of the family example 
child(john,sue).    child(john,sam).
child(jane,sue).    child(jane,sam).
child(sue,george).  child(sue,gina).

male(john).     male(sam).      male(george).
female(sue).    female(jane).   female(june).

parent(Y,X) :- child(X,Y).
father(Y,X) :- child(X,Y).
opp_sex(X,Y) :- male(X), female(Y).
opp_sex(Y,X) :- male(X), female(Y).
grand_father(X,Z) :- father(X,Y), parent(Y,Z).

/*
:- is like 'if'
*/