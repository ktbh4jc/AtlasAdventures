# README

## About Atlas Adventures
This is the side project of one of your fellow adventurers. It's a tool to help keep everything organized. When it is
done, you can track your characters as they grow and die. You can submit character sheets to the DMs. I plan to support
custom token submission, experience and level tracking, storage of multiple resources for multiple characters per user,
and whatever else gets people excited!

Eventually (like, AA2.0) you may even be able to use this to DM your own games! I have big plans and even bigger
ambitions. THAT BEING SAID, I also have a full time job, writing code, so forgive me if this takes a while.
### How to run the test suite: 
```bash
# To run entire suite:
$ rspec
# To run specific specs:
$ rspec spec/path_to_spec:lineNumber
```



### Contribution guide
SO, you think you can make this better? GREAT! There are, however, certain requirements.  
1. There must be a clear and present benefit to the code you are adding.
2. There should only be one major feature added per pull request.
2. You must adhere to the provided style guide (run `$ rubocop` from root directory to make sure).
3. All added code must be tested using rspec.  
    -You are encouraged to use Factory Bot (the new name for Factory Girl) and Capybara where applicable.
4. All tests must be passing.
5. You are responsible for handling all rebasing needed for a clean merge.  
    -This includes squashing your commits down into one.
6. You are expected to follow all present structures and paradigms.
7. Readability is more important than pulling off some sweet programing jank.