% is_a relationships

relation(is_a, exocrine_cell, cell).
relation(is_a, endocrine_cell, cell).
relation(is_a, pancreatic_cell, cell).
relation(is_a, stem_cell, cell).
relation(is_a, neuronal_schwann_cell, cell).

relation(is_a, adult_stem_cell, stem_cell).
relation(is_a, embryonic_stemm_cell, stem_cell).

relation(is_a, exocrine_pancreatic_cell, exocrine_cell).
relation(is_a, exocrine_pancreatic_cell, pancreatic_cell).

relation(is_a, endocrine_pancreatic_cell, endocrine_cell).
relation(is_a, endocrine_pancreatic_cell, pancreatic_cell).

relation(is_a, centroacinar_cell, exocrine_pancreatic_cell).
relation(is_a, acinar_cell, exocrine_pancreatic_cell).

relation(is_a, alpha_cell, endocrine_pancreatic_cell).
relation(is_a, beta_cell, endocrine_pancreatic_cell).
relation(is_a, delta_cell, endocrine_pancreatic_cell).
relation(is_a, pp_cell, endocrine_pancreatic_cell).

relation(secretes, alpha_cell, glucagon).
relation(secretes, beta_cell, insulin).
relation(secretes, delta_cell,  gastrin).
relation(secretes, delta_cell, somatostatin).


% has_part relationships

relation(has_part,nervous_system,neuronal_schwann_cell).

relation(has_part,pancreas,exocrine_pancreas).
relation(has_part,pancreas,endocrine_pancreas).

relation(has_part,exocrine_pancreas,exocrine_pancreatic_cell).
relation(has_part,exocrine_pancreas,duct).

relation(has_part,endocrine_pancreas,islet_of_langerhans).

relation(has_part,islet_of_langerhans,alpha_cell).
relation(has_part,islet_of_langerhans,beta_cell).
relation(has_part,islet_of_langerhans,delta_cell).
relation(has_part,islet_of_langerhans,pp_cell).
relation(has_part,islet_of_langerhans,capillary).


% part_for relationships

relation(part_for,neuronal_schwann_cell,nervous_system).

relation(part_for,exocrine_pancreas,pancreas).
relation(part_for,endocrine_pancreas,pancreas).

relation(part_for,exocrine_pancreatic_cell,exocrine_pancreas).
relation(part_for,duct,exocrine_pancreas).

relation(part_for,islet_of_langerhans,endocrine_pancreas).

relation(part_for,alpha_cell,islet_of_langerhans).
relation(part_for,beta_cell,islet_of_langerhans).
relation(part_for,delta_cell,islet_of_langerhans).
relation(part_for,pp_cell,islet_of_langerhans).



transitivity(R,A,B):-relation(R,A,B).
transitivity(R,A,C):-relation(R,A,B),transitivity(R,B,C).


query(R, A, B) :- transitivity(R,A,B).
query(part_of, A, B) :-query(part_for,A,B),query(has_part,B,A). 