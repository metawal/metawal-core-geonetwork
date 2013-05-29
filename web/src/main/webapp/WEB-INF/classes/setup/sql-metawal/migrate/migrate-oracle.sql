REM ======================================================================
REM ===   Sql Script for Database : Geonet migration METAWAL
REM ===
REM === 	
REM ======================================================================

ALTER TABLE Relations MODIFY relatedId NOT NULL ENABLE;
ALTER TABLE Relations MODIFY id NOT NULL ENABLE;
  
REM ======================================================================
  
ALTER TABLE Categories MODIFY name varchar2(255);
ALTER TABLE Categories MODIFY id NOT NULL ENABLE;
  
REM ======================================================================

CREATE TABLE CustomElementSet
	(
		xpath  varchar2(1000) not null
	);

REM ======================================================================

ALTER TABLE Settings MODIFY name varchar2(64);
ALTER TABLE Settings MODIFY value clob;
ALTER TABLE Settings MODIFY id NOT NULL ENABLE;
  
REM ======================================================================
  
ALTER TABLE Languages DROP COLUMN isocode;
ALTER TABLE Languages MODIFY id varchar2(5) not null;
ALTER TABLE Languages ADD isInspire char(1) default 'n';
ALTER TABLE Languages ADD isDefault char(1) default 'n';

REM ======================================================================

ALTER TABLE Sources MODIFY uuid NOT NULL ENABLE;
  
REM ======================================================================

ALTER TABLE IsoLanguages ADD shortcode varchar2(2);
ALTER TABLE IsoLanguages MODIFY id NOT NULL ENABLE;

REM ======================================================================

ALTER TABLE IsoLanguagesDes MODIFY idDes NOT NULL ENABLE;
ALTER TABLE IsoLanguagesDes MODIFY langId NOT NULL ENABLE;

REM ======================================================================

ALTER TABLE Regions MODIFY id int not null;

REM ======================================================================

ALTER TABLE RegionsDes MODIFY iddes NOT NULL ENABLE;
ALTER TABLE RegionsDes MODIFY langid NOT NULL ENABLE;

REM ======================================================================

ALTER TABLE Users MODIFY id NOT NULL ENABLE;
ALTER TABLE Users MODIFY username varchar2(256);
ALTER TABLE Users MODIFY password varchar2(120);
ALTER TABLE Users ADD security varchar2(128) default ''; 
ALTER TABLE Users ADD authtype varchar2(32);

REM ======================================================================

ALTER TABLE Operations MODIFY id NOT NULL ENABLE;

REM ======================================================================

ALTER TABLE OperationsDes MODIFY iddes NOT NULL ENABLE;
ALTER TABLE OperationsDes MODIFY langid NOT NULL ENABLE;

REM ======================================================================

CREATE TABLE Requests
  (
    id             int             not null,
    requestDate    varchar2(30),
    ip             varchar2(128),
    query          varchar2(4000),
    hits           int,
    lang           varchar2(16),
    sortBy         varchar2(128),
    spatialFilter  varchar2(4000),
    type           varchar2(4000),
    simple         int             default 1,
    autogenerated  int             default 0,
    service        varchar2(128),
    primary key(id)
  );

CREATE INDEX RequestsNDX1 ON Requests(requestDate);
CREATE INDEX RequestsNDX2 ON Requests(ip);
CREATE INDEX RequestsNDX3 ON Requests(hits);
CREATE INDEX RequestsNDX4 ON Requests(lang);

REM ======================================================================

CREATE TABLE Params
  (
    id          int           not null,
    requestId   int,
    queryType   varchar2(128),
    termField   varchar2(128),
    termText    varchar2(128),
    similarity  float,
    lowerText   varchar2(128),
    upperText   varchar2(128),
    inclusive   char(1),
    primary key(id),
    foreign key(requestId) references Requests(id)
  );

CREATE INDEX ParamsNDX1 ON Params(requestId);
CREATE INDEX ParamsNDX2 ON Params(queryType);
CREATE INDEX ParamsNDX3 ON Params(termField);
CREATE INDEX ParamsNDX4 ON Params(termText);

REM ======================================================================

CREATE TABLE HarvestHistory
  (
    id             int           not null,
    harvestDate    varchar2(30),
    elapsedTime    int,
    harvesterUuid  varchar2(250),
    harvesterName  varchar2(128),
    harvesterType  varchar2(128),
    deleted        char(1)       default 'n' not null,
    info           varchar2(2000),
    params         clob,
    primary key(id)
  );

CREATE INDEX HarvestHistoryNDX1 ON HarvestHistory(harvestDate);

REM ======================================================================

REM === ALTER TABLE Groups MODIFY email varchar2(32);
ALTER TABLE Groups MODIFY id NOT NULL ENABLE;

REM ======================================================================

ALTER TABLE GroupsDes MODIFY idDes NOT NULL ENABLE;
ALTER TABLE GroupsDes MODIFY langId NOT NULL ENABLE;

REM ======================================================================

ALTER TABLE UserGroups MODIFY groupid NOT NULL ENABLE;
ALTER TABLE UserGroups MODIFY userid NOT NULL ENABLE;
ALTER TABLE usergroups ADD profile varchar2(32);
UPDATE usergroups SET profile = (SELECT profile FROM users WHERE id = userid);
ALTER TABLE usergroups MODIFY profile not null enable;
ALTER TABLE UserGroups DROP PRIMARY KEY;
ALTER TABLE UserGroups ADD PRIMARY KEY (userId,groupId,profile);

