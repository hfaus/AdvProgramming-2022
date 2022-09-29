


color(red).  color(blue).   color(yellow).




dig(0).  dig(1).  dig(2).  dig(3).  dig(4).
dig(5).  dig(6).  dig(7).  dig(8).  dig(9).



:-['Pr4.pl'].


score(S):- scoreQ2(S2),scoreQ3(S3),scoreQ4(S4),
	S is S2+S3+S4,
	write('Score Q2 = '),write(S2),nl,
	write('Score Q3 = '),write(S3),nl,
	write('Score Q4 = '),write(S4),nl,
	write('Your Scrore is '),write(S),write(' + partial credit'),nl,
	write('Also, remember that if the cryptarithmetic takes more than a second, there will be a penalty').

scoreQ2(S):-findall([Fr,Sw,It,Be,Ho,Ge,Au],europe_color(Fr,Sw,It,Be,Ho,Ge,Au),Countries),
	                 TRUEs=[[blue,red,yellow,red,blue,yellow,blue],[blue,yellow,red,yellow,blue,red,blue],[red,blue,yellow,blue,red,yellow,red],[red,yellow,blue,yellow,red,blue,red],[yellow,blue,red,blue,yellow,red,yellow],[yellow,red,blue,red,yellow,blue,yellow]],
			 sort(Countries,SCountries),
			 ((SCountries=TRUEs,S is 30) ; (\+ SCountries = TRUEs,S is 0)).

scoreQ3(S):-findall([C,R,O,S,A,D,N,G,E],cryptarithmetic(C,R,O,S,A,D,N,G,E),Solutions),
	                 TRUEs=[[9,6,2,3,5,1,8,7,4]],
			 sort(Solutions,SSolutions),
			 ((SSolutions=TRUEs,S is 30) ; (\+ SSolutions = TRUEs,S is 0)).


scoreQ4(S):-findall([PP],who_ordered_pizza(PP),Solutions),
	                 TRUEs=[[donna]],
			 sort(Solutions,SSolutions),
			 ((SSolutions=TRUEs,S is 40) ; (\+ SSolutions = TRUEs,S is 0)).

:-score(S),nl,write('Score = '),write(S).
