## Backend goal 

The backend should implement a data storage and a REST api use to
communicate with the backend. The frontend will receive responces in
the form of JSON files.

### Quick and dirty backend implementation

To demonstrate the benfits, of the webapp we will daily use XSLT to
query the file standards-xml with the predefined queries and generate
the relevant JSON files. Theat way we can post-pone the development of
the backend and focus on the frontend application.

* View volume 2
* Mid and Far Term standards (not included in NISP volume 3)
* Combined view of standards in NISP database
* All standard
    * Columns: title, applicability, Organisation
    * url: /standards
* All Profiles
    * Columns: title, applicability, Organisation
    * url: /profiles
* Mandatory Standards
    * Columns: Taxonomy, title, Remarks, Rationale
    * url: /standards/mandatory
* Emerging Standards
    * Columns: Taxonomy, title, Remarks, Rationale
    * url: /standards/emerging
* Fading Standards
    * Columns: Taxonomy, title, Remarks, Rationale
    * url: /standards/fading
* Revision records
    * Columns: Version, Date, Description
    * url: /revisions



* Single standard:
     * layout?
     * url: /standard/:stdid