REM ======================================================================

ALTER TABLE CategoriesDes MODIFY label varchar2(255);
ALTER TABLE CategoriesDes MODIFY idDes NOT NULL ENABLE;
ALTER TABLE CategoriesDes MODIFY langId NOT NULL ENABLE;

REM ======================================================================
  
ALTER TABLE Metadata MODIFY id NOT NULL ENABLE;
ALTER TABLE Metadata MODIFY createDate varchar2(30);
ALTER TABLE Metadata MODIFY changeDate varchar2(30);
ALTER TABLE Metadata MODIFY data clob;
ALTER TABLE Metadata MODIFY harvestUuid varchar2(250);
ALTER TABLE Metadata MODIFY harvestUri varchar2(512);
ALTER TABLE Metadata ADD doctype varchar2(255);

REM ======================================================================
 
CREATE TABLE Validation 
  (
    metadataId   int          not null,
    valType      varchar2(40) not null,
    status       int,
    tested       int,
    failed       int,
    valDate      varchar2(30),
    primary key(metadataId, valType)
);

REM ======================================================================
  
ALTER TABLE MetadataCateg MODIFY metadataId NOT NULL ENABLE;
ALTER TABLE MetadataCateg MODIFY categoryId NOT NULL ENABLE;

REM ======================================================================
 
CREATE TABLE StatusValues
  (
    id        int           not null,
    name      varchar2(32)  not null,
    reserved  char(1)       default 'n' not null,
    primary key(id)
  );

REM ======================================================================

CREATE TABLE StatusValuesDes
  (
    idDes   int           not null,
    langId  varchar2(5)   not null,
    label   varchar2(96)  not null,
    primary key(idDes,langId)
  );

REM ======================================================================

CREATE TABLE MetadataStatus
  (
    metadataId      int            not null,
    statusId        int            default 0 not null,
    userId          int            not null,
    changeDate      varchar2(30)   not null,
    changeMessage   varchar2(2048) not null,
    primary key(metadataId,statusId,userId,changeDate),
    foreign key(metadataId) references Metadata(id),
    foreign key(statusId)   references StatusValues(id),
    foreign key(userId)     references Users(id)
  );

REM ======================================================================
 
ALTER TABLE OperationAllowed MODIFY groupId NOT NULL ENABLE;
ALTER TABLE OperationAllowed MODIFY metadataId NOT NULL ENABLE;
ALTER TABLE OperationAllowed MODIFY operationId NOT NULL ENABLE;

CREATE INDEX OperationAllowedNDX1 ON OperationAllowed(metadataId);

REM ======================================================================
 
ALTER TABLE MetadataRating MODIFY metadataId NOT NULL ENABLE;
ALTER TABLE MetadataRating MODIFY ipAddress NOT NULL ENABLE;

REM ======================================================================
 
ALTER TABLE MetadataNotifiers MODIFY id NOT NULL ENABLE;

REM ======================================================================
 
ALTER TABLE MetadataNotifications MODIFY metadataId NOT NULL ENABLE;
ALTER TABLE MetadataNotifications MODIFY notifierId NOT NULL ENABLE;
ALTER TABLE MetadataNotifications MODIFY errormsg clob;

REM ======================================================================
  
ALTER TABLE CswServerCapabilitiesInfo MODIFY idField NOT NULL ENABLE;
ALTER TABLE CswServerCapabilitiesInfo ADD label2 CLOB;
UPDATE CswServerCapabilitiesInfo SET label2 = label;
ALTER TABLE CswServerCapabilitiesInfo DROP COLUMN label;
ALTER TABLE CswServerCapabilitiesInfo RENAME COLUMN label2 TO label;

REM ======================================================================


CREATE TABLE Thesaurus
  (
    id           varchar2(250) not null,
    activated    varchar2(1),
    primary key(id)
  );

REM ======================================================================

CREATE TABLE spatialIndex
  (
    fid      int            not null,
    id       varchar2(250),
    the_geom SDO_GEOMETRY,
    primary key(fid)
  );

CREATE INDEX spatialIndexNDX1 ON spatialIndex(id);
DELETE FROM user_sdo_geom_metadata WHERE TABLE_NAME = 'SPATIALINDEX';
INSERT INTO user_sdo_geom_metadata (TABLE_NAME, COLUMN_NAME, DIMINFO, SRID) VALUES ( 'SPATIALINDEX', 'the_geom', SDO_DIM_ARRAY( SDO_DIM_ELEMENT('Longitude', -180, 180, 10), SDO_DIM_ELEMENT('Latitude', -90, 90, 10)), 8307);
CREATE INDEX spatialIndexNDX2 on spatialIndex(the_geom) INDEXTYPE IS MDSYS.SPATIAL_INDEX;

CREATE INDEX MetadataNDX3 ON Metadata(owner);   
ALTER TABLE Validation ADD FOREIGN KEY (metadataId) REFERENCES Metadata (id);  
ALTER TABLE StatusValuesDes ADD FOREIGN KEY (idDes) REFERENCES StatusValues (id);
ALTER TABLE StatusValuesDes ADD FOREIGN KEY (langId) REFERENCES Languages (id);

CREATE TABLE Services (
    id         int,
    name       varchar(64)   not null,
    class       varchar(1048)   not null,
    description       varchar(1048),
    primary key(id)
  );

CREATE TABLE ServiceParameters (
    id         int,
    service     int,
    name       varchar(64)   not null,
    value       varchar(1048)   not null,
    primary key(id),
    foreign key(service) references Services(id)
  );