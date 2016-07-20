drop database if exists meta_stackoverflow;
create database meta_stackoverflow;
use meta_stackoverflow;
CREATE TABLE IF NOT EXISTS `Badges` (
  `Id` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Date` timestamp NOT NULL,
  `Class` int(2) DEFAULT NULL,
  `TagBased` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Comments` (
  `Id` int(11) NOT NULL,
  `PostId` int(11) NOT NULL,
  `Score` int(11) NOT NULL,  
  `Text` LONGTEXT NOT NULL,
  `CreationDate` timestamp NOT NULL,
  `UserId` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PostHistory` (
  `Id` int(11) NOT NULL,
  `PostHistoryTypeId` int(11) NOT NULL,
  `PostId` int(11) NOT NULL,
  `RevisionGUID` varchar(50) NOT NULL,
  `CreationDate` timestamp NOT NULL,
  `UserId` int(11) NOT NULL,
  `UserDisplayName` varchar(50),
  `Comment` LONGTEXT NOT NULL,
  `Text` LONGTEXT NOT NULL,
  `CloseReasonId` int
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `PostLinks` (
  `Id` int(11) NOT NULL,
  `CreationDate` timestamp NOT NULL,
  `PostId` int(11) NOT NULL,
  `RelatedPostId` int(11) NOT NULL,
  `LinkTypeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Posts` (
  `Id` int(11) NOT NULL,
  `PostTypeId` int(11) NOT NULL,
  `ParentID` int(11),
  `AcceptedAnswerId` int(11),
  `CreationDate` timestamp NOT NULL,
  `Score` int,
  `ViewCount` int,
  `Body` LONGTEXT,
  `OwnerUserId` int,
  `LastEditorUserId` int,
  `LastEditorDisplayName` varchar(50),
  `LastEditDate` timestamp,
  `LastActivityDate` timestamp,
  `CommunityOwnedDate` timestamp,
  `CloseDate` timestamp,
  `Title` LONGTEXT,
  `Tags` int,
  `AnswerCount` int,
  `CommentCount` int,
  `FavoriteCount` int
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Tags` (
  `Id` int(11) NOT NULL,
  `TagName` varchar(50),
  `Count` int,
  `ExcerptPostId` int,
  `WikiPostId` int
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `Users` (
  `Id` int(11) NOT NULL,
  `Reputation` int(11) NOT NULL,
  `CreationDate` timestamp NOT NULL,
  `DisplayName` varchar(50),
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
  `Id` int(11) NOT NULL,
  `PostId` int(11) NOT NULL,
  `VoteTypeId` int,
  `CreationDate` timestamp NOT NULL,
  `UserId` int,
  `BountyAmount` int
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- call foreach("{Badges,Comments,PostHistory,PostLinks,Posts,Tags,Users,Votes}","LOAD XML LOCAL INFILE 'data/meta/${1}.xml' INTO TABLE ${1}");

LOAD XML LOCAL INFILE 'data/meta/Badges.xml' INTO TABLE Badges;
LOAD XML LOCAL INFILE 'data/meta/Comments.xml' INTO TABLE Comments;
LOAD XML LOCAL INFILE 'data/meta/PostHistory.xml' INTO TABLE PostHistory;
LOAD XML LOCAL INFILE 'data/meta/PostLinks.xml' INTO TABLE PostLinks;
LOAD XML LOCAL INFILE 'data/meta/Posts.xml' INTO TABLE Posts;
LOAD XML LOCAL INFILE 'data/meta/Tags.xml' INTO TABLE Tags;
LOAD XML LOCAL INFILE 'data/meta/Users.xml' INTO TABLE Users;
LOAD XML LOCAL INFILE 'data/meta/Votes.xml' INTO TABLE Votes;