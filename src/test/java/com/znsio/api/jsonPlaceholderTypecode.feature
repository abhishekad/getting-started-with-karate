@postAndComments @prod

  #TARGET_ENVIRONMENT=prod TAG=@albums TYPE=api ./gradlew test
Feature: Fetch posts and albums for a user

  Background:
    * def userId = 1

  Scenario: Fetch Posts from jsonplaceholder for user id 1
    Given def fetchedPosts = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getPosts',{userId}).fetchedPost
    * print "Fetched posts id: ", fetchedPosts.id
    * print "Fetched posts title: ",fetchedPosts.title
    Then match fetchedPosts.id == userId
    And match fetchedPosts.title == '#string'

    @albums
  Scenario: Fetch Albums from jsonplaceholder for user id 1
    Given def fetchedAlbums = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getAlbums',{userId}).fetchedAlbums
    * match each fetchedAlbums[*].userId == userId
    * print "Fetched Albums are for id: ",fetchedAlbums[*].userId

