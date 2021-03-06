CREATE SEQUENCE user_id_seq;
CREATE TABLE users(
  idUser INT NOT NULL DEFAULT nextval('user_id_seq') PRIMARY KEY,
  surname VARCHAR NOT NULL,
  name VARCHAR NOT NULL,
  email VARCHAR NOT NULL
);

CREATE SEQUENCE spec_id_seq;
CREATE TABLE spec(
  idSpec INT NOT NULL DEFAULT nextval('spec_id_seq') PRIMARY KEY,
  nameSpec VARCHAR NOT NULL
);

CREATE TABLE specUsers(
  idUser INT NOT NULL UNIQUE,
  surname VARCHAR NOT NULL,
  name VARCHAR NOT NULL,
  otchestvo VARCHAR,
  email VARCHAR NOT NULL,
  number VARCHAR,
  idSpec INT NOT NULL,
  city VARCHAR NOT NULL,
  address VARCHAR NOT NULL,
  info VARCHAR,
  FOREIGN KEY (idUser) REFERENCES users(idUser),
  FOREIGN KEY (idSpec) REFERENCES spec(idSpec)
);

CREATE SEQUENCE parameter_id_seq;
CREATE TABLE parameters(
  idParameter INT NOT NULL DEFAULT nextval('parameter_id_seq') PRIMARY KEY,
  nameParameter VARCHAR NOT NULL
);

CREATE SEQUENCE access_id_seq;
CREATE TABLE access(
  idAccess INT NOT NULL DEFAULT nextval('access_id_seq') PRIMARY KEY,
  nameAccess VARCHAR NOT NULL
);

CREATE SEQUENCE review_id_seq;
CREATE TABLE reviews(
  idReview INT NOT NULL DEFAULT nextval('review_id_seq') PRIMARY KEY,
  idUser INT NOT NULL,
  surname VARCHAR NOT NULL,
  name VARCHAR NOT NULL,
  otchestvo VARCHAR,
  idSpec INT NOT NULL,
  city VARCHAR NOT NULL,
  address VARCHAR NOT NULL,
  dateTime VARCHAR NOT NULL,
  content VARCHAR NOT NULL,
  status INT NOT NULL,
  FOREIGN KEY (idUser) REFERENCES users(idUser),
  FOREIGN KEY (idSpec) REFERENCES spec(idSpec)
);

CREATE TABLE usersAccess (
  idUser   INT NOT NULL,
  idAccess INT NOT NULL,
  FOREIGN KEY (idUser) REFERENCES users (idUser),
  FOREIGN KEY (idAccess) REFERENCES access (idAccess)
);

CREATE SEQUENCE reviewsParameters_id_seq;
CREATE TABLE reviewsParameters(
  idReviewsParameters INT NOT NULL DEFAULT nextval('reviewsParameters_id_seq') PRIMARY KEY,
  idReview INT NOT NULL,
  idParameter INT NOT NULL,
  value INT NOT NULL,
  FOREIGN KEY (idReview) REFERENCES reviews(idReview),
  FOREIGN KEY (idParameter) REFERENCES parameters(idParameter)
);

CREATE TABLE specsReviews(
  idUser INT NOT NULL,
  idReview INT NOT NULL UNIQUE,
  FOREIGN KEY (idReview) REFERENCES reviews(idReview),
  FOREIGN KEY (idUser) REFERENCES specUsers(idUser)
);