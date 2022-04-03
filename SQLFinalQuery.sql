create database Vehicleloan


create table UserRegistration(
UserId varchar(50) NOT NULL,
Password varchar(50) not null,
RoleId int not null,
constraint pk_user_registration primary key (UserId),
constraint fk_user_registration foreign key(RoleId) references RoleType(RoleId)
)

create table RoleType(
RoleId int identity(100,1),
RoleName varchar(10) not null,
constraint pk_user_type primary key (RoleId)
)

create table ApplicantDetails(
CustomerId int identity(11001,1),
AppliedOn datetime not null,
FirstName varchar(20) not null,
MiddleName varchar(20) not null,
LastName varchar(20) not null,
Age int not null,
Gender varchar(10) not null,
ContactNo bigint not null,
EmailId varchar(50) not null,
Address varchar(100) not null,
State varchar(50) not null,
City varchar(50) not null,
Pincode int not null,
TypeOfEmployement varchar(50) not null,
YearlySalary decimal(18,2) not null,
ExistingEmi decimal(18,2),
UserId varchar(50) not null,
constraint pk_applicant_details primary key (CustomerId),
constraint fk_applicant_details foreign key (UserId) references UserRegistration(UserId)
);


create table Vehicle(
VehicleId INT  identity(100,1) NOT NULL,
CarMake varchar(20) not null,
CarModel varchar(20) not null,
ExshowroomPrice decimal(18,2) default 0,
OnroadPrice decimal(18,2) default 0,
CustomerId int not null,
constraint pk_vehicle primary key (VehicleId ),
 constraint fk_vehicle foreign key (CustomerId) references ApplicantDetails(CustomerId)
); 

create table IdentityDocuments(
identityId bigint identity NOT NULL,
imagepath varchar(max) not null,
InsertedOn Datetime not null,
CustomerId int not null,
constraint pk_identity_documents primary key (identityId),
constraint fk_identity_documents foreign key(CustomerId) references ApplicantDetails(CustomerId)
);

create table ApplicationStatus(
StatusId int identity(1,1),
StatusName varchar(10) not null,
constraint pk_application_status primary key (StatusId) 
)

create table LoanDetails(
LoanAppId int identity(100,1),
LoanAmount decimal(18,2) not null,
LoanTenure int not null,
InterestRate int not null,
CustomerId int not null,
StatusId int NOT NULL,
constraint pk_loan_details primary key (LoanAppId),
constraint fk_loan_details_custid foreign key (CustomerId) references ApplicantDetails(CustomerId),
constraint fk_loan_details_status_id foreign key (StatusId) references ApplicationStatus(StatusId),
)

create table LoanScheme(
SchemeId int identity(100,1),
SchemeName varchar(50) not null,
MaxLoanAmount decimal(18,2) not null,
InterestRate int not null,
Emi decimal(18,2) not null,
ProcessingFee decimal(18,2) not null,
AccountType varchar(50) not null,
CustomerId int not null,
constraint pk_loan_scheme primary key (SchemeId),
constraint fk_loan_scheme foreign key (CustomerId) references ApplicantDetails(CustomerId)
)

alter table Vehicle alter column CustomerId int null 
alter table LoanScheme alter column CustomerId int null 
alter table IdentityDocuments alter column CustomerId int null 
alter table LoanDetails alter column CustomerId int null 
alter table UserRegistration alter column RoleId int null 
alter table ApplicantDetails alter column UserId varchar(50) null 
alter table LoanDetails alter column StatusId int null 

alter table ApplicantDetails alter column MiddleName varchar(20) null 
alter table LoanScheme add SchemeDescription varchar(50) not null
