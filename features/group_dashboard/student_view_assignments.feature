Feature: View assignments due
  As a student member of a group
  I want a common place where to see all my group's pending assignments and when they are due
  So that I can quickly know what we have to do

  Background: I am a logged in student in my group dashboard
    Given settings set
    
    And the following group exists:
    | id |  group_name |
    | 78 |  Monkees    |
    | 46 |  Bunnies    |

    And the following students exist:
    | id | name | group_id | cid |
    | 99 | Pepe | 78       | 123 |
    | 88 | John |          | 456 |
    | 77 | Joe  | 46       | 789 |

    And the following tasks exist:
    | id | title | due_date           | description |
    | 91 | It1-1 | 2011-10-1 00:00:00 | Blah        |
    | 92 | It1-2 | 2013-10-1 00:00:00 | Derp derp   |

    And the following assignments exist:
    | id | group_id | task_id | max_grade|
    | 89 | 78       | 91      | 20|
    | 53 | 78       | 92      | 10|

    And the following submissions exist:
    | label  | assignment_id | content | submitted_date       |
    | Essay  | 89            | Bleh    | 2011-10-1 00:00:00   |
    | Heroku | 53            | nil     | nil                  |

    And the following posts exist:
    | author_id  | published_at       | assignment_id    | content     |author_id|
    | 99         | 2011-10-1 00:00:00 | 89               | such content|99|
    | 43         | 2011-10-2 00:00:00 | 53               |  wow        |88|

    Given it is currently 2013-9-2 00:00:00
    Given I am logged in with cid "123"
    Given I am on the group dashboard page for cid "123"

  Scenario: I should see assignments in chronological order
    Then I should see "It1-1" before "It1-2"
    And I should see "Blah" within "#assignment-89"

  Scenario: I should see the date in the header of future assignments
    Then I should see "1/Oct/2013" within "#assignment-53"
    And I should not see "1/Oct/2011" within "#assignment-89"

  Scenario: Another student that is not a member should not see the content of the group
    And  I am logged in with cid "789"
    Given I am on the group dashboard page for group id "78"
    Then I should see "You are not allowed to check this group"

  Scenario: My reader should see the assignments with grading option
    Given the student with cid "456" is a reader for "78"
    And  I am logged in with cid "456"
    Given I am on the group dashboard page for group id "78"
    Then I should see "1/Oct/2013" within "#assignment-53"
    And I should see "Grade and Feedback"
  

