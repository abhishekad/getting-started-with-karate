@postAndComments @prod

  #TARGET_ENVIRONMENT=prod TAG=@albums TYPE=api ./gradlew test
Feature: Fetch posts and albums for a user

  Background:
    * def userId = 1
    * def userData = read('classpath:com/znsio/user_data.json')

  Scenario: Fetch Posts from jsonplaceholder for user id 1
    Given def fetchedPosts = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getPosts',{userId}).fetchedPost
    * print "Fetched posts id: ", fetchedPosts.id
    * print "Fetched posts title: ",fetchedPosts.title
    Then match fetchedPosts.id == userId
    And match fetchedPosts == userData.expectedPostsResponse

    @albums
  Scenario: Fetch Albums from jsonplaceholder for user id 1
    Given def fetchedAlbums = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getAlbums',{userId}).fetchedAlbums
    Then match each fetchedAlbums[*].userId == userId
    And match fetchedAlbums[0] == userData.expectedAlbumResponse


