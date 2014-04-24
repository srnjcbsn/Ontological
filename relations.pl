['~/Ontological/relationsdb'].

transitivity(R,A,B):-relation(R,A,B).
transitivity(R,A,C):-relation(R,A,B),transitivity(R,B,C).


query_redundant(R, A, B) :- transitivity(R,A,B).
query_redundant(part_of, A, B) :- 
	query_redundant(part_for, A, B), 
	query_redundant(has_part, B, A). 

query(R, A, B) :- setof(_, query_redundant(R,A,B), _).

overlap(C, D, X) :- 
	class(C), 
	class(D), 
	D @< C, 
	overlap(D, C, X).

overlap(C, D, X) :- 
	query(is_a, X, C), 
	query(is_a, X, D).

disjoint(C, D) :- 
	class(C), 
	class(D), 
	D @> C, 
	disjoint(D, C).

disjoint(C, D) :- 
	class(C), 
	class(D),
	\+ overlap(C, D, _).