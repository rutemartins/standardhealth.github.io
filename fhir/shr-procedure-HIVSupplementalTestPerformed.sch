<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Basic
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Basic</sch:title>
    <sch:rule context="f:Basic">
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Type-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Type-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Type-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Type-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Category-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Category-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-action-PerformedContext-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-action-PerformedContext-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-action-PerformedContext-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-action-PerformedContext-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Subject-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Subject-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Subject-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Subject-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-procedure-AssociatedStudy-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-procedure-AssociatedStudy-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-PartOf-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-PartOf-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Specimen-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Specimen-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>Basic</sch:title>
    <sch:rule context="f:Basic">
      <sch:assert test="not(parent::f:contained and f:contained)">If the resource is contained in another resource, it SHALL NOT contain nested Resources</sch:assert>
      <sch:assert test="not(parent::f:contained and f:text)">If the resource is contained in another resource, it SHALL NOT contain any narrative</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:versionId)) and not(exists(f:contained/*/f:meta/f:lastUpdated))">If a resource is contained in another resource, it SHALL NOT have a meta.versionId or a meta.lastUpdated</sch:assert>
      <sch:assert test="not(exists(for $id in f:contained/*/@id return $id[not(ancestor::f:contained/parent::*/descendant::f:reference/@value=concat('#', $id))]))">If the resource is contained in another resource, it SHALL be referred to from elsewhere in the resource</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Basic/f:extension</sch:title>
    <sch:rule context="f:Basic/f:extension">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension) &lt;= 0">extension: maximum cardinality of 'extension' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &gt;= 1">valueCodeableConcept: minimum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:valueCodeableConcept) &lt;= 1">valueCodeableConcept: maximum cardinality of 'valueCodeableConcept' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Patient-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Group-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-device-Device-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-core-Location-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-RelatedPerson-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-entity-Organization-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &gt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Content-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Basic/f:extension/f:extension</sch:title>
    <sch:rule context="f:Basic/f:extension/f:extension">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-RelatedEncounter-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Author-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension']) &lt;= 1">extension with URL = 'http://standardhealthrecord.org/fhir/StructureDefinition/shr-base-Informant-extension': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 0">value[x]: maximum cardinality of 'value[x]' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Basic/f:extension/f:valueCodeableConcept</sch:title>
    <sch:rule context="f:Basic/f:extension/f:valueCodeableConcept">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Basic/f:extension/f:valueCodeableConcept/f:coding</sch:title>
    <sch:rule context="f:Basic/f:extension/f:valueCodeableConcept/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>