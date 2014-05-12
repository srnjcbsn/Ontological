class(cell).
class(nervous_system).
class(exocrine_cell).
class(endocrine_cell).
class(stem_cell).
class(neuronal_schwann_cell).
class(adult_stem_cell).
class(embryonic_stemm_cell).
class(exocrine_pancreatic_cell).
class(endocrine_pancreatic_cell).
class(centroacinar_cell).
class(acinar_cell).
class(alpha_cell).
class(beta_cell).
class(delta_cell).
class(pp_cell).
class(pancreas).
class(exocrine_pancreas).
class(endocrine_pancreas).
class(islet_of_langerhans).
class(duct).
class(glucagon).
class(insulin).
class(gastrin).
class(somatostatin).
class(pancreatic_cell).
class(capillary).
class(pancreatic_polypeptide).


% is_a relationships

ae_relation(is_a, exocrine_cell, cell).
ae_relation(is_a, endocrine_cell, cell).
ae_relation(is_a, pancreatic_cell, cell).
ae_relation(is_a, stem_cell, cell).
ae_relation(is_a, neuronal_schwann_cell, cell).

ae_relation(is_a, adult_stem_cell, stem_cell).
ae_relation(is_a, embryonic_stemm_cell, stem_cell).

ae_relation(is_a, exocrine_pancreatic_cell, exocrine_cell).
ae_relation(is_a, exocrine_pancreatic_cell, pancreatic_cell).

ae_relation(is_a, endocrine_pancreatic_cell, endocrine_cell).
ae_relation(is_a, endocrine_pancreatic_cell, pancreatic_cell).

ae_relation(is_a, centroacinar_cell, exocrine_pancreatic_cell).
ae_relation(is_a, acinar_cell, exocrine_pancreatic_cell).

ae_relation(is_a, alpha_cell, endocrine_pancreatic_cell).
ae_relation(is_a, beta_cell, endocrine_pancreatic_cell).
ae_relation(is_a, delta_cell, endocrine_pancreatic_cell).
ae_relation(is_a, pp_cell, endocrine_pancreatic_cell).

ae_relation(secretes, alpha_cell, glucagon).
ae_relation(secretes, beta_cell, insulin).
ae_relation(secretes, delta_cell,  gastrin).
ae_relation(secretes, delta_cell, somatostatin).
ae_relation(secretes, pp_cell, pancreatic_polypeptide).


% has_part relationships
ae_relation(has_part,nervous_system,neuronal_schwann_cell).
ae_relation(has_part,pancreas,exocrine_pancreas).
ae_relation(has_part,pancreas,endocrine_pancreas).

ae_relation(has_part,exocrine_pancreas,exocrine_pancreatic_cell).
ae_relation(has_part,exocrine_pancreas,duct).

ae_relation(has_part,endocrine_pancreas,islet_of_langerhans).

ae_relation(has_part,islet_of_langerhans,alpha_cell).
ae_relation(has_part,islet_of_langerhans,beta_cell).
ae_relation(has_part,islet_of_langerhans,delta_cell).
ae_relation(has_part,islet_of_langerhans,pp_cell).
ae_relation(has_part,islet_of_langerhans,capillary).


% part_for relationships

ae_relation(part_for,neuronal_schwann_cell,nervous_system).

ae_relation(part_for,exocrine_pancreas,pancreas).
ae_relation(part_for,endocrine_pancreas,pancreas).

ae_relation(part_for,exocrine_pancreatic_cell,exocrine_pancreas).
ae_relation(part_for,duct,exocrine_pancreas).

ae_relation(part_for,islet_of_langerhans,endocrine_pancreas).

ae_relation(part_for,alpha_cell,islet_of_langerhans).
ae_relation(part_for,beta_cell,islet_of_langerhans).
ae_relation(part_for,delta_cell,islet_of_langerhans).
ae_relation(part_for,pp_cell,islet_of_langerhans).

