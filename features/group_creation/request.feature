Feature: Request to join an existing group
  As a student
  I want to request to join an existing group
  So that I can form a project group

  Background: I am on the Search for Students page
    Given settings set
    And the following users exist:
    |name  | about| group_id|cid  | about| interest|
    |Megumi|  about|        |11111| about| interest|
    |Kevin |  about| 2      |22222| about| interest|
    |Alfonso| about| 1      |33333| about| interest|
    |Kayvan|  about| 2      |44444| about| interest|

    And the following groups exist:
    |group_name     |
    |Alfonso's group|
    |Kevin's group  |

  Scenario: Send an invitation to someone who is not in a group
    Given I am logged in as a 33333
    Given I am on the Search for Students Page
    Given I click on "Megumi" in the list of students
    Then I should be on the View Profile Page for "Megumi"
    Then I press "Invite to group"
    And I should see "Invitation Sent to Megumi"

  Scenario: Send a join request to someone who is in an existing group
    Given I am logged in as a 11111
    Given I am on the Search for Students Page
    And I click on "Kevin" in the list of students
    Then I press "Request to join"
    And I should see "Request Sent to Kevin"

  Scenario: Send a merge request to someone who is in an existing group
    Given I am logged in as a 33333
    Given I am on the Search for Students Page
    And I click on "Kevin" in the list of students
    Then I press "Request to merge"
    And I should see "Merge request Sent to Kevin"

  Scenario: Try to send a request to groupmate
    Given I am logged in as a 44444
    Given I am on the Search for Students Page
    And I click on "Kevin" in the list of students
    And I should see "Already a groupmate"

  Scenario: Pending request
    Given I am logged in as a 11111
    Given I am on the Search for Students Page
    And I click on "Kevin" in the list of students
    Given I am on the Search for Students Page
    And I click on "Kevin" in the list of students
    And I should see "Request pending"

  Scenario: Group is full

    Given the following users exist:
    |name  | about| group_id|cid  | about| interest|
    |Arturo|  about| 2      |99999| about| interest|

    Given I am logged in as a 11111
    Given I am on the Search for Students Page
    And I click on "Kevin" in the list of students
    And I should see "Group is full"

