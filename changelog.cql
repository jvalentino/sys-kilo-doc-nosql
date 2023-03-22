CREATE KEYSPACE examplesys WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 1};

CREATE TABLE examplesys.doc (
    doc_id UUID PRIMARY KEY,
    name text,
    mime_type text,
    created_by_user_id text,
    updated_by_user_id text,
    created_date_time timestamp,
    updated_date_time timestamp
);

CREATE TABLE examplesys.doc_version (
    doc_version_id UUID,
    doc_id UUID,
    name text,
    mime_type text,
    created_by_user_id text,
    created_date_time timestamp,
    data blob,
    PRIMARY KEY(doc_version_id, created_date_time)
) WITH CLUSTERING ORDER BY (created_date_time ASC);

CREATE INDEX IF NOT EXISTS ON examplesys.doc_version (doc_id);

