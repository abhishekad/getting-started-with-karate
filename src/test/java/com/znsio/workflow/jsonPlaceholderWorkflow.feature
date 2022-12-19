@typecodeWorkflow @prod
  Feature: Create and update user posts
    #TARGET_ENVIRONMENT=prod TAG=@typecodeWorkflow TYPE=workflow ./gradlew test

    Background:
      * def userId = generateRandomNumber(3)
      * def title = generateAlphaNumericRandomString(15)
      * def body = generateAlphaNumericRandomString(50)
      * def newTitle = generateAlphaNumericRandomString(14)
      * def newBody = generateAlphaNumericRandomString(51)

    @createUpdatePost
    Scenario: Create a User post and then Update its title
      Given def createPost = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_createPost', {"userId": userId, "title": title, "body": body}).response
      Then karate.log('response : ' + createPost)
      * match createPost.userId == userId
      * match createPost.title == title
      * match createPost.body == body
      Given def fetchedPosts = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getPosts',{'userId': userId, expectedStatus: 200}).fetchedPost
      And match fetchPosts.userId == userId
      And match fetchPosts.title == title
      And match fetchPosts.body == body
      Given def updatePost = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_updatePost', {"userId": userId, "title": newTitle, "body": newBody}).response
      And karate.log('response : ' + updatePost)
      * match updatePost.title == newTitle
      * match updatePost.body == newBody
      * match updatePost.userId == userId
      Given def fetchedPosts = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getPosts',{'userId': userId, expectedStatus: 200}).fetchedPost
      And match fetchPosts.userId == userId
      And match fetchPosts.title == newTitle
      And match fetchPosts.body = newBody
