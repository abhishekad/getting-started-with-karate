@postAndAlbums @prod

  #TARGET_ENVIRONMENT=prod TAG=@postAndAlbums TYPE=api ./gradlew test
Feature: Fetch posts and albums for a user

  Background:
    * def userId = 1
    * def invalidUserId = 15
@pst
  Scenario Outline: Fetch Posts from jsonplaceholder for different user ids
    Given def fetchedPosts = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getPosts',{'userId': <userId>, expectedStatus: <expectedStatus>}).fetchedPost
    * print "Fetched posts id: ", fetchedPosts.id
    * print "Fetched posts title: ",fetchedPosts.title
    Then match each fetchedPosts[*].id == userId
    Examples:
    | userId | expectedStatus|
    | 1    |  200             |
    | -1   |  404             |
    | ' '  |  404             |
    |'qwer'|  404             |
    | '#*' |  404             |
    | null |  404             |

  Scenario: Fetch Comments from jsonplaceholder for user id 1
    Given def fetchedComments = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getComments',{userId:1}).fetchedComments
    * print fetchedComments.id
    * print "Fetched comments are for post id: ",fetchedComments.postId
    * print fetchedComments.name
    Then match fetchedComments.id == userId
    And match fetchedComments.body == '#string'

  Scenario: Fetch Albums from jsonplaceholder for user id 1
    Given def fetchedAlbums = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getAlbums',{userId}).fetchedAlbums
    Then match each fetchedAlbums[*].userId == userId
    And match each fetchedAlbums[*].title == '#string'

  Scenario: User Should Fetch the Albums with Invalid UserId
    Given def fetchedAlbums = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getAlbums',{invalidUserId}).fetchedAlbums
    Then match fetchedAlbums.arr == null