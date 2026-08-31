select *,(case when dna_sequence like 'ATG%' THEN 1 ELSE 0 END) has_start,
(case when dna_sequence like '%TGA' OR dna_sequence like '%TAA' OR dna_sequence like '%TAG' THEN 1 ELSE 0 END) has_stop,
(case when dna_sequence like '%ATAT%' THEN 1 ELSE 0 END) has_atat,
(CASE WHEN dna_sequence LIKE '%GGG%' THEN 1 ELSE 0 END) AS has_ggg
from samples
ORDER BY sample_id 