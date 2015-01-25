<h1>Getting and Cleaning Data</h1>

<h1>Course Project 2015</h1>

<p>This is the R script (run_analysis.R) for the Week 3 project in Getting and Cleaning Data Course. </p>

<p>As a prerequisite you will need the <strong>plyr</strong> and <strong>dplyr</strong> packages installed for data manipulation.
If needed install using;</p>

<ul>
<li><p><code>install.packages("dplyr")</code> </p></li>
<li><p><code>install.packages("plyr")</code></p></li>
</ul>

<p>You will also need the UCI HAR Dataset, extracted to your working directory.</p>

<ul>
<li>Download this from <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">here</a></li>
</ul>

<p>This script performs the following</p>

<h2>Aims</h2>

<ol>
<li>Merges the training and the test sets to create one data set</li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement.</li>
<li>Uses descriptive activity names to name the activities in the data set</li>
<li>Appropriately labels the data set with descriptive variable names.</li>
<li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
</ol>

<h2>Steps</h2>

<p>When executed the <strong>run_analysis.r</strong> script performs the following steps;</p>

<ol>
<li>Load Data &amp; Features</li>
<li>Assign column names</li>
<li>Extract the Mean and Standard Deviation</li>
<li>Load Subject and Activity Labels</li>
<li>Convert Reference files</li>
<li>Add Activity Labels as a new column</li>
<li>Add subject information as a new column</li>
<li>rename Columns</li>
<li>Combine Training and Testing data into one table</li>
<li>Grouping data by Subject and then Activity</li>
<li>Write to "Means.txt" file</li>
</ol>
