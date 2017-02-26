% The name and number of parameters to the following rules should not be changed.
% You can add extra rules and change parameters (e.g., replace S1 with [H1|T1].
isSorted([]).
isSorted([H]).
isSorted([H|[L|T]]) :- H =< L, isSorted([L|T]).

removeKth(K,L,O) :- removeKthH(K,[],L,O).
removeKthH(1, A, [_|T], O) :- append(A, T, O).
removeKthH(K, A, [H|L], O) :- K > 1,
		append(A,[H],B),	
		K1 is K-1, 
		removeKthH(K1, B, L, O). 

union(S1, S2, X) :- append(S1, S2, R),
		addVals(R, [], X1), append([], X1,X).

addVals([], S, R) :- append(S, [], R).
addVals([H|L], S, R) :- \+ checkVal(S,H), 
		append(S,[H],S1),
		addVals(L, S1, R).
addVals([H|L], S, R) :- checkVal(S,H), 
		addVals(L, S, R).


checkVal([H|_],V) :- H == V.
checkVal([H|L],V) :- H \= V, checkVal(L,V).


quad(A, B, C, R):- Sqrt is sqrt(B*B - 4*A*C),
X is (-B + Sqrt)/(2*A), X1 is (-B - Sqrt)/(2*A),
append([X],[X1], R).


zip(L1, L, O) :- zip(L, L1, [], O). 
zip([H1], [H], R, O) :- append([H1],[H],Z), append(R,[Z], O).
zip([H1|L1], [H|L], R, O) :- append([H1],[H], A),
		append( R, [A], R1),
		zip(L1,L,R1,O).

binaryLists(Zeros, Ones, O) :- append([Zeros], [Ones], O).

unique(L, O) :- union(L,[],O).

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

canReach(StartCity, EndCity).
