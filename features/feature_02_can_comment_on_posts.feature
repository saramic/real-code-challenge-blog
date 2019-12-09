Feature: Can comment on blog posts

  @javascript
  Scenario: John and James comment on Jane's blog post
    Given the blog server is running

    When "Jane" creates an "Article"
      | Title  | My first blog post                           |
      | Text   | It was a dark and stormy night at Rails Camp |

    Then "she" sees success message "Article was successfully created."

    When "John" comments "Well done"

    Then "he" sees success message "Comment was successfully created."
    And "he" sees comment 1 with content
      | Comment:   | Comment: Well done |
      | Commenter: | Commenter: John    |

    When "James" comments "here here"

    Then "he" sees success message "Comment was successfully created."
    And "he" sees comment 1 with content
      | Comment:   | Comment: Well done |
      | Commenter: | Commenter: John    |
    And "he" sees comment 2 with content
      | Comment:   | Comment: here here |
      | Commenter: | Commenter: James   |
