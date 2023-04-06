class Part < ApplicationRecord
 has_and_belongs_to_many :assemblies, foreign_key: 'part_id', association_foreign_key: 'assembly_id', join_table: 'assemblies_parts'
end
