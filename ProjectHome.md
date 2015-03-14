Team Software Project 2011/2012 (CS3305 & CS3505)

Introduction

Academic users within a university have great difficulties in organising ad hoc (i.e. non-timetabled) meetings and tutorials with various student classes and subsets of these classes. The most frequent reason for this is that a student’s start-of-year timetable frequently becomes complicated by subtle changes and additions relating to Practical classes, tutorials, assignments etc so that the original timetable cannot be used a wholly reliable guide to the availability of students at any given time.

You have been contracted to analyse the requirements of the users and to develop a system that both staff and students can use to organize and schedule meetings.

Your task is to
- elicit and analyse user requirements
- develop one or more robust and efficient algorithms which will solve the scheduling Problems
- Develop a system design which will be appropriate for user needs in terms of functionality and user interface.
- Implement the design and perform adequate testing
- Underpinning and accompanying all of the above will be project management and documentation of all stages of the software development process up to and including the delivery of a final Team Report as well as individual Reports from each Team member.

A final presentation of the software product will be made to Staff during the week beginning Monday, March 19th, 2012. Prior to that, several other submissions/interviews will be scheduled. Marks will be awarded at each of these milestones – both for the Team as a whole and for individual Team members. Accordingly, participation by all members of a Team is important. Team members who miss scheduled interviews/submissions will not be awarded marks without sufficient and documented reasons (e.g. medical certificate).

It is the intention that the best product developed during this module will be deployed and used within the Dept of Computer Science. Guidelines relating to requirements are given below. Teams are free to design and incorporate any additional features that they consider would provide their system with significant additional functionality.

Some background to help get you started with establishing requirements and constraints:

There are many commercial systems for handling time management but these systems are generally customised for specific industrial applications and can be difficult to use. Your solution should, ideally, (a) be built specifically for use in organising meetings within an academic institutional environment and (b) be sufficiently generic and configurable that it can be deployed in any such institution.

A meeting is defined as an event that could take the form of a one-to-one meeting (like that of a mentor or a supervisor) a group meeting (such as students meeting to discuss a project), or a one-to-many meeting (e.g. a tutorial). To achieve this, a database containing planned and unplanned timetables for students, staff and groups must be developed and populated. A planned timetable is one which is agreed on for a specific length of time, e.g. B.Sc.3 for semester 2. An unplanned timetable is usually specific to an individual, e.g. Fred has a doctors appointment Feb 7th. An algorithm which uses this database to produce solutions to requests for meetings must be sourced (or developed from scratch) and analysed. A User Interface (UI) to facilitate data acquisition, management and solution development is essential to the success of the system. Usage of systems with poor UI’s tends to be low – even if the system is of a high value to its users. The UI that you design and implement therefore must be easy to understand and to use. Remember that your users would include people without any knowledge of algorithms or coding and none of the technical aspects of system construction or the underlying algorithms should be visible or apparent to them.

Problems with Scheduling Meetings:

The problems facing anyone attempting to arrange a meeting at present are:
• No up to date timetable exists for individual students. In theory there exist class timetables for students but class timetables rarely incorporate additions made after the first week of term.
• Many entities can make alterations to timetables. For example, tutorials for CS students can be assigned by non-CS departments without reference to the CS Department’s timetables. Account must also be taken of the fact that students may wish to add items to their timetable specific to them, such as sports events or part-time work.
• Arranging a one off tutorial/lecture is very difficult and the larger the class the more difficult it becomes. At the moment the solution involves handing out blank timetables, asking students to fill them in honestly and attempting to find an appropriate slot manually.
• Changes to existing timetabled activities are time consuming and often impractical under the current model. If, for example, a student wished to be transferred from one tutorial to another the decision made to facilitate this may have knock on effects on other timetables and, at present, these knock-on effects are only discovered by chance and resolved through negotiation with the several parties involved.
• Every individual involved must be contacted for details of their timetable. A system which would allow possible meeting times be derived without having all parties concerned obliged to enter their details afresh each time a new meeting is required would reduce the time and effort needed.



And the software product ….

Elements of the system

User Interface

Context Sensitive Help: Of primary concern when developing the UI is to make it as easy to understand and as user friendly as possible. Examples: If a user is unclear about an element of the user interface it should be easy for them for clarify it. If a user provides incorrect input you must explain the users error, offer them an explanation of what type of input to provide and ensure the users error has no repercussions for them (for instance they must not have to enter the entire contents of a form anew if they supply incorrect information for one field).

Design: The UI requires a design which will make it as easy as possible for users to enter information and perform tasks. A system may have an optimal algorithm and superb deployment design but if users are unwilling (or unable) to use it then it will fail in terms of a critical requirement – usability.

The elements of the user interface you must include:

Timetable entry and maintenance – individual and group - Allow individual staff and individual students access to their timetable information. Allow individuals to alter their own timetables. Allow admin users to enter master timetables for student groups.

Search for an appropriate meeting time – Allow a user to select a group (such as BSc1) or a set of individuals with whom a meeting is desired. The system should compute and display appropriate possibilities. The user may select a meeting time generated by the system which then necessitates that those involved in the meeting need to be notified reliably that a meeting has been preliminary arranged. A reliable notification means one which has a high chance of success and be in a form such that the users are likely to receive meeting details without expending effort on their part. For example an email, twitter, or SMS message is reliable, whereas requiring the user to login to a system they rarely use to receive their notification is not reliable. If a meeting is arranged the database should be updated with the required changes.

Security
Access to individuals timetables may be open to abuse, therefore there must be steps taken to limit users access to only the timetables they need and to reveal only the information that is necessary to make a decision. Individuals must have the freedom to make their information available to who they wish – for example if a three person CS3305 Team would like to arrange a meeting then the Team members need to give each other permission to access their timetables.
There is no requirement to use SSL to encrypt conversations between client and server.



Algorithm
There are many search algorithms available for the purpose of timetabling meetings. You are asked to examine algorithms you think suitable and report on the merits of each and the reason for your selection. You may develop your own algorithm – if so you should compare it to existing algorithms and outline why you think your algorithm is more appropriate.

Data Layer
The data layer must be designed and implemented with the same diligence as applied to the code. Particular attention must be paid to Database Design since a poor design results in negative consequences. The negative consequences can include: (i) a dramatic increase in the amount of processing needed to produce a solution, (ii) loss or corruption of data.

Maintenance
The intention is to deploy the system for day to day use by the Department of CS. If the system is deployed then an administrator will look after the day-to-day requirements of the system and a coding supervisor will look at bug fixing and modifying the system to enable extra facilities. In order to facilitate this, bug tracking will have to be enabled and comprehensive documentation (including helpful comments) maintained. One way to estimate what is required is to put yourself in the position of a manager and ask appropriate questions such as: what database is being used and why?, what were the problems developing this module? how were they solved?, etc.
Elements that you use in the development process, such as a project management systems and bug tracking solutions, are just as useful to those maintaining the software. Therefore you are required to setup and use project management and bug tracking software or sites.
All configuration settings should be accessible via a web-based GUI (i.e. no hard wired values, such as database URL, are permitted). All configuration settings should be stored in an appropriate format (for example XML). Remember that the more configurable the product then the bigger the potential market and the easier it will be to maintain.
Provision must be made for regular back ups of the database. These backups can be stored locally for this project but remember if you are asked in your placement to prepare a backup system you must always store the backup on a different machine/ device.