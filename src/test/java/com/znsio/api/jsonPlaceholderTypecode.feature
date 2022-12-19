@postAndAlbums @prod
#TARGET_ENVIRONMENT=prod TAG=@postAndAlbums TYPE=api ./gradlew test

Feature: Fetch posts and albums for a user

  Scenario Outline: Fetch Posts from jsonplaceholder for different user ids
    Given def fetchedPosts = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getPosts',{'userId': <userId>, expectedStatus: <expectedStatus>}).fetchedPost
    * print "Fetched posts id: ", fetchedPosts.id
    * print "Fetched posts title: ",fetchedPosts.title
    Then match each fetchedPosts[*].id == <userId>
    Examples:
    | userId | expectedStatus|
    | 1    |  200             |
    | -1   |  404             |
    | ' '  |  404             |
    |'qwer'|  404             |
    | '#*' |  404             |
    | null |  404             |

  Scenario Outline: Fetch Albums from jsonplaceholder for different user ids
    Given def fetchedAlbums = karate.call('classpath:com/znsio/templates/jsonPlaceholderTemplates.feature@t_getAlbums',{userId : <userId>, expectedStatus: <expectedStatus>}).fetchedAlbums
    * print "Fetched Albums id: ", fetchedAlbums.id
    Then match each fetchedAlbums[*].userId == <userId>
    Examples:
      | userId | expectedStatus|
      | 1    |  200             |
      | -1   |  404             |
      | ' '  |  404             |
      |'qwer'|  404             |
      | '#*' |  404             |
      | null |  404             |
