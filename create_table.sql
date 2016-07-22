-- init database and import data from xml files
-- usage:connect to mysql and source create_table.sql;
drop database if exists meta_stackoverflow;
create database meta_stackoverflow;
use meta_stackoverflow;
CREATE TABLE IF NOT EXISTS `Badges` (
  `Id` int(11),
  `UserId` int(11),
  `Name` varchar(50),
  `Date` timestamp,
  `Class` int(2),
  `TagBased` enum('True','False')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Comments` (
  `Id` int(11),
  `PostId` int(11),
  `Score` int(11),  
  `Text` LONGTEXT,
  `CreationDate` timestamp,
  `UserId` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PostHistory` (
  `Id` int(11),
  `PostHistoryTypeId` int(11),
  `PostId` int(11),
  `RevisionGUID` varchar(50),
  `CreationDate` timestamp,
  `UserId` int(11),
  `UserDisplayName` varchar(50),
  `Comment` LONGTEXT,
  `Text` LONGTEXT,
  `CloseReasonId` int
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PostLinks` (
  `Id` int(11),
  `CreationDate` timestamp,
  `PostId` int(11),
  `RelatedPostId` int(11),
  `LinkTypeId` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Posts` (
  `Id` int(11),
  `PostTypeId` int(11),
  `ParentID` int(11),
  `AcceptedAnswerId` int(11),
  `CreationDate` timestamp,
  `Score` int,
  `ViewCount` int,
  `Body` LONGTEXT,
  `OwnerUserId` int,
  `LastEditorUserId` int,
  `LastEditorDisplayName` varchar(255),
  `LastEditDate` timestamp,
  `LastActivityDate` timestamp,
  `CommunityOwnedDate` timestamp,
  `CloseDate` timestamp,
  `Title` LONGTEXT,
  `Tags` varchar(255),
  `AnswerCount` int,
  `CommentCount` int,
  `FavoriteCount` int
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Tags` (
  `Id` int(11),
  `TagName` varchar(50),
  `Count` int,
  `ExcerptPostId` int,
  `WikiPostId` int
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Users` (
  `Id` int(11),
  `Reputation` int(11),
  `CreationDate` timestamp,
  `DisplayName` varchar(255),
  `LastAccessDate` timestamp,
  `Location` varchar(255),
  `WebsiteUrl` varchar(255),
  `AboutMe` LONGTEXT,
  `Views` int,
  `UpVotes` int,
  `DownVotes` int,
  `Age` int,
  `AccountId` int 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Votes` (
  `Id` int(11),
  `PostId` int(11),
  `VoteTypeId` int,
  `CreationDate` timestamp,
  `UserId` int,
  `BountyAmount` int
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- use common_schema;
-- call foreach('{Badges,Comments,PostHistory,PostLinks,Posts,Tags,Users,Votes}','LOAD XML LOCAL INFILE "data/meta/${1}.xml" INTO TABLE meta_stackoverflow.${1}');
-- call foreach('{Badges,Comments,PostHistory,PostLinks,Posts,Tags,Users,Votes}','create table test.${1}(id int,name varchar(20))');
-- use meta_stackoverflow;

LOAD XML LOCAL INFILE 'data/meta/Badges.xml' INTO TABLE Badges;
LOAD XML LOCAL INFILE 'data/meta/Comments.xml' INTO TABLE Comments;
LOAD XML LOCAL INFILE 'data/meta/PostHistory.xml' INTO TABLE PostHistory;
LOAD XML LOCAL INFILE 'data/meta/PostLinks.xml' INTO TABLE PostLinks;
LOAD XML LOCAL INFILE 'data/meta/Posts.xml' INTO TABLE Posts;
LOAD XML LOCAL INFILE 'data/meta/Tags.xml' INTO TABLE Tags;
LOAD XML LOCAL INFILE 'data/meta/Users.xml' INTO TABLE Users;
LOAD XML LOCAL INFILE 'data/meta/Votes.xml' INTO TABLE Votes;