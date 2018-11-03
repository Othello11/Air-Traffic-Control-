create database projectflight;

use projectflight;

create table atc(
controller_id integer(4) not null,
password varchar(20),
primary key(controller_id));

create table pilot(
pilot_id integer(4) not null,
name varchar(20),
password varchar(20),
gender varchar(1),
airlines varchar(20),
controller_id integer(4),
primary key(pilot_id),
foreign key(controller_id) references atc(controller_id) on delete cascade);

create table flight(
flight_id varchar(10) not null,
aircraft_name varchar(10),
priority integer(2),
no_of_pass integer(3),
emergency varchar(3),
airlines varchar(20),
status varchar(20),
type varchar(20),
source varchar(20),
destination varchar(20),
departure time,
arrival time,
pilot_id integer(4),
primary key(flight_id,source,destination),
foreign key(pilot_id) references pilot(pilot_id) on delete cascade);


create table passenger(
p_id integer(4) not null,
p_name varchar(20),
gender varchar(1),
flight_id varchar(10),
primary key(p_id),
foreign key(flight_id) references flight(flight_id) on delete cascade);

create table airport(
airport_name varchar(20),
distance int(4),
req_time time,
primary key(airport_name));

create table runway(
runway_no integer(2),
controller_id integer(4),
is_available varchar(5),
airport_name varchar(20),
primary key(runway_no,controller_id),
foreign key(controller_id) references atc(controller_id) on delete cascade,
foreign key(airport_name) references airport(airport_name) on delete cascade);

create table weather(
st_time time,
end_time time,
controller_id integer(4),
temperature integer(2),
wind_speed integer(2),
wind_direction varchar(15),
primary key(st_time, end_time),
foreign key(controller_id) references atc(controller_id) on delete cascade); 
