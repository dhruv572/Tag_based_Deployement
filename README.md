This project showcases how you can manage automated Tag-Based deployment using Jenkins-Tag-Creating Ability.

If you want Jenkins to create a tag eveyrtime a new build-job is run, and want that tag to represent a version number - to signify the change as version history, then this walkthrough will surely help you.

This project also has the feature of versioning the tag based on type of change being made...

If the change being made is a "Major" change, it will change the push the tag in such a way === v1.2 ---> 2.0, v3.0 ---> v4.0, v5.4 ---> v6.0

If the change being made is a "Minor" change, it will change the push the tag in such a way === v1.2 ---> v1.3, v3.0 ---> v3.1, v5.4 ---> v5.5



Prerequistes :-

1. Ensure the create a tag & export tag additional behaviours are enabled in the "Source Code Management" section
![image](https://github.com/user-attachments/assets/6f1f80f5-d6a8-40fc-9113-3a0cad5bd72f)
This will allow jenkins to create a tag, export that as $GIT_TAG_NAME as a environment variable in the jenkins build pipeline session. 

2. In the "General" section, ensure "This Build is parameterized" is checked, and Include this "Choice parameter" as shown below
![image](https://github.com/user-attachments/assets/85b1decb-270e-4632-a794-884eed500a8b)

3. Now, include the script.sh provided, in your execute shell, the script will take care of the rest....


NOTE: Jenkins create the $GIT_TAG_NAME environment variable using a deafult-naming-convention (jenkins-$JOB_NAME-$BUILD_NUMBER), the script changes the name of this particular git_tag_name inside the execute shell sessio, outside the shell, the tag_name environment variable will be labeled by the default-naming-pattern.
