%yours
%Q1
mother(M,C):-
parent(M,C),female(M).

grand_parent(GP,GC):-
parent(GP,P),parent(P,GC).

great_grand_mother(GGM,GGC):-
female(GGM),
parent(GGM,GM),parent(GM,P),parent(P,GGC).

%Q2
sibling(A,B):-
parent(P,A),parent(P,B), \+ A = B.

brother(B,Sib):-
parent(P,B),parent(P,Sib),
male(B), \+ B = Sib.

sister(S,Sib):-
parent(P,S), parent(P,Sib),
female(S), \+ S = Sib.

%Q3 --
%You have to know both parents for both siblings for half_sibling
half_sibling(S1,S2):-
(parent(P1,S1),parent(P1,S2)),
(parent(P2,S1),parent(P3,S2)),
\+ P1 = P2, \+ P1 = P3, \+ P2 = P3, \+ S1 = S2.

full_sibling(S1,S2):-
(parent(P1,S1),parent(P1,S2)),
(parent(P2,S1),parent(P2,S2)),
\+ P1 = P2, \+ S1 = S2.

%Q4
first_cousin(C1,C2):-
parent(GP,P1),parent(P1,C1),
parent(GP,P2),parent(P2,C2),
\+ P1 = P2, \+ C1 = C2.

second_cousin(C1,C2):-
parent(GGP,GP1),parent(GP1,P1),parent(P1,C1),
parent(GGP,GP2),parent(GP2,P2),parent(P2,C2),
\+ GP1 = GP2, \+ P1 = P2, \+ C1 = C2.

%Q5
half_first_cousin(C1,C2):-
parent(Par1,C1),parent(Par2,C2),
(parent(P1,Par1),parent(P1,Par2)),
(parent(P2,Par1),parent(P3,Par2)),
\+ P1 = P2, \+ P1 = P3, \+ P2 = P3, \+ Par1 = Par2.

double_first_cousin(C1,C2):-
parent(Par1C1,C1),parent(Par2C1,C1),
parent(Par1C2,C2),parent(Par2C2,C1),
((parent(P1,Par1C1),parent(P1,Par1C2));
(parent(P1,Par1C1),parent(P1,Par2C2))),
((parent(P2,Par2C1),parent(P2,Par1C2));
(parent(P2,Par2C1),parent(P2,Par2C2))),
\+ C1 = C2, \+ P1 = P2,
\+ Par1C2 = Par2C2, \+ Par1C1 = Par2C1,
\+ Par1C1 = Par1C2, \+ Par1C1 = Par1C2,
\+ Par2C1 = Par1C2, \+ Par2C1 = Par1C2.

%Q6 - cousins grand parent, cousins grandchild, grandparents cousin
% check grandparents cousin
first_cousin_twice_removed(C1,C2):-
grand_parent(GP1,C2),first_cousin(C1,GP1).
% check cousins grandchild
first_cousin_twice_removed(C1,C2):-
first_cousin(Cous2,C2),
child(P,Cous2),child(C1,P).

%Q7
descendant(D,A):-
child(D,A).
descendant(D,A):- 
child(D,P), descendant(P,A).

ancestor(A,D):-
descendant(D,A).

%Q8
%this version of "cousin" does not handle "____ removed",
%read description carefully
cousin(X,Y):-
parent(P1,X),parent(P2,Y),(sibling(P1,P2);cousin(P1,P2)).


%Q9
%do not return anything for closest_common_ancestor(X,X,A).
closest_common_ancestor(R1,R2,A):-
ancestor(A,R1),ancestor(A,R2),
\+ (child(X,A),  ancestor(X,R1), ancestor(X,R2)),
\+ R1 = R2.

% Q10 -- not scored, but will do
%   write_descendant_chain(jim,anna) and
%   write_descendant_chain(louise,gina) and
%   write_descendant_chain(emma,lily) <-this one shold print nothing
%   (make sure this does not fail (read the instructions carefully)).

write_child(X,Y):-
	write(X), write(' is a child of '), write(Y), nl.

write_descendant_chain(X,Y):-
child(X,Y), write_child(X,Y).

write_descendant_chain(X,Y):-
descendant(X,Y), child(X,P), write_child(X,P), write_descendant_chain(P,Y).
