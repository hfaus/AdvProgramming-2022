%DO NOT MODIFY THIS FILE

acted_in('Brad Pitt', 'Babel').
acted_in('Cate Blanchett', 'Babel').
acted_in('Sharlto Copley','District 9').
acted_in('Jason Cope','District 9').
acted_in('Adam Sandler','Click').
acted_in('Kate Beckinsale','Click').
acted_in('Christopher Walken','Click').
acted_in('Leonardo DiCaprio','The Aviator').
acted_in('Cate Blanchett','The Aviator').
acted_in('Kate Beckinsale','The Aviator').
acted_in('Jason Bateman','The Switch').
acted_in('Jennifer Aniston','The Switch').
acted_in('Jeff Goldblum','The Switch').
acted_in('Jennifer Aniston','The Bounty Hunter').
acted_in('Gerard Butler','The Bounty Hunter').
acted_in('Gio Perez','The Bounty Hunter').
acted_in('Leonardo DiCaprio','Inception').
acted_in('Joseph Gordon-Levitt','Inception').
acted_in('Ellen Page','Inception').
acted_in('Leonardo DiCaprio','Shutter Island').
acted_in('Emily Mortimer','Shutter Island').
acted_in('Mark Ruffalo','Shutter Island').
acted_in('Clive Owen','Derailed').
acted_in('Jennifer Aniston','Derailed').
acted_in('Vincent Cassel','Derailed').
acted_in('Jesse Eisenberk','Zombieland').
acted_in('Emma Stone','Zombieland').
acted_in('Woody Harrelson','Zombieland').
acted_in('Christian Bale','The Dark Knight').
acted_in('Aaron Eckhart','The Dark Knight').
acted_in('Heath Ledger','The Dark Knight').
acted_in('Michael Caine','The Dark Knight').
acted_in('Michael Caine','Is Anybody There?').
acted_in('Bill Milner','Is Anybody There?').
acted_in('Anne-Marie Duff','Is Anybody There?').
acted_in('Warner Baxter','Prison Warden').
acted_in('Warner Baxter','The Devil\'s Henchamn').
acted_in('Warner Baxter','The Crime Doctor\'s Diary').
acted_in('Nicolas Cage','The Weather Man').
acted_in('Michael Caine','The Weather Man').
acted_in('Hope Davis','The Weather Man').
acted_in('Nicole Kidman','Bewitched').
acted_in('Will Ferrell','Bewitched').
acted_in('Michael Caine','Bewitched').
acted_in('Christian Bale','Batman Begins').
acted_in('Michael Caine','Batman Begins').
acted_in('Liam Neeson','Batman Begins').


directed('Alejandro Inarritu', 'Babel').
directed('Neill Blomkamp', 'District 9').
directed('Dennis Dugan','Click').
directed('Martin Scorsese','The Aviator').
directed('Josh Gordon','The Switch').
directed('Will Speck','The Switch').
directed('Andy Tennant','The Bounty Hunter').
directed('Christopher Nolan','Inception').
directed('Martin Scorsese','Shutter Island').
directed('Mikael Hafstrom','Derailed').
directed('Ruben Fleischer','Zombieland').
directed('Christopher Nolan','The Dark Knight').
directed('John Crowley','Is Anybody There?').
directed('Seymour Friedman','Prison Warden').
directed('Seymour Friedman','The Devil\'s Henchamn').
directed('Seymour Friedman','The Crime Doctor\'s Diary').
directed('Gore Verbinski','The Weather Man').
directed('Nora Ephron','Bewitched').
directed('Christopher Nolan','Batman Begins').


released('Babel', 2006).
released('District 9', 2009).
released('Click',2006).
released('The Aviator',2004).
released('The Switch',2010).
released('The Bounty Hunter',2010).
released('Inception',2010).
released('Shutter Island',2010).
released('Derailed',2005).
released('Zombieland',2009).
released('The Dark Knight',2008).
released('Is Anybody There?',2008).
released('Prison Warden',1949).
released('The Devil\'s Henchamn',1949).
released('The Crime Doctor\'s Diary',1949).
released('The Weather Man',2005).
released('Bewitched',2005).
released('Batman Begins',2005).



:-['Pr2.pl'].

scoreQ1(S):- (q1, S is 0);(\+ q1, S is 5).

scoreQ2(S):- q2(D),
    ((D == 'Neill Blomkamp', S is 5);
    (\+ D=='Neill Blomkamp',S is 0)).

scoreQ3(S):-findall(A,q3(A),As),
    TRUEs = ['Kate Beckinsale'],
    sort(As,SAs),
    ((SAs=TRUEs, S is 10);(\+ SAs=TRUEs, S is 0)).

scoreQ4(S):-findall(M,q4(M),Ms),
    TRUEs = ['Inception','Shutter Island'],
    sort(Ms,SMs),
    ((SMs=TRUEs, S is 10);(\+ SMs=TRUEs, S is 0)).


scoreQ5(S):-findall(D,q5(D),Ds),
    TRUEs = ['Neill Blomkamp','Ruben Fleischer'],
    sort(Ds,SDs),
    ((SDs=TRUEs, S is 10);(\+ SDs=TRUEs, S is 0)).

scoreQ6(S):-findall(D,q6(D),Ds),
    TRUEs = ['Christopher Nolan','Martin Scorsese','Seymour Friedman'],
    sort(Ds,SDs),
    ((SDs=TRUEs, S is 10);(\+ SDs=TRUEs, S is 0)).

scoreQ7(S):-findall(M,q7(M),Ms),
    TRUEs = ['The Switch'],
    sort(Ms,SMs),
    ((SMs=TRUEs, S is 10);(\+ SMs=TRUEs, S is 0)).

scoreQ8(S):-findall(A,q8(A),As),
    TRUEs = ['Michael Caine'],
    sort(As,SAs),
    ((SAs=TRUEs, S is 10);(\+ SAs=TRUEs, S is 0)).

scoreQ9(S):-findall(A,q9(A),As),
    TRUEs = ['Michael Caine','Warner Baxter'],
    sort(As,SAs),
    ((SAs=TRUEs, S is 15);(\+ SAs=TRUEs, S is 0)).

scoreQ10(S):-findall(A,q10(A),As),
    TRUEs = ['Christian Bale','Leonardo DiCaprio','Michael Caine'],
    sort(As,SAs),
    ((SAs=TRUEs, S is 15);(\+ SAs=TRUEs, S is 0)).

main:-scoreQ1(S1) ,write('Query 1 score  = '),write(S1),nl,
      scoreQ2(S2) ,write('Query 2 score  = '),write(S2),nl,
      scoreQ3(S3) ,write('Query 3 score  = '),write(S3),nl,
      scoreQ4(S4) ,write('Query 4 score  = '),write(S4),nl,
      scoreQ5(S5) ,write('Query 5 score  = '),write(S5),nl,
      scoreQ6(S6) ,write('Query 6 score  = '),write(S6),nl,
      scoreQ7(S7) ,write('Query 7 score  = '),write(S7),nl,
      scoreQ8(S8) ,write('Query 8 score  = '),write(S8),nl,
      scoreQ9(S9) ,write('Query 9 score  = '),write(S9),nl,
      scoreQ10(S10),write('Query 10 score = '),write(S10),nl,
      Score is S1+S2+S3+S4+S5+S6+S7+S8+S9+S10,
      write(Score).

:- main.