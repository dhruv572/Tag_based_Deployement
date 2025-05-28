This project showcases how you can manage automated Tag-Based deployment using Jenkins-Tag-Creating Ability.

If you want Jenkins to create a tag eveyrtime a new build-job is run, and want that tag to represent a version number - to signify the change as version history, then this walkthrough will surely help you.

This project also has the feature of versioning the tag based on type of change being made...

If the change being made is a "Major" change, it will change the push the tag in such a way === v1.2 ---> 2.0, v3.0 ---> v4.0, v5.4 ---> v6.0

If the change being made is a "Minor" change, it will change the push the tag in such a way === v1.2 ---> v1.3, v3.0 ---> v3.1, v5.4 ---> v5.5



Prerequistes :-

1. 
