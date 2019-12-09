Feature: Can create blog posts

  @javascript
  Scenario: Jane goes to the site and creates a blog post               # features/feature_01_can_create_posts.feature:4
    Given the blog server is running                                    # features/step_definitions/demo.rb:81
    When "Jane" visits the main page                                    # features/step_definitions/demo.rb:1
    And follows "New Article"                                           # features/step_definitions/demo.rb:5
    Then she sees a "New Article" form                                  # features/step_definitions/demo.rb:9
    When she fills in the fields                                        # features/step_definitions/demo.rb:13
      | Title | My first blog post                           |
      | Text  | It was a dark and stormy night at Rails Camp |
    And she clicks "Create Article"                                     # features/step_definitions/demo.rb:19
    Then "she" sees success message "Article was successfully created." # features/step_definitions/demo.rb:23
    And "she" sees the article with the content                         # features/step_definitions/demo.rb:27
      | Title: | Title: My first blog post                          |
      | Text:  | Text: It was a dark and stormy night at Rails Camp |
    When she refreshes the page                                         # features/step_definitions/demo.rb:36
    Then "she" sees the article with the content                        # features/step_definitions/demo.rb:27
      | Title: | Title: My first blog post                          |
      | Text:  | Text: It was a dark and stormy night at Rails Camp |
    When "she" visits the main page                                     # features/step_definitions/demo.rb:1
    Then "she" sees the following articles                              # features/step_definitions/demo.rb:40
      | My first blog post | It was a dark and stormy night at Rails Camp |

Feature: Can comment on blog posts

  @javascript
  Scenario: John and James comment on Jane's blog post                  # features/feature_02_can_comment_on_posts.feature:4
    Given the blog server is running                                    # features/step_definitions/demo.rb:81
    When "Jane" creates an "Article"                                    # features/step_definitions/demo.rb:49
      | Title | My first blog post                           |
      | Text  | It was a dark and stormy night at Rails Camp |
    Then "she" sees success message "Article was successfully created." # features/step_definitions/demo.rb:23
    When "John" comments "Well done"                                    # features/step_definitions/demo.rb:58
      Unable to find field "Commenter" that is not disabled (Capybara::ElementNotFound)
      ./features/support/page_fragments/util.rb:5:in `block in form_fill'
      ./features/support/page_fragments/util.rb:4:in `each'
      ./features/support/page_fragments/util.rb:4:in `form_fill'
      ./features/step_definitions/demo.rb:59:in `"{string} comments {string}"'
      features/feature_02_can_comment_on_posts.feature:13:in `When "John" comments "Well done"'
    Then "he" sees success message "Comment was successfully created."  # features/step_definitions/demo.rb:23
    And "he" sees comment 1 with content                                # features/step_definitions/demo.rb:65
      | Comment:   | Comment: Well done |
      | Commenter: | Commenter: John    |
    When "James" comments "here here"                                   # features/step_definitions/demo.rb:58
    Then "he" sees success message "Comment was successfully created."  # features/step_definitions/demo.rb:23
    And "he" sees comment 1 with content                                # features/step_definitions/demo.rb:65
      | Comment:   | Comment: Well done |
      | Commenter: | Commenter: John    |
    And "he" sees comment 2 with content                                # features/step_definitions/demo.rb:65
      | Comment:   | Comment: here here |
      | Commenter: | Commenter: James   |

Failing Scenarios:
cucumber features/feature_02_can_comment_on_posts.feature:4 # Scenario: John and James comment on Jane's blog post

2 scenarios (1 failed, 1 passed)
22 steps (1 failed, 6 skipped, 15 passed)
0m5.461s
