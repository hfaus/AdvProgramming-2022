
%For all of these, especially the first two, see the examples in the book
%Ignore the Singleton variable warning, that goes away when you 
% define the rules. 

%europe map coloring problem -- use these colors as the domain
europe_color(Fr,Sw,It,Be,Ho,Ge,Au):-
color(Fr), color(Sw), color(It), color(Be), color(Ho), color(Ge), color(Au),
\+ Fr = Be, \+ Fr = Sw, \+ Fr = Ge, \+ Fr = It,
\+ Sw = Ge, \+ Sw = Au, \+ Sw = It,
\+ It = Au,
\+ Be = Ge, \+ Be = Ho,
\+ Ge = Ho.


cryptarithmetic(C,R,O,S,A,D,N,G,E):-
dig(S),
R is (S + S) mod 10, C1 is (S + S) // 10,
dig(D),
E is (S + D + C1) mod 10, C10 is (S + D + C1) // 10,
dig(O), dig(A),
G is (O + A + C10) mod 10, C100 is (O + A + C10) // 10,
dig(R), R > 0,
N is (R + O + C100) mod 10, C1000 is (R + O + C100) // 10,
dig(C), C > 0,
A is (C + R + C1000) mod 10, D is (C + R + C1000) // 10,
uniq_digits(C,R,O,S,A,D,N,G,E).

uniq_digits(C,R,O,S,A,D,N,G,E):-
dig(C), dig(R), dig(O), dig(S), dig(A), dig(D), dig(N), dig(G), dig(E),
\+ C = R, \+ C = O, \+ C = S, \+ C = A, \+ C = D, \+ C = N, \+ C = G, \+ C = E,
          \+ R = O, \+ R = S, \+ R = A, \+ R = D, \+ R = N, \+ R = G, \+ R = E,
                    \+ O = S, \+ O = A, \+ O = D, \+ O = N, \+ O = G, \+ O = E,
                              \+ S = A, \+ S = D, \+ S = N, \+ S = G, \+ S = E,
                                        \+ A = D, \+ A = N, \+ A = G, \+ A = E,
                                                  \+ D = N, \+ D = G, \+ D = E,
                                                            \+ N = G, \+ N = E,
                                                                      \+ G = E.


%Persons are just their names, lower case

person(doreen). person(donna). person(david). person(danny).

solution(Water,Coffee,Coke,Milk,Chicken,Lasagna,Steak,Pizza,donna,doreen,david,danny) :-
    Chicken=Coke, Water=donna,

    next_to(doreen,Steak),
    across_from(donna,doreen), across_from(david,danny),
    across_from(Milk,Lasagna),

    \+ david=Coffee, \+ danny=Steak,

    uniq_pos(Water,Coffee,Coke,Milk),
    uniq_pos(Chicken,Lasagna,Steak,Pizza),
    uniq_pos(donna,doreen,david,danny).

who_ordered_pizza(PizzaPerson):- 
    person(PizzaPerson)=Pizza.

uniq_pos(P1,P2,P3,P4) :-
    pos(P1), pos(P2), pos(P3), pos(P4),
    \+ P1 = P2, \+ P1 = P3, \+ P1 = P4,
    \+ P2 = P3, \+ P2 = P4, \+ P3 = P4.

pos(1). pos(2). pos(3). pos(4).
tl_pos(1). bl_pos(2). tr_pos(3). br_pos(4).

beside(1,3). beside(2,4). across(1,2). across(3,4).

next_to(X,Y) :- beside(X,Y).
next_to(X,Y) :- beside(Y,X).

across_from(X,Y) :- across(X,Y).
across_from(X,Y) :- across(Y,X).