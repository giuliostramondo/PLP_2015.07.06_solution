%Giulio Stramondo
%Date 06/07/2015

%the number of element in a list.
my_count([],0).
my_count([_|YS],N) :- my_count(YS,N1), N is N1+1.

lile(X):- my_count(X,N), member(N,X).

%lile([2,1]).
%true

%lile([1,2,1]).
%false

lileg(X) :- lile(X),deep(X).
deep([]).
deep([X|XS]) :- atomic(X),deep(XS).
deep([X|XS]) :- lileg(X), deep(XS).


%?- lileg([2,[2,[1]],3]).
%true .

%?- lileg([2,[2,[2]],3]).
%false.