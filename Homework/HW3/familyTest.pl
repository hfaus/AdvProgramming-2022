% This is the Prolog version of the family example

child(john,sue).    child(john,sam).
child(jane,sue).    child(jane,sam).
child(sue,george).  child(sue,gina).
child(bob,jane).    child(bob,bill).
child(june,jane).   child(june,bill).
child(jacob,lily).  child(jacob,sam).
child(louise,john). child(louise,marsha).
child(anna, mark).  child(anna,gina).
child(chet,fred).   child(chet,anna).
child(jim,chet).    child(jim, emma).
child(marsha,marx).
child(bill,marx).
child(lisa,jim).   child(lisa,barb).

male(john).   male(sam).     male(george).
male(bob).    male(jacob).   male(bill).
male(chet).   male(fred).    male(mark).
male(jim).    male(marx).

female(sue).  female(jane).  female(june).
female(gina). female(lily).  female(louise).
female(marsha).  female(anna).  female(emma).
female(lisa).  female(barb).

parent(Y,X) :- child(X,Y).

father(Y,X) :- child(X,Y), male(Y).

opp_sex(X,Y) :- male(X), female(Y).
opp_sex(Y,X) :- male(X), female(Y).

grand_father(X,Z) :- father(X,Y), parent(Y,Z).

:- ['Pr3.pl'].


%tests

score:- write('>>>>>>>>>Begin Test<<<<<<<<<<<'),nl,
	scoreQ1(S1),write(' S1 = '),write(S1),nl,
	scoreQ2(S2),write(' S2 = '),write(S2),nl,
	scoreQ3(S3),write(' S3 = '),write(S3),nl,
	scoreQ4(S4),write(' S4 = '),write(S4),nl,
	scoreQ5(S5),write(' S5 = '),write(S5),nl,
	scoreQ6(S6),write(' S6 = '),write(S6),nl,
	scoreQ7(S7),write(' S7 = '),write(S7),nl,
	scoreQ8(S8),write(' S8 = '),write(S8),nl,
	scoreQ9(S9),write(' S9 = '),write(S9),nl,
	write('--------------'),nl,
	write('Total = '),S is S1+S2+S3+S4+S5+S6+S7+S8+S9, write(S),
	      write('  (+ up to 10 for write_descendant_child)'),nl,nl,
	write('write_descendant_chain(jim,anna)'),nl,
	(write_descendant_chain(jim,anna);true),nl,
	write('write_descendant_chain(louise,gina)'),nl,
	(write_descendant_chain(louise,gina);true),nl,
	write('write_descendant_chain(emma,lily)'),nl,
	(write_descendant_chain(emma,lily);true),nl,
	write('>>>>>>>>>End of Test<<<<<<<<<<<').










scoreQ1(S):- scoreQ1mother(Smother),scoreQ1GP(SGP),scoreQ1GGM(SGGM),
	S is Smother + SGP + SGGM.
scoreQ1mother(Smother):- findall([M,C],mother(M,C),MCs),
	                 TRUE_MCs=[[anna,chet],[barb,lisa],[emma,jim],[gina,anna],[gina,sue],[jane,bob],[jane,june],[lily,jacob],[marsha,louise],[sue,jane],[sue,john]],
			 sort(MCs,SMCs),
			 ((SMCs=TRUE_MCs,Smother is 3) ; (\+ SMCs = TRUE_MCs,Smother is 0)) .

scoreQ1GP(SGP):-findall([X,Y],grand_parent(X,Y),XYs),
	                 TRUEs=[[anna,jim],[chet,lisa],[emma,lisa],[fred,jim],[george,jane],[george,john],[gina,chet],[gina,jane],[gina,john],[mark,chet],[marx,bob],[marx,june],[marx,louise],[sam,bob],[sam,june],[sam,louise],[sue,bob],[sue,june],[sue,louise]],
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,SGP is 3) ; (\+ SXYs = TRUEs,SGP is 0)) .


scoreQ1GGM(SGGM):-findall([X,Y],great_grand_mother(X,Y),XYs),
	                 TRUEs=[[anna,lisa],[gina,bob],[gina,jim],[gina,june],[gina,louise]],
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,SGGM is 4) ; (\+ SXYs = TRUEs,SGGM is 0)) .


scoreQ2(S):-scoreSibling(Ssibling),scoreBrother(Sbrother),scoreSister(Ssister),
	S is Ssibling+Sbrother+Ssister.

scoreSibling(S):-findall([X,Y],sibling(X,Y),XYs),
	                 TRUEs=[[anna,sue],[bill,marsha],[bob,june],[jacob,jane],[jacob,john],[jane,jacob],[jane,john],[john,jacob],[john,jane],[june,bob],[marsha,bill],[sue,anna]],
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,S is 4) ; (\+ SXYs = TRUEs,S is 0)) .

scoreBrother(S):-findall([X,Y],brother(X,Y),XYs),
	                 TRUEs=   [[bill,marsha],[bob,june],[jacob,jane],[jacob,john],[john,jacob],[john,jane]] ,
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,S is 3) ; (\+ SXYs = TRUEs,S is 0)) .

