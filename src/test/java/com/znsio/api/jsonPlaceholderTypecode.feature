@postAndComments @prod

  #TARGET_ENVIRONMENT=prod TAG=@jsonPlaceholderTypecode TYPE=api ./gradlew test
Feature: Fetch posts and commments for a user

  Background:
    * def userId = 1

  Scenario: Fetch Posts from jsonplaceholder for user id 1
    Given def fetchedPosts = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getPosts',{userId}).fetchedPost
    * print "Fetched posts id: ",fetchedPosts.id
    * print "Fetched posts title: ",fetchedPosts.title
    Then match fetchedPosts.id == userId
    And match fetchedPosts.title == '#string'

  Scenario: Fetch Comments from jsonplaceholder for user id 1
    Given def fetchedComments = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getComments',{userId}).fetchedComments
    * print "Fetched comments are for id: ",fetchedComments.id
    * print "Fetched comments are for post id: ",fetchedComments.postId
    * print "Fetched comments name: ",fetchedComments.name
    Then match fetchedComments.id == userId
    And match fetchedComments.body == '#string'