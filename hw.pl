% The name and number of parameters to the following rules should not be changed.
% You can add extra rules and change parameters (e.g., replace S1 with [H1|T1].

% succeeds if the flat list of number is in ascending order
isSorted([]).
isSorted([_]).
isSorted([H|[L|T]]) :- H =< L,
		isSorted([L|T]).
		
% O is bound to same value of L, except w/o the kth element 
removeKth(K,L,O) :- removeKthH(K,[],L,O).
removeKthH(1, A, [_|T], O) :- append(A, T, O).
removeKthH(K, A, [H|L], O) :- K > 1,
		append(A,[H],B),	
		K1 is K-1, 
		removeKthH(K1, B, L, O). 

% O will contain all the elements of L1 and L2, w/o duplicates.
union(S1, S2, X) :- append(S1, S2, R),
		addVals(R, [], X1),
		append([], X1,X).

% used for quadraic function
addVals([], S, R) :- append(S, [], R).
addVals([H|L], S, R) :- \+ checkVal(S,H), 
		append(S,[H],S1),
		addVals(L, S1, R).
addVals([H|L], S, R) :- checkVal(S,H), 
		addVals(L, S, R).

% check if element is in list
checkVal([H|_],V) :- H == V,!.
checkVal([H|L],V) :- H \= V, 
		checkVal(L,V).

% Solves quadratic equation
quad(A, B, C, R):- Sqrt is sqrt(B*B - 4*A*C),
		X is (-B + Sqrt)/(2*A),
		X1 is (-B - Sqrt)/(2*A),
		append([X],[X1], R).

% similar to Python’s zip
zip(L1, L, O) :- zip(L, L1, [], O). 
zip([H1], [H], R, O) :- append([H],[H1],Z),
		append(R,[Z], O).
zip([H1|L1], [H|L], R, O) :- append([H],[H1], A),
		append( R, [A], R1),
		zip(L1,L,R1,O).

%  Generate all the lists containing Z zeros and O ones.
binaryLists(0, 0, L) :- append([], [], L).
binaryLists(Z, O, L) :- 
		Z > 0,
		Z1 is Z-1,
		binaryLists(Z1, O, L1),
		append([0],L1,L).
binaryLists(Z, O, L) :-
		O > 0,
		O1 is O - 1,
		binaryLists(Z, O1, L1),
		append([1], L1, L). 
/*
% Binarylists function that would only print 1 possible option, not all. 
binaryLists(Z,O,L) :- binaryLists(Z,O,_,L).
binaryLists(Z,O,R,L) :- Z == 0,
		O == 0,
		append([], R, L).
binaryLists(Z,O,R,L) :- Z > 0,
		append(R,[0],R1),
		Z1 is Z-1,
		binaryLists(Z1,O,R1,L).
binaryLists(Z,O,R,L) :- O > 0,
		append(R,[1],R1),
		O1 is O-1,
		binaryLists(Z,O1,R1,L).
*/

unique(L, O) :- unique(L, _, O). 
unique([],_,O) :- append([],[],O).
unique([H],R,O) :- append(R,[H],R1), append(R1, [], O).
unique([H|[H1|T]], R, O) :-H == H1,
		append([H1], T, HT),
		unique(HT,R,O).
unique([H|[H1|T]], R, O) :- H \= H1,
		append(R, [H], R1),
		append([H1], T, HT),
		unique(HT,R1,O).

% Note, the edges are bidirectional.
% If new cities are added, or connections are created, I will add the appropriate
% adj(*,*) relationships (but I will not change anything else in your code.

adj(oxford, dayton).
adj(oxford, cincinnati).
adj(cincinnati, columbus).
adj(columbus, cleveland).
adj(columbus, dayton).
adj(cleveland, toledo).
adj(toledo, dayton).

adj(houston, dallas).
adj(houston, sanantonio).
adj(dallas, sanantonio).

% check if two cities can reach one another
canReach(S,E) :- canReach(S,[],E).
canReach(S,_,E) :- adj(S,E).
canReach(S,_,E) :- adj(E,S).
canReach(S,L,E) :- adj(X,S), \+checkVal(L,X), append(L,S,L1), canReach(X,L1,E).
canReach(S,L,E) :- adj(S,X), \+checkVal(L,X), append(L,S,L1), canReach(X,L1,E).

% prolog function to get length of list
len(X,L) :- len(X,0,L).
len([],M,L) :- L is M.
len([H|T],M,L) :- M1 is M+1, len(T,M1,L).


secLast([H|T],L) :- secLast(X,[],L).
secLast([H],M,L) :- L is M.
secLast([H|T],M,L) :- M1 is H, secLast(T,M1,L).

