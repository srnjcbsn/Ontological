['~/Ontological/relationsdb'].


transitivity(R,A,B):-ae_relation(R,A,B).
transitivity(R,A,C):-ae_relation(is_a,B,C),transitivity(R,A,B).
transitivity(R,A,C):-R \= is_a,ae_relation(is_a,A,B),transitivity(R,B,C).
transitivity(R,A,C):-ae_relation(R,A,B),transitivity(R,B,C).


ae_redundant(R, A, B) :- transitivity(R,A,B).
ae_redundant(part_of, A, B) :- 
	ae_redundant(part_for, A, B), 
	ae_redundant(has_part, B, A). 
ae_redundant(is_a, A, A):-class(A).

ae(R, A, B) :- setof(_, ae_redundant(R,A,B), _).

is_reflexive(R,A):-ae_relation(R,A,A), !.
is_symmetric(R,A,B):-ae_redundant(R,B,A), ae_redundant(R,A,B),  A \= B, !.
class_missing(A):- \+ class(A),!.

error((missing_class, A)):-ae_relation(_,_,A), class_missing(A).
error((missing_class, A)):-ae_relation(_,A,_), class_missing(A).
error((reflexive,R,A)):-R \= is_a, is_reflexive(R,A).
error((symmetric, R ,A,B)):-is_symmetric(R, A, B).

ancestor(P, Q):-ae(is_a, P, Q).

common_desendant(C, A, B) :- 
	ancestor(C, A), 
	ancestor(C, B).

	
overlap(A, B, X):-
	common_desendant(X, A, B).
	
overlap_lineally_unrelated(A, B, X):-
	overlap(A, B, X),
	\+ ancestor(A, B),
	\+ ancestor(B, A).
	
	
disjoint(C, D) :- 
	class(C), 
	class(D),
	\+ overlap(C, D, _).