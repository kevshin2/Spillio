Feature: View assignments due
  As a student member of a group
  I want a common place where to see all my group's pending assignments and when they are due
  So that I can quickly know what we have to do

  Background: I am a logged in student in my group dashboard
    Given settings set
    Given the following instructor exists:
    | id | name    |
    | 43 | Robocop |

    And the following group exists:
    | id | instructor_id |
    | 78 | 43            |

    And the following students exist:
    | id | name | group_id |
    | 99 | Pepe | 78       |
    | 88 | John | 78       |

    And the following tasks exist:
    | id | title | due_date           | description |
    | 91 | It1-1 | 2011-10-1 00:00:00 | Blah        |
    | 92 | It1-2 | 2013-10-1 00:00:00 | Derp derp   |

    And the following assignments exist:
    | id | group_id | task_id |
    | 89 | 78       | 91      |
    | 53 | 78       | 92      |

    And the following score exists:
    | id | max_score | score | assignment_id |
    | 21 | 20        | 10    | 89            |
    | 22 | 30        | nil   | 53            |

    And the following submissions exist:
    | label  | assignment_id | content | submitted_date       |
    | Essay  | 89            | Bleh    | 2011-10-1 00:00:00   |
    | Heroku | 53            | nil     | nil                  |

    And the following posts exist:
    | author_id  | published_at       | assignment_id    | content |
    | 99         | 2011-10-1 00:00:00 | 89              | such content    |
    | 43         | 2011-10-2 00:00:00 | 53            |  wow  |

    Given I am logged into the student group dashboard

  Scenario: I should be able to input questions
    Given I fill in the input box with "when are you free to meet"
    Then I press submit
    And I should be on the group dashboard page
    And I should see "when are you free to meet" within "#it-2 .content"

  Scenario: I should see the instructor's response in group dashboard
    Then I should see "Robocop" within "#it-2 .content"
    Then I should see "great" within "#it-2 .content"
