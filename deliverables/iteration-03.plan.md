# U of T Eats

## Iteration 3

 * Start date: Nov 13, 2018
 * End date: Nov 30, 2018

## Process

#### Changes from previous iteration
 
 1. More careful estimation of what can be completed when we set our sprint goals.  Last iteration we planned too much work for each sprint and what we originally thought would take one sprint took almost two.  We also had initially planned to do database integration in iteration 2, but it got pushed to this one because we didn't have enough time.  We want to more carefully plan and make sure to meet sprint goals this iteration because this is the last one, so we need to make our goals in order to get the project working in time for the final demo.  If we feel that we cannot complete all the features that we want, we need to cut back on these features now so that we do not end up with an unifinshed project or work on things that won't end up in the final project.  A metric that we could use to see if we meet this goal is to see whether we successfully completed all the tasks that we assigned on the Azure board at the end of a sprint.
 
 2. More feedback on each others code.  We want to change our process for this because we lacked feedback on code in the last iteration and we need to make sure that we follow similar code styles and have good code quality in our repo.  We plan to review code by giving feedback in the comments of a pull request with suggested improvements and also verbally during our meetings.  A success metric we could use is having at least one feedback comment made by the reviewer on every pull request.

#### Roles & responsibilities

Product Manager: Finnbarr
 - Responsible for determining what features we absolutely must have in our MVP in order to meet our project goals. Also responsible for pushing the team to meet the goals that we set so that the project can be delivered on time.  Also responsible for filming and recording the demo in order to show the value of our product to potential users.
 
Scrum Master: Jordan
 - Responsible for making sure that the process is followed and trying to imporove the process so that we can work effectively and without issues in iteration 3.  Responsible for helping people with any issues they have, which this iteration could potentially be merge conflicts or trouble integrating with the database.  Just like last iteration, as scrum master he must work with the product manager to make sure the backlog is in good shape.
 
Video Editor: Kara
 - Responsible for editing the videos and voiceovers that the product manager will produce in order to complete the deliverable on time.

#### Events
 
Since weekly sprints seemed to work well last iteration, we will again do this and will continue having our sprint planning and review meetings every Tuesday to end one sprint and start the next.  We will have these meetings in SF2202.  The purpose of the sprint planning meeting is to discuss what we want to acoomplish in the following week and how we will meet those goals.  It is an opportunity for anyone to ask for help and to make sure everyone knows what is going on in our project.  The sprint review meeting is for seeing whether or not we got all the assigned work done in the last week and discussing how we can change our process to improve for the next sprint.
 
We also plan to have a final integration meeting.  This will occur sometime in the last week before the end of the last iteration.  The purpose of this meeting is to make sure everyones screen are integrated properly with each other and working as intended.  It will be an opportunity to iron out any bugs and to make sure everyone has their tasks done.  We will merge all our finished code in the master branch and this will be our finished product.

#### Artifacts

Azure board:
 - Here we will backlog tasks that need to get done.  At the start of each sprint we will prioritize what tasks we need to get done in the following week and then add them to the board.  The board will show what is currently being worked on, tested and is finished.  Every week during the sprint planning meeting we have we will discuss what we are working on for the week.  We will add tasks to the board based on this discussion.  We will be more careful with what we assign to the board in this iteration, so that we can meet the goals that we set, in accordance with the planned process changes above.
 - Azure Board Link: https://dev.azure.com/wilbertguo/Food%20Truck%20App/
 - Azure board screenshots are in a folder on the repo
 
Slack Channel:
 - The channel will be used by all members to communicate.  It has been effective in communication in the previous iterations because everyone actively checks slack and will continue to do so in this iteration.
   
Github Repo:
 - This is where the code will be shared, merged and discussed in pull requests.  In this iteration we hope to give useful feedback on each others code and not merge our own pull requests, which is a change we are making from last iteration.

#### Git / GitHub workflow

We will manage our GitHub repository the same way as we did in the last iteration.  We have a dev branch that is a branch off of master and every team member creates a branch off of dev for their personal development.  The advantage of this approach is that when members have incomplete code it is confined to their development branch.  When they have a working feature or chunk of code, they can pull request from their personal dev branch to the main dev branch.  Pull requests will be reviewed by any other team member and they will merge if the code looks good or leave a comment if it needs to be fixed.  At the end of every sprint we will pull request from dev into master.  This way, we will only be adding code to master when we have a larger set of features to commit to our project and it also gives an final opportunity to analyze the changes before we accept the pull request.  We agreed to use the standard dart conventions for naming and other code styles.  We chose this workflow because it allows us to work on features independently and only have finished features in the dev branch, avoiding many pieces of incomplete code in a part of the repo we are all using. It also allows us to review each members code before accepting it into a repository that has code from everyone.

## Product

#### Goals and tasks
 
1. Set up the database.  This involves creating a firebase database using a new gmail account, then setting up the database to talk to both the android and ios side of our app by following the configuration instructions that google provides.  This is the most important step because it needs to be completed before we can have the screens store the data to make our app functional.

2. Integrate all the screens with the database.  This involves writing user input to the database from our app, such as when a user creates an account, when an order is ready to be picked up or when a server wants to change their menu.  It also involves reading from the database in order to display food trucks, menus, and lots of other information for both the clients and servers.  It is also critical for us to get this done because it completes the basic functionality of our app.

3. UI improvements.  This involves improving the user experience on our app by making the app look better with improvements such as better alginments, fonts and other styling in order to make our app visually appealing.

#### Artifacts

 - A video demoing our work up to the last iteration of the project.  This is a required part of deliverable 3, but also very important because it allows anyone to quickly get a sense of what we built, why it is useful and our plans for it.
 - The Code for the app.  At this point in the project, we should have a MVP that we can use to show anyone what our app actually looks like, how it works and why it is useful to students.
 - The database for the app.  This is necessary to have in order to communicate information between the clients and the servers and will be useful so we can show how information that the app needs is stored and communicated between users.
 - Screenshots of Azure board will be useful in giving an overview of our workflow.
 
