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
    Then match responseStatus == expectedStatus

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
    *  karate.log("Albums for user id " + userId)
    When method GET
    And def fetchedAlbums = response
    *  karate.log("Fetched Albums " + response)

  @t_createPost
  Scenario: Create post for the user
    Given path 'posts/'
    And request {"userId": #(userId), "title": "#(title)", "body": "#(body)"}
    When method POST
    Then status 201
    * print "Created Post: " , response

  @t_updatePost
  Scenario: Update a post
    Given path 'posts/' + userId
    And request {"title": "#(title)", "body": "#(body)"}
    When method PUT
    Then status 200
    * karate.log("Updated Post: " + response)