scoreSister(S):-findall([X,Y],sister(X,Y),XYs),
	                 TRUEs=[[anna,sue],[jane,jacob],[jane,john],[june,bob],[marsha,bill],[sue,anna]],
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,S is 3) ; (\+ SXYs = TRUEs,S is 0)) .


scoreQ3(S):-scoreHalfSib(Shalf),scoreFullSib(Sfull),
	S is Shalf+Sfull.

scoreHalfSib(S):-findall([X,Y],half_sibling(X,Y),XYs),
	                 TRUEs= [[anna,sue],[jacob,jane],[jacob,john],[jane,jacob],[john,jacob],[sue,anna]],
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,S is 5) ; (\+ SXYs = TRUEs,S is 0)).

scoreFullSib(S):-findall([X,Y],full_sibling(X,Y),XYs),
	                 TRUEs=[[bob,june],[jane,john],[john,jane],[june,bob]],
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,S is 5) ; (\+ SXYs = TRUEs,S is 0)).

scoreQ4(S):-score_first_cousin(Sfc),score_second_cousin(Ssc),
	S is Sfc+Ssc.

score_first_cousin(S):-findall([X,Y],first_cousin(X,Y),XYs),
	                 TRUEs=[[bob,louise],[chet,jane],[chet,john],[jane,chet],[john,chet],[june,louise],[louise,bob],[louise,june]],
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,S is 5) ; (\+ SXYs = TRUEs,S is 0)).

score_second_cousin(S):-findall([X,Y],second_cousin(X,Y),XYs),
	                 TRUEs= [[bob,jim],[jim,bob],[jim,june],[jim,louise],[june,jim],[louise,jim]],
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,S is 5) ; (\+ SXYs = TRUEs,S is 0)).

scoreQ5(S):- scoreHFC(Shfc),scoreDFC(Sdfc),
	S is Shfc+Sdfc.

scoreHFC(S):-findall([X,Y],half_first_cousin(X,Y),XYs),
	                 TRUEs=[[chet,jane],[chet,john],[jane,chet],[john,chet]],
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,S is 5) ; (\+ SXYs = TRUEs,S is 0)).

scoreDFC(S):-findall([X,Y],double_first_cousin(X,Y),XYs),
	                 TRUEs=[[bob,louise],[june,louise],[louise,bob],[louise,june]],
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,S is 5) ; (\+ SXYs = TRUEs,S is 0)).

scoreQ6(S):-findall([X,Y],first_cousin_twice_removed(X,Y),XYs),
	                 TRUEs=[[jane,lisa],[john,lisa],[lisa,jane],[lisa,john]],
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,S is 10) ; (\+ SXYs = TRUEs,S is 0)).

scoreQ7(S):- scoreAncestor(Sa),scoreDescendant(Sd),
	S is Sa+Sd.

scoreDescendant(S):-findall([X,Y],descendant(X,Y),XYs),
	                 TRUEs=[[anna,gina],[anna,mark],[bill,marx],[bob,bill],[bob,george],[bob,gina],[bob,jane],[bob,marx],[bob,sam],[bob,sue],[chet,anna],[chet,fred],[chet,gina],[chet,mark],[jacob,lily],[jacob,sam],[jane,george],[jane,gina],[jane,sam],[jane,sue],[jim,anna],[jim,chet],[jim,emma],[jim,fred],[jim,gina],[jim,mark],[john,george],[john,gina],[john,sam],[john,sue],[june,bill],[june,george],[june,gina],[june,jane],[june,marx],[june,sam],[june,sue],[lisa,anna],[lisa,barb],[lisa,chet],[lisa,emma],[lisa,fred],[lisa,gina],[lisa,jim],[lisa,mark],[louise,george],[louise,gina],[louise,john],[louise,marsha],[louise,marx],[louise,sam],[louise,sue],[marsha,marx],[sue,george],[sue,gina]],
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,S is 5) ; (\+ SXYs = TRUEs,S is 0)).

scoreAncestor(S):-findall([X,Y],ancestor(X,Y),XYs),
	                 TRUEs=[[anna,chet],[anna,jim],[anna,lisa],[barb,lisa],[bill,bob],[bill,june],[chet,jim],[chet,lisa],[emma,jim],[emma,lisa],[fred,chet],[fred,jim],[fred,lisa],[george,bob],[george,jane],[george,john],[george,june],[george,louise],[george,sue],[gina,anna],[gina,bob],[gina,chet],[gina,jane],[gina,jim],[gina,john],[gina,june],[gina,lisa],[gina,louise],[gina,sue],[jane,bob],[jane,june],[jim,lisa],[john,louise],[lily,jacob],[mark,anna],[mark,chet],[mark,jim],[mark,lisa],[marsha,louise],[marx,bill],[marx,bob],[marx,june],[marx,louise],[marx,marsha],[sam,bob],[sam,jacob],[sam,jane],[sam,john],[sam,june],[sam,louise],[sue,bob],[sue,jane],[sue,john],[sue,june],[sue,louise]],
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,S is 5) ; (\+ SXYs = TRUEs,S is 0)).



