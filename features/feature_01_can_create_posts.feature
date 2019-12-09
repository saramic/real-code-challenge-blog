Feature: Can create blog posts

  @javascript
  Scenario: Jane goes to the site and creates a blog post
    Given the blog server is running

    When "Jane" visits the main page
    And follows "New Article"

    Then she sees a "New Article" form

    When she fills in the fields
      | Title  | My first blog post                           |
      | Text   | It was a dark and stormy night at Rails Camp |
    And she clicks "Create Article"

    Then "she" sees success message "Article was successfully created."
    And "she" sees the article with the content
      | Title:  | Title: My first blog post                          |
      | Text:   | Text: It was a dark and stormy night at Rails Camp |
    
    When she refreshes the page

    Then "she" sees the article with the content
      | Title:  | Title: My first blog post                          |
      | Text:   | Text: It was a dark and stormy night at Rails Camp |

    When "she" visits the main page

    Then "she" sees the following articles
      | My first blog post | It was a dark and stormy night at Rails Camp |
