@template
Feature: Templates for jsonPlaceHolderTypecode

  Background:
    Given url env.jsonPlaceHolderUrl

  @t_getPosts
  Scenario: Fetch posts for user id
    Given path 'posts/' + userId
    * print "Get all posts with userId as " + userId
    When method GET
    And def fetchedPost = response
    * print "Posts found: ", fetchedPost
    * print "Status: ", responseStatus
    Then match responseStatus == 200

  @t_getComments
  Scenario: Fetch comments for user id
    Given path 'comments/' + userId
    * print "Get all comments with userId as " + userId
    When method GET
    And def fetchedComments = response
    * print "Fetched Comments", fetchedComments
    * print "Status: ", responseStatus
    Then match responseStatus == 200

  @t_getAlbums
  Scenario: Fetch albums for the user id
    Given path 'albums/'
    And param userId = userId
    * print "Albums for the user "+ userId
    When method GET
    And def fetchedAlbums = response
    * print "Fetched Albums", fetchedAlbums

  @t_createPost
  Scenario: Create post for the user
    Given path 'posts/'
    And request {"userId": "#(userId)", "title": "#(title)", "body": "#(body)"}
    When method POST
    Then  status 201
    * print response

