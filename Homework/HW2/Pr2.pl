% you need to replace, e.g., "D='fix this'" with a valid query.
% ?- ['/Users/hannahfaus/program-2-hfaus/Pr2KBandTest.pl']
% |    .

%Did Leonardo DiCaprio act in Babel?
q1 :- acted_in('Leonardo DiCaprio','Babel').

%Who directed District 9?
q2(D) :- directed(D,'District 9').

%Did anyone act in Both Click and The Aviator
q3(A) :- acted_in(A,'Click'),acted_in(A,'The Aviator').

%Was there a move released in 2010 that did not star Jennifer Aniston?
q4(M) :- released(M,2010),\+ acted_in('Jennifer Aniston',M).

%Who directed movies released in 2009? (don't worry about ; part)
q5(D) :- released(Movie,2009),directed(D,Movie).

%Has anyone directed more than one movie?
q6(D) :- directed(D,Movie1),directed(D,Movie2),\+ Movie1=Movie2.

%Does any movie have more than one director?
q7(M) :- directed(Dir1,M),directed(Dir2,M),\+ Dir1=Dir2.

%Has anyone acted in more than one movie released in 2008?
q8(A) :- acted_in(A,Movie1),released(Movie1,2008),acted_in(A,Movie2),released(Movie2,2008),\+ Movie1 = Movie2.

%Has anyone acted in more than two movies in the same year?
q9(A) :- acted_in(A,Movie1),released(Movie1,Year),
acted_in(A,Movie2),released(Movie2,Year),
acted_in(A,Movie3),released(Movie3,Year),
\+ Movie1 = Movie2, \+ Movie1 = Movie3, \+ Movie2 = Movie3.

%Who has worked with the same director in different years?
q10(A) :- acted_in(A,Movie1),acted_in(A,Movie2),
released(Movie1,Year1),released(Movie2,Year2),
\+ Year1 = Year2,
directed(Director,Movie1),directed(Director,Movie2).