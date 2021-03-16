# Reflection
----
## What we have implemented:

At milestone3 stage, we have implemented four graphs into our hr-marketing-analytics R project. Since we have the python version on hand, it is easier to implement the R version. However, we still find difficulties in deploying our Dashboard. We used some pipe and map functions in our code so that our code is much easier to read. Basically this project provides a similar structure with our [milestone2](https://github.com/ubco-mds-2020-labs/dashboard-project-data551_group9/releases/tag/v1.1) stage. The difference is that we are now using a different language to implement it. We also export our wrangled dataset into four csv files. Same as before, our Dashboard includes two tabs, one is from HR perspective, and another one is from Advertising perspective. Audience can select the topic that they want to explore, either HR perspective or marketing perspective. Below points will introduce the functionality of each tab:

- The first tab (HR perspective): title is given as "HR Analytics on Training". On the left hand side, there are two dropdown menus and one radio button menu. Users can select desired education levels and do comparisons by using the two dropdown menus. Users can select previous company size by using the radio button menu. These two graphs can help HR to explore the relationship between education level or previous company size, and training hours.

- The second tab (Advertising perspective): title is given as "Advertising Analytics on Job Change". On the left hand side, there's a slider and a dropdown menu. Users can select desired city index range by using the slider. City Development Index was developed for the Second United Nations Conference on Human Settlements in 1996. It measures the level of development in cities. Higher index indicates that the city is more developed. Users can also select experience level by using the dropdown menu. The first graph on the right shows the relationship between city index and percentage of people who want to change their job, given their last job duration. The will help marketing department to allocate advertisement fees in cities with different development index. The second graph on the right will help marketing department to explore more in the question of which major and education level will have more people who want to switch their job.

## Feedback received from DATA 552 audience:

Below points are given by DATA 552 TA and Firas:
- Could add the years of experience in the drop-down (i.e., what does ‘experienced’ mean?)
- Graduate v. Master’s option in dropdown unclear (i.e., M.A. can be part of graduate school)

Since "Graduate" is not clear to the audience, we changed it into "Bachelor" in the milestone3 stage. We fliped the x and y axis in our stage 2 project, which is not correct. This issue has now been fixed in this milestone3 stage. Our TA from DATA 552 suggests to add time range for "experience", "limited experienced", etc.. Now those intervals have been added in our dropdown menu. We also have some feedbacks from other students. Those feedbacks will be implemented in milestone4 stage. And I include those suggestions below, in future implements and improvements session.

## Future implements and improvements:

At this stage, we have shown our dashboard structure. However, we have more work to do. Our Dashboard still has a lot of white space and we need to figure out a way to fill in those white space. Below points are further implements or improvements we will add in milestone4 stage:

- We will add more information in text. For example, introduction under each tabs, explanation of each dropdown/radio/slider menu, and explanation for each graph. Beside, we will also add some hyper links for users to explore more information. 

- We are still discussing the importance of these four graphs, or maybe we can obtain more useful information than the four we have already implemented. As well, for the second graph on the right under advertising perspective tab, we are still trying to find a way to deal with those missing information. The problem is that we cannot just delete that part because it contains a lot information that we don't want to lose. We need to figure out a way to deal with this.

- The coding part also need to be improved. We will add more explanation in our coding part. We will try to seperate them into several "def" so that people who want to improve our dashboard can easily read our code. On the other hand, the htmlbr() looks ugly in our code. We are seeking out a way to address this.