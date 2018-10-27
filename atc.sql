create table atc(
controller_id varchar(4) not null,
password varchar(20),
primary key(controller_id));

create table pilot(
pilot_id varchar(4) not null,
name varchar(20),
password varchar(20),
gender varchar(1),
airlines varchar(20),
controller_id varchar(4),
primary key(pilot_id),
foreign key(controller_id) references atc(controller_id) on delete cascade);

create table flight(
flight_id varchar(4) not null,
aircraft_name varchar(10),
priority varchar(10),
no_of_pass varchar(3),
emergency varchar(10),
airlines varchar(20),
status varchar(20),
type varchar(15),
source varchar(20),
destination varchar(20),
arrival varchar(20),
pilot_id varchar(4),
primary key(flight_id,destination,arrival),
foreign key(pilot_id) references pilot(pilot_id) on delete cascade);

create table passenger(
p_id varchar(4) not null,
p_name varchar(20),
password varchar(20),
gender varchar(1),
flight_id varchar(4),
primary key(p_id),
foreign key(flight_id) references flight(flight_id) on delete cascade);

create table airport(
airport_name varchar(20),
distance varchar(5),
time varchar(5),
primary key(airport_name));

create table runway(
runway_no varchar(2),
controller_id varchar(4),
is_available varchar(5),
airport_name varchar(20),
primary key(runway_no,controller_id),
foreign key(controller_id) references atc(controller_id) on delete cascade,
foreign key(airport_name) references airport(airport_name) on delete cascade);

create table weather(
cur_date date,
controller_id varchar(4),
temperature varchar(3),
wind_speed varchar(3),
wind_direction varchar(15),
primary key(cur_date,controller_id),
foreign key(controller_id) references atc(controller_id) on delete cascade); 
