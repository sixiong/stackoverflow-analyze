drop database if exists stackoverflowly;
create database stackoverflowly;
use stackoverflowly;
create table Badges(
    `Id` int ,
    `UserId` int ,
    `Name` varchar(50) ,
    `Date` timestamp ,
    `Class` int ,
    `TagBased` enum('True','False') 
);
create table Comments(
    `Id` int ,
    `PostId` int ,
    `Score` int ,
    `Text` longtext ,
    `CreationDate` timestamp ,
    `UserId` int 
);
create table PostHistory(
    `Id` int ,
    `PostHistoryTypeId` int ,
    `PostId` int ,
    `RevisionGUID` longtext ,
    `CreationDate` timestamp,
    `UserId` int ,
    `Comments` longtext default null,
    `Text` longtext default null
);
create table PostLinks(
    `Id` int ,
    `CreationDate` timestamp,
    `PostId` int ,
    `RelatedPostId` int ,
    `LinkTypeId` int 
);
create table Posts(
    `Id` int ,
    `PostTypeId` int  ,
    `AcceptedAnswerId` int ,
    `CreationDate` timestamp,
    `Score` int ,
    `ViewCount` int ,
    `Body` longtext ,
    `OwnerUserId` int ,
    `LastEditorUserId` int ,
    `LastEditDate` timestamp,
    `LastActivityDate` timestamp,
    `Title` longtext ,
    `Tags` longtext ,
    `AnswerCount` int ,
    `CommentCount` int 
);
create table Tags(
    `Id` int ,
    `TagName` longtext ,
    `Count` int ,
    `ExcerptPostId` int ,
    `WikiPostId` int 
);
create table Users(
    `Id` int,
    `Reputation` int ,
    `CreationDate` timestamp,
    `DisplayName` varchar(255) ,
    `LastAccessDate` timestamp,
    `Location` longtext ,
    `AboutMe` longtext default null,
    `Views` int default null,
    `UpVotes` int ,
    `DownVotes` int ,
    `ProfileImageUrl` longtext default null,
    `Age` int ,
    `AccountId` int 
);
create table Votes(
    `Id` int ,
    `PostId` int ,
    `VoteTypeId` int ,
    `UserId` int ,
    `CreationDate` timestamp
);

Load xml local infile 'data/meta/Badges.xml' into table Badges;
Load xml local infile 'data/meta/Comments.xml' into table Comments;
Load xml local infile 'data/meta/PostHistory.xml' into table PostHistory;
Load xml local infile 'data/meta/PostLinks.xml' into table PostLinks;
Load xml local infile 'data/meta/Posts.xml' into table Posts;
Load xml local infile 'data/meta/Tags.xml' into table Tags;
Load xml local infile 'data/meta/Users.xml' into table Users;
Load xml local infile 'data/meta/Votes.xml' into table Votes;


