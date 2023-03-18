
USE theGram

CREATE TABLE theGram.users
(
	userID	int PRIMARY KEY IDENTITY(1,1),
	firstName varchar(30),
	lastName varchar(30),
	gender varchar(30),
	userName varchar(30) UNIQUE,
	pw varchar(30),
	mobileNo varchar(30),
	email varchar(100),
	bio varchar(150),
	followerCount int DEFAULT 0,
	followingCount int DEFAULT 0,
	createdAt datetime DEFAULT getdate(),
	editedAt datetime DEFAULT getdate(),
	activeYN bit DEFAULT 1
)

CREATE TABLE theGram.posts
(
	postID int PRIMARY KEY IDENTITY(1,1),
	userID int FOREIGN KEY REFERENCES theGram.users(userID),
	postLocation nvarchar(max),
	caption varchar(2000),
	createdAt datetime DEFAULT getdate(),
	editedAt datetime DEFAULT getdate(),
	activeYN bit DEFAULT 1,
	likeCount int DEFAULT 0,
	commentCount int DEFAULT 0
)

CREATE TABLE theGram.followers
(
	followerID int PRIMARY KEY IDENTITY(1,1),
	userID int FOREIGN KEY REFERENCES theGram.users(userID),
	followedUserID int FOREIGN KEY REFERENCES theGram.users(USERID)
)

CREATE TABLE theGram.post_likes
(
	likeID int PRIMARY KEY IDENTITY(1,1),
	userID int FOREIGN KEY REFERENCES theGram.users(userID),
	postID int FOREIGN KEY REFERENCES theGram.posts(postID)
)

ALter TABLE theGram.post_comments
(
	commentID int PRIMARY KEY IDENTITY(1,1),
	comment varchar(1000),
	userID int FOREIGN KEY REFERENCES theGram.users(userID),
	postID int FOREIGN KEY REFERENCES theGram.posts(postID),
	noCommentLikes int DEFAULT 0,
	createdAt datetime DEFAULT getdate(),
	editedAt datetime DEFAULT getdate(),

)

CREATE TABLE theGram.comment_likes
(
	commentLikeID int PRIMARY KEY IDENTITY(1,1),
	userID int FOREIGN KEY REFERENCES theGram.users(userID),
	commentID int FOREIGN KEY REFERENCES theGram.post_comments(commentID)
)

CREATE TABLE theGram.block_list
(
	blockID int PRIMARY KEY IDENTITY(1,1),
	userID int FOREIGN KEY REFERENCES theGram.users(userID),
	blockedUserID int FOREIGN KEY REFERENCES theGram.users(userID)
)

CREATE TABLE theGram.messages
(
	messageID int PRIMARY KEY IDENTITY(1,1), 
	sentFromID int FOREIGN KEY REFERENCES theGram.users(userID),
	sentToID int FOREIGN KEY REFERENCES theGram.users(userID),
	messageContent nvarchar(max),
	mediaContent nvarchar(max),
	timeStampp datetime DEFAULT getdate(),
	createdAt datetime DEFAULT getdate(),
	editedAt datetime DEFAULT getdate(),
	activeYN bit DEFAULT 1
)

CREATE TABLE theGram.last_seen
(
	lastID int PRIMARY KEY IDENTITY(1,1),
	userID int FOREIGN KEY REFERENCES theGram.users(userID),
	timestampp datetime
)

CREATE TABLE theGram.groups
(
	groupID int PRIMARY KEY IDENTITY(1,1),
	groupName varchar(30),
	createdBy int FOREIGN KEY REFERENCES theGram.users(userID)
)

CREATE TABLE theGram.group_members
(	
	groupMemberID int PRIMARY KEY IDENTITY(1,1),
	groupID int FOREIGN KEY REFERENCES theGram.groups(groupID),
	userID int FOREIGN KEY REFERENCES theGram.users(userID),
	adminYN bit DEFAULT 0
)
alter table  theGram.post_comments add activeYN bit default 1;
select * from theGram.post_comments

	