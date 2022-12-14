@jsonPlaceholderTypecode @prod

  #TARGET_ENVIRONMENT=prod TAG=@jsonPlaceholderTypecode TYPE=api ./gradlew test
Feature: jsonPlaceholderTypecode.com

  @posts
  Scenario: Fetch Posts from jsonplaceholder for user id 1
    Given def fetchedPosts = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getPosts',{userId:1}).fetchedPost
    * print fetchedPosts.id
    * print fetchedPosts.title
    Then match fetchedPosts.id == '#number'
    And match fetchedPosts.title == '#string'