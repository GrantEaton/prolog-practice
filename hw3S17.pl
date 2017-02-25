% The name and number of parameters to the following rules should not be changed.
% You can add extra rules and change parameters (e.g., replace S1 with [H1|T1].

isSorted(L) :- !.

removeKth(K, L, O) :- L=O. 

union(S1, S2, []).

quad(A, B, C, [1, 2]).

zip(L1, L2, O) :- append(L1, L2, O).

binaryLists(Zeros, Ones, O) :- append([Zeros], [Ones], O).

unique(L, O).

nQueens(BRD).

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
