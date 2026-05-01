CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(50) not null,
    user_name VARCHAR(50) NOT NULL UNIQUE,
    user_email VARCHAR(100) NOT NULL UNIQUE,
    user_phone VARCHAR(20) NOT NULL UNIQUE,
    user_dob DATE,
    user_password VARCHAR(100) NOT NULL,
    profile_picture VARCHAR(100),
    cover_picture VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
                    
	CREATE TABLE posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    post_description TEXT(500) default null,
    post_img VARCHAR(100) default null,
    like_counts INT UNSIGNED DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
        ON DELETE CASCADE
);

CREATE TABLE comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    parent_id INT default null,
    comment_text TEXT(500) default null,
    comment_image varchar(100) default null,
    like_counts int unsigned default 0,
    create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id)
        REFERENCES posts (post_id) on delete cascade,
    FOREIGN KEY (parent_id)
        REFERENCES comments (comment_id)
        ON DELETE CASCADE
);

create table followers(
					follower_id int ,
                    following_id int ,
                    primary key(follower_id,following_id),
                    created_at timestamp default current_timestamp,
                    foreign key(follower_id) references users(user_id) on delete cascade,
                    foreign key(following_id) references users(user_id) on delete cascade
);
create table otp_storage(otp_id int primary key auto_increment,
						user_id int,
						hash_otp varchar(100),
                        expire_at bigint unsigned,
                        created_at timestamp default current_timestamp,
                        foreign key(user_id) references users(user_id) on delete cascade
);

create table post_likes(like_id int primary key auto_increment,
						user_id int,
                        post_id int,
                        created_at timestamp default current_timestamp,
                        foreign key(user_id) references users(user_id) on delete cascade,
                        foreign key(post_id) references posts(post_id) on delete cascade
);

create table retweets(	retweet_id int primary key auto_increment,
						user_id int,
                        post_id int,
                        created_at timestamp default current_timestamp,
                        foreign key(user_id) references users(user_id) on delete cascade,
                        foreign key(post_id) references posts(post_id) on delete cascade
);

CREATE TABLE comment_likes (
    like_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    comment_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
        ON DELETE CASCADE,
    FOREIGN KEY (comment_id)
        REFERENCES comments(comment_id)
        ON DELETE CASCADE
);
use Twitter;
drop table comments;
drop table follow;
drop table otp_storage;
delete from comments ;
select * from posts;
select * from retweets;
select * from comment_likes;
select * from post_likes;
select * from comments;
select * from users;
select * from followers;
select * from post_likes;
SET sql_safe_updates=0;
select * from otp_storage;
delete from users;
select * from posts as p join users as u on p.user_id=u.user_id;
select * from posts as p left join retweets as r on p.post_id=r.post_id; 
alter table posts add column comment_counts int unsigned default 0 after like_counts;
alter table posts add column retweet_counts int unsigned default 0 after comment_counts;
alter table comments add column comment_counts int unsigned default 0 after like_counts;


                            
                    