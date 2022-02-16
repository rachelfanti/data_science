[QueryItem="query_6_wine_producer"]
PREFIX : <http://www.semanticweb.org/rachel/ontologies/2022/0/untitled-ontology-30#>

SELECT ?wn ?p ?r ?n ?ph ?url
WHERE {?w :isProducedBy ?p;
:wName ?wn.
?p a :Actor;
:acRole ?r; 
:acName ?n.
optional {?p :acPhoneNumber ?ph}.
optional {?p :acURL ?url}
}
[QueryItem="query_5_producer"]
PREFIX : <http://www.semanticweb.org/rachel/ontologies/2022/0/untitled-ontology-30#>

SELECT ?ac ?r ?n ?p ?url
WHERE {
?a a :Actor;
:acRole ?r; 
:acName ?n.
optional {?a :acPhoneNumber ?p.}
optional {?a :acURL ?url}
}
[QueryItem="query_7_address_geolocalization"]
PREFIX : <http://www.semanticweb.org/rachel/ontologies/2022/0/untitled-ontology-30#>

SELECT ?ad ?g ?lat ?long
WHERE {
?ad :hasGeolocalization ?g.
?g :gLatitude ?lat ;
:gLongitude ?long.
}
[QueryItem="query_8_address_municipality"]
PREFIX : <http://www.semanticweb.org/rachel/ontologies/2022/0/untitled-ontology-30#>

SELECT ?address ?mun ?country ?reg ?prov
WHERE {?address :hasMunicipality ?m.
?m :mLauNameNational ?mun;
:mCountry ?country;
:mNUTSLevel2 ?reg;
:mNUTSLevel3 ?prov.
}
[QueryItem="query_9_prod_geo_mun"]
PREFIX : <http://www.semanticweb.org/rachel/ontologies/2022/0/untitled-ontology-30#>

SELECT ?p ?r ?lat ?long ?lau ?reg ?prov
WHERE {?ac :hasMainAddress ?d;
:acName ?p.
?d :hasGeolocalization ?g.
?g :gLatitude ?lat;
:gLongitude ?long.
?d :hasMunicipality ?m.
?m :mLauNameNational ?lau;
:mNUTSLevel2 ?reg;
:mNUTSLevel3 ?prov.

}
[QueryItem="query_1_wine_descriptions"]
PREFIX : <http://www.semanticweb.org/rachel/ontologies/2022/0/untitled-ontology-30#>

SELECT ?cod ?nam ?sour ?col ?alc ?org_desc
WHERE {
?w :wWineCode ?cod;
:wName ?nam;
:hasDescription ?d.
?d :wdColour ?col.
?d:hasOrganolepticDescription ?od.
OPTIONAL {?w:wSource ?sour.}
OPTIONAL {?d :wdAlcoholContent ?alc.}
OPTIONAL {?od :wodOrganolepticDescription ?org_desc.}
}
[QueryItem="query_4_wine_certification_existent"]
PREFIX : <http://www.semanticweb.org/rachel/ontologies/2022/0/untitled-ontology-30#>

SELECT ?w ?c ?cert ?ext_cert
WHERE {?w a :Wine;
:hasCertification ?c. 
?c :cName ?cert;
:cExtendedCode ?ext_cert.
}
[QueryItem="query_4_wine_certification_all"]
PREFIX : <http://www.semanticweb.org/rachel/ontologies/2022/0/untitled-ontology-30#>

SELECT ?w ?c ?cert ?ext_cert
WHERE {?w a :Wine.
optional {?w :hasCertification ?c. 
?c :cName ?cert;
:cExtendedCode ?ext_cert.
}
}
[QueryItem="query_2_wine_grape_composition_existent"]
PREFIX : <http://www.semanticweb.org/rachel/ontologies/2022/0/untitled-ontology-30#>

SELECT ?w ?gc ?perc ?gv ?grap
WHERE {?w :hasGrapeComposition ?gc.
?gc :hasGrape ?gv.
?gv :gvName ?grap. 
optional {?gc :wgcPercentageOfGrape ?perc.}
}
[QueryItem="query_3_wine_type_existent"]
PREFIX : <http://www.semanticweb.org/rachel/ontologies/2022/0/untitled-ontology-30#>

SELECT ?w ?t
WHERE {?w a :Wine;
:hasType ?wt. 
?wt :wtName ?t;
}
[QueryItem="query_3_wine_type_all"]
PREFIX : <http://www.semanticweb.org/rachel/ontologies/2022/0/untitled-ontology-30#>

SELECT ?w ?wt ?t
WHERE {?w a :Wine.
optional {?w:hasType ?wt. ?wt :wtName ?t.}
}
[QueryItem="query_10_wine_desc_prod_geo_mun"]
PREFIX : <http://www.semanticweb.org/rachel/ontologies/2022/0/untitled-ontology-30#>

SELECT ?cod ?wn ?sour ?col ?alc ?org_desc ?p ?lat ?long ?lau ?reg ?prov
WHERE {?w :isProducedBy ?ac;
:wWineCode ?cod;
:wName ?wn;
:hasDescription ?d.
?d :wdColour ?col.
?d:hasOrganolepticDescription ?od.
?ac a :Actor;
:hasMainAddress ?ad;
:acName ?p.
?ad :hasGeolocalization ?g.
?g :gLatitude ?lat;
:gLongitude ?long.
?ad :hasMunicipality ?m.
?m :mLauNameNational ?lau;
:mNUTSLevel2 ?reg;
:mNUTSLevel3 ?prov.
OPTIONAL {?w:wSource ?sour.}
OPTIONAL {?d :wdAlcoholContent ?alc.}
OPTIONAL {?od :wodOrganolepticDescription ?org_desc.}
}
[QueryItem="query_2_wine_grape_composition_all"]
PREFIX : <http://www.semanticweb.org/rachel/ontologies/2022/0/untitled-ontology-30#>

SELECT ?w ?gc ?perc ?gv ?grap
WHERE {?w a :Wine.
optional {?w :hasGrapeComposition ?gc.
?gc :hasGrape ?gv.
?gv :gvName ?grap. optional {?gc :wgcPercentageOfGrape ?perc.}}
}
[QueryItem="query_11_wine_desc_grape_prod_geo_mun"]
PREFIX : <http://www.semanticweb.org/rachel/ontologies/2022/0/untitled-ontology-30#>

SELECT ?cod ?wn ?sour ?col ?alc ?org_desc ?perc ?grap ?p ?lat ?long ?lau ?reg ?prov
WHERE {?w :isProducedBy ?ac;
:wWineCode ?cod;
:wName ?wn;
:hasDescription ?d.
?d :wdColour ?col.
?d:hasOrganolepticDescription ?od.
?ac a :Actor;
:hasMainAddress ?ad;
:acName ?p.
?ad :hasGeolocalization ?g.
?g :gLatitude ?lat;
:gLongitude ?long.
?ad :hasMunicipality ?m.
?m :mLauNameNational ?lau;
:mNUTSLevel2 ?reg;
:mNUTSLevel3 ?prov.
OPTIONAL {?w:wSource ?sour.}
OPTIONAL {?d :wdAlcoholContent ?alc.}
OPTIONAL {?od :wodOrganolepticDescription ?org_desc.}
optional {?w :hasGrapeComposition ?gc.
?gc :hasGrape ?gv.
?gv :gvName ?grap. optional {?gc :wgcPercentageOfGrape ?perc.}}
}