['~/Ontological/relationsdb'].

transitivity(R,A,B):-relation(R,A,B).
transitivity(R,A,C):-relation(is_a,B,C),transitivity(R,A,B).
transitivity(R,A,C):-R \= is_a,relation(is_a,A,B),transitivity(R,B,C).
transitivity(R,A,C):-relation(R,A,B),transitivity(R,B,C).

query_redundant(is_a, A, A):-class(A).
query_redundant(R, A, B) :- transitivity(R,A,B).
query_redundant(part_of, A, B) :- 
	query_redundant(part_for, A, B), 
	query_redundant(has_part, B, A). 

query(R, A, B) :- setof(_, query_redundant(R,A,B), _).

find_reflexive(R,A):-R \= is_a, relation(R,A,A).
find_symmetric(R,A):-query(R,A,B),query(R,B,A).

overlap(C, D, X) :- 
	query(is_a, X, C), 
	query(is_a, X, D).

disjoint(C, D) :- 
	class(C), 
	class(D),
	\+ overlap(C, D, _).