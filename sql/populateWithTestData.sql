USE `bootcamp` ;

insert into roles(id, role) values (1, 'student');	
insert into roles(id, role) values (2, 'teacher');	
insert into roles(id, role) values (3, 'admin');

insert into users(username, password, email, role_id) 
values ('admin', md5('admin'), 'youremail@domain.com', 3);