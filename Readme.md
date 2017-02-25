###Prolog Practice building the following functions (in hw3S17.pl):
 
``` isSorted(L) ```
- succeeds if the flat list of number is in ascending order
	* isSorted([1,2,3,4]).		% should succeed
	* isSorted([1,1,1,1,10,10,10]).	% should succeed
	* isSorted([1,1,1,1,10,1]).		% should fail

```removeKth(K, L, O) ```
- O is bound to same value of L, except w/o the kth element 
	* removeKth(1, [a,b,c,d], L)		% should  bind L to [b,c,d]
	* removeKth(3, [a,b,c,d], L)		% should  bind L to [a,b,d]
	* removeKth(10, [a,b,c,d], L)	% should  fail
	* removeKth(0, [a,b,c,d], L)		% should  fail


```union(L1, L2, O) ```
- O will contain all the elements of L1 and L2, w/o duplicates.
	* union([a,b,c,d], [a,a,a,b,a,e,f,f], L)	% should  bind L to [a,b,c,d,e,f]

```quad(A, B, C, ROOTS).```
- Solves quadratic equation
	* quad(1, -3, -4, ROOTS).		% should bind ROOTS to [-1, 4]

```zip(L1, L2, L3)```
- similar to Python’s zip
	* zip([a,b,c], [1,2,3], L)		% should bind L to [[a,1],[b,2],[c,3]].
	* zip([a,b,c], [1,2,3,4], L)		% should fail

```binaryLists(Z, O, L) ```
- Generate all the lists containing Z zeros and O ones.
	* binaryLists(3, 2, L).		% should bind L to [0,0,0,1,1], then [0,0,1,0,1],
				% [0,1,0,0,1]…. [1,1,0,0,0]. 
				% Order does not matter.
        
```unique(L, O)```
- Similar to C++ unique
	* unique([1,1,2,3,3,3,4,1,1,4,4,5], L).	% should bind L to [1,2,3,4,1,4,5]

```canReach(City1, City2).```
	* canReach(oxford, toledo).		% should succeed
	* canReach(toledo, oxford).		% should succeed
	* canReach(cincinnati, dallas).	% should fail