scoreQ8(S):-findall([X,Y],cousin(X,Y),XYs),
	                 TRUEs=[[bob,jim],[bob,louise],[chet,jane],[chet,john],[jane,chet],[jim,bob],[jim,june],[jim,louise],[john,chet],[june,jim],[june,louise],[louise,bob],[louise,jim],[louise,june]],
			 sort(XYs,SXYs),
			 ((SXYs=TRUEs,S is 10) ; (\+ SXYs = TRUEs,S is 0)).

scoreQ9(S):-findall([X,Y,Z],closest_common_ancestor(X,Y,Z),XYZs),
	                 TRUEs=[[anna,bob,gina],[anna,chet,gina],[anna,chet,mark],[anna,jane,gina],[anna,jim,gina],[anna,jim,mark],[anna,john,gina],[anna,june,gina],[anna,lisa,gina],[anna,lisa,mark],[anna,louise,gina],[anna,sue,gina],[bill,bob,marx],[bill,june,marx],[bill,louise,marx],[bill,marsha,marx],[bob,anna,gina],[bob,bill,marx],[bob,chet,gina],[bob,jacob,sam],[bob,jane,sam],[bob,jane,sue],[bob,jim,gina],[bob,john,sam],[bob,john,sue],[bob,june,bill],[bob,june,jane],[bob,lisa,gina],[bob,louise,marx],[bob,louise,sam],[bob,louise,sue],[bob,marsha,marx],[bob,sue,george],[bob,sue,gina],[chet,anna,gina],[chet,anna,mark],[chet,bob,gina],[chet,jane,gina],[chet,jim,anna],[chet,jim,fred],[chet,john,gina],[chet,june,gina],[chet,lisa,anna],[chet,lisa,fred],[chet,louise,gina],[chet,sue,gina],[jacob,bob,sam],[jacob,jane,sam],[jacob,john,sam],[jacob,june,sam],[jacob,louise,sam],[jane,anna,gina],[jane,bob,sam],[jane,bob,sue],[jane,chet,gina],[jane,jacob,sam],[jane,jim,gina],[jane,john,sam],[jane,john,sue],[jane,june,sam],[jane,june,sue],[jane,lisa,gina],[jane,louise,sam],[jane,louise,sue],[jane,sue,george],[jane,sue,gina],[jim,anna,gina],[jim,anna,mark],[jim,bob,gina],[jim,chet,anna],[jim,chet,fred],[jim,jane,gina],[jim,john,gina],[jim,june,gina],[jim,lisa,chet],[jim,lisa,emma],[jim,louise,gina],[jim,sue,gina],[john,anna,gina],[john,bob,sam],[john,bob,sue],[john,chet,gina],[john,jacob,sam],[john,jane,sam],[john,jane,sue],[john,jim,gina],[john,june,sam],[john,june,sue],[john,lisa,gina],[john,louise,sam],[john,louise,sue],[john,sue,george],[john,sue,gina],[june,anna,gina],[june,bill,marx],[june,bob,bill],[june,bob,jane],[june,chet,gina],[june,jacob,sam],[june,jane,sam],[june,jane,sue],[june,jim,gina],[june,john,sam],[june,john,sue],[june,lisa,gina],[june,louise,marx],[june,louise,sam],[june,louise,sue],[june,marsha,marx],[june,sue,george],[june,sue,gina],[lisa,anna,gina],[lisa,anna,mark],[lisa,bob,gina],[lisa,chet,anna],[lisa,chet,fred],[lisa,jane,gina],[lisa,jim,chet],[lisa,jim,emma],[lisa,john,gina],[lisa,june,gina],[lisa,louise,gina],[lisa,sue,gina],[louise,anna,gina],[louise,bill,marx],[louise,bob,marx],[louise,bob,sam],[louise,bob,sue],[louise,chet,gina],[louise,jacob,sam],[louise,jane,sam],[louise,jane,sue],[louise,jim,gina],[louise,john,sam],[louise,john,sue],[louise,june,marx],[louise,june,sam],[louise,june,sue],[louise,lisa,gina],[louise,marsha,marx],[louise,sue,george],[louise,sue,gina],[marsha,bill,marx],[marsha,bob,marx],[marsha,june,marx],[marsha,louise,marx],[sue,anna,gina],[sue,bob,george],[sue,bob,gina],[sue,chet,gina],[sue,jane,george],[sue,jane,gina],[sue,jim,gina],[sue,john,george],[sue,john,gina],[sue,june,george],[sue,june,gina],[sue,lisa,gina],[sue,louise,george],[sue,louise,gina]],
			 sort(XYZs,SXYZs),
			 ((SXYZs=TRUEs,S is 10) ; (\+ SXYZs = TRUEs,S is 0)).


:- score.
