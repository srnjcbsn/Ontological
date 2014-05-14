['~/Ontological/relationsdb'].

transitivity(R, A, B) :- ae_relation(R,A,B).
transitivity(R, A, C) :- 
			ae_relation(R,A,B),
			transitivity(R,B,C).
transitivity(R, A, C) :- 
			R \= is_a, 
			ae_relation(is_a,B,C), 
			transitivity(R,A,B).
transitivity(R, A, C) :- 
			R \= is_a, 
			ae_relation(is_a,A,B), 
			transitivity(R,B,C).

ae_redundant(R, A, B) :- transitivity(R,A,B).
ae_redundant(part_of, A, B) :- 
			ae_redundant(part_for, A, B), 
			ae_redundant(has_part, B, A). 
ae_redundant(is_a, A, A):- class(A).

%ae(?Relation, ?A, ?B)
ae(R, A, B) :- setof(_, ae_redundant(R,A,B), _).

%is_reflexive(+R, +A)
is_reflexive(R, A) :- ae_relation(R,A,A), !.

%is_symmetric(+R, +A, +B)
is_symmetric(R, A, B) :- 
			A \= B, 
			ae_redundant(R,B,A),!, 
			ae_redundant(R,A,B),!.

%class_missing(+A)
class_missing(A) :- 
			(
				ae_relation(_,_,A); 
				ae_relation(_,A,_)
			), 
			\+ class(A).

%error(-Output)
error((missing_class, A)) :- 
			setof(_, class_missing(A), _).
error((reflexive,R,A)) :- 
			is_reflexive(R,A), 
			R \= is_a.
error((symmetric, (R,A,B))) :- 
			setof(
				(A1,B1,R1),
				(	
					class(A1), 
					class(B1), 
					ae_relation(R1,_,_), 
					is_symmetric(R1, A1, B1)
				),
				L),
			!,
			member((A,B,R),L).
						

ancestor(P, Q) :- ae(is_a, P, Q).

common_desendant(X, A, B) :- 
			ancestor(X, A), 
			ancestor(X, B).
	
%overlap(?A, ?B, ?OverlapingWith)
overlap(A, B, X) :-
			common_desendant(X, A, B).

%overlap_lineally_unrelated(?A, ?B, ?OverlapingWith)	
overlap_lineally_unrelated(A, B, X) :-
			overlap(A, B, X),
			\+ ancestor(A, B),
			\+ ancestor(B, A).
	
%disjoint(?C, ?D)
disjoint(C, D) :- 
			class(C), 
			class(D),
			\+ overlap(C, D, _).