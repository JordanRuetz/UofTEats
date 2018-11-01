# FOOD TRUCK APP

## Iteration 02

 * Start date: Oct 16, 2018
 * End date: Nov 2, 2018

## Process

(Optional:) Quick introduction

#### Roles & responsibilities

Product Manager: Finnbarr
* Responible for knowing the roadmap of our project, making sure the we are accomplishing enough so that we finish on time.  Also responsible for feature definition, choosing which features are most important in our app and what we should not include based on our project goals.

Scrum Master: Jordan
* Responsible for making sure the team follows processes and improving the process in order to make the team more effective.  Responsible for helping anyone with obstacles such as merge conflicts and responsibility uncertainty by communicating with them and calling meetings as necessary.  Also works with the product manager to make sure the backlog is in good shape.

Video Editor: Kara
* Responsible for editing the videos that the team producing to complete the deliverable on time.


#### Events

Describe meetings (and other events) you are planning to have:

 * When and where? In-person or online?
 * What's the purpose of each meeting?
 * Other events could be coding sessions, code reviews, quick weekly sync' meeting online, etc.

Since we are having weekly sprints, we are having a sprint planning and review meeting every Tuesday, to cap off one sprint and start the next.  We also plan to have a prototyping meeting near the start of this iteration to plan the design of our app.  This way we can agree on what each screen of the app will look like so when different members design screens they will have a uniform look.

#### Artifacts

List/describe the artifacts you will produce in order to organize your team.       

 * Artifacts can be To-do lists, Task boards, schedule(s), etc.
 * We want to understand:
   * How do you keep track of what needs to get done?
   * How do you prioritize tasks?
   * How do tasks get assigned to team members?

 We will keep track of what needs to get done through our azure board.  There we have a backlog of tasks that need to get done.  At the start of a sprint we prioritize which tasks need to get done that week and then add them to our board for the week.  From the board, we can see what is currently being worked on, tested or is finished. We will have a general discussion during the sprint planning meeting about who will work on what during the week and can assign tasks on the azure board based on this discussion.  This is flexible however, and may change depending on how much time each member can commit in a given week.  So we can reassign tasks during the week as needed.

#### Git / GitHub workflow

Describe your Git / GitHub workflow.     
Essentially, we want to understand how your team members share a codebase and avoid conflicts. You must incorporate 'Pull Requests' into your process. 

 * Be concise, yet precise.      
For example, "we use pull-requests" is not a precise statement since it leaves too many open questions - Pull-requests from where to where? Who reviews the pull-requests? Who is responsible for merging them? etc.
 * If applicable, specify any naming conventions or standards you decide to adopt.
 * Don't forget to **explain why** you chose this workflow.

To manage our GitHub repository, we will create a dev branch of the master and from the dev branch every member will create their own branch for their development.  When a member is developing a feature or certain part of the project, they will commit their changes to their personal branch of the dev branch.  This way, there are not several sections of incomplete and non-working code in our dev branch.  When a member has finished a feature so that it works, then they will pull request from their branch to the dev branch.  Someone will review the code and accept and merge if the code looks good.  Otherwise, we can request for changes to be made before it is accepted into the dev branch.  At the end of the sprint we will pull request from the dev branch to the master branch, since we will have a larger set of working features to commit to our project.  We can give it a final look before we accept the pull request.  We chose this workflow because it gives us to work on features independently and only have finished features in the dev branch, avoid many pieces of incomplete code.  It also allows us to review each members code before accepting it into a repository that has code from everyone.

## Product

#### Goals and tasks

 * Describe your goals for this iteration and the tasks that you will have to complete in order to achieve these goals.
 * Order the items from most to least important.
 * Feel free (but not obligated) to specify some/all tasks as user stories.

 1. Prototype the app using justinMind.  We will use the user stories to guide us in prototyping all the screens that we need in our app.
 2. Use the prototype to develop the actual layouts for the screens in flutter.  These will form the complete frontend for our app, ready to be integrated with the backend code.
 3. Complete various features of the backend, including setting up the database.  We plan to complete the first two goals as part of the first sprint at the start of the next sprint we will decide which backend features we will complete.  The backend tasks we choose to do will be based off of which user stories are the most important to have.
 
#### Artifacts

List/describe the artifacts you will produce in order to present your project idea.

 * Artifacts can be text, code, images, videos, interactive mock-ups and/or any other useful artifact you can think of.
 * Make sure to explain the purpose of each artifact (i.e. Why is it on your to-do list? Why is it useful for your team?)
 * Be concise, yet precise.         
   For example: "Build the website" is not precise at all, but "Build a static home page and upload it somewhere, so that it is publicly accessible" is much clearer.

 1. A video demoing our work up to the end of iteration 2.  This is a required part of deliverable 2.
 2. The prototypes and layouts for all the screens of our app.  The prototype is useful so different people working on different screens in the app have a common reference for what the app should look like.  We will finish all the screens so we can present the ui of our app and clearly see what we all need to do on the backend to get our app finished.
