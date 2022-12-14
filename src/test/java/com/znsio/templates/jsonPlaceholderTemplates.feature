@template
Feature: Templates for jsonPlaceHolderTypecode

  Background:
    Given url env.jsonPlaceHolderUrl

  @t_getPosts
  Scenario: Fetch posts and comments for user id
    Given path 'posts/' + userId
    * print "Get all posts with userId as " + userId
    When method GET
    And def fetchedPost = response
    * print "Posts found: ", fetchedPost
    * print "Status: ", responseStatus
    Then match responseStatus == 200
