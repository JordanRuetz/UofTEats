# U of T Eats

## Iteration 02 - Review & Retrospect

 * When: Oct 30
 * Where: SF2202

## Process - Reflection

#### Decisions that turned out well
 
1. Our Azure board was very effective in organizing our team.  Team members stuck to working on the tasks that they were assigned on the board at the start of a sprint and we had no confusion about who was doing what task.  This means that everything assigned was completed by the person it was assigned to and no one wasted time accidentally working on a feature that someone else was already working on.
2. The way that we structured our git repo worked very well.  The way that we had everyone work on their own branches and merge them into a shared dev branch turned out to be very effective.  Our dev branch only contained working code and team members could reclone from it whenever they needed to.  We were also able to merge our work together without conflicts, which was partly due to us sticking to the tasks assigned.
3. Weekly sprint planning and review meetings worked out well.  Everyone knew what we wanted to get done and who was responsible for what tasks.  The meetings were especially helpful when coordinating the making of our demo video for this deliverable.

#### Decisions that did not turn out as well as we hoped

1. We did not use git pull requests very effectively.  We initially planned to use git pull requests to review code, have discussions about it and maybe request changes before merging from a members personal dev branch to the dev branch.  Although the code was sometimes reviewed, no feedback was provided or discussions had.  In some cases, members approved their own pull requests.  This was not ideal as it starts to lead to poor code quality.
2. Collaboration between members on code integration was a little disorganized at times. At some point, code was integrated manually instead of merging from a member's dev branch into the dev branch. This is not ideal as it could lead to difficulty in tracking individual members' contribution. 
3. We assigned too much work during the first sprint.  This was a result of it being midterm season and a lot of members did not have much free time to work on the app.  The result was that we didn't meet a lot of the tasks we wanted to have done in the first sprint and just made them tasks to do in the second sprint.  We should have took in other commitments as a factor when we set the sprint goals.

#### Planned changes

We plan on sticking to the same process because it seemed to be effective for us.  The only thing that we would like to do is adhere to the process a bit more strictly by making sure we use git pull requests effectively and review each others code and also making sure that each member updates the azure board as they complete the tasks assigned to them.

## Product - Review

#### Goals and/or tasks that were met/completed:
 
1. Prototyped the app using justinMind.  This was useful when creating screen layouts in flutter.  The prototypes and images of the screens are in a prototypes folder in our git repo.
2. Created screen layouts in flutter.  This allowed us to make a demo video and be ready to implement the back-end.  This is the code that we have in the uofteats/lib folder in our git repo.
3. Created the demo video for this iteration.  This is also on our git repo.

#### Goals and/or tasks that were planned but not met/completed:

1. Planned to set up the database and various back-end features.  We did not get this far because we assigned more work than that which could be reasonably completed, especially in midterm season.  We plan to do this in the next iteration.

## Meeting Highlights

Going into the next iteration, our main insights are:

1. Focus on the backend in the second iteration.  The first thing we need to do is setup the database.  This will be a Firebase database becuase SQLite will not work since we need something in the cloud.  After the database is set up, we are free to assign back-end tasks to different members with the goal of completeing the backend by the end of iteration 3.  The back-end will complete the user stories that we have on our azure board and make all the screens that we created in this iteration fully functional.
2. Start more closely reviewing each others code.  The purpose of this is to maintain good code quality.  We will always review each others code before it gets merged into the dev branch and we will not merge our own pull requests.  The benefit of doing this is to end up with cleaner, more readable code.
3. Be more careful with how many tasks we assign in one weekly sprint.  We assigned to many tasks in the first sprint we had this iteration and it ended up taking the entire iteration to complete them.  We want to be able to complete the tasks that we assign by the end of a sprint so it is easier to kepp track of what is done and what needs to be done to make our deadlines.
