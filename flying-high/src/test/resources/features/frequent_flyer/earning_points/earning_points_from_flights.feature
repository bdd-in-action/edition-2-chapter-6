@component:points
Feature: Earning Frequent Flyer points from flights

  In order to encourage travellers to book with Flying High Airlines more frequently
  As the Flying High sales manager
  I want travellers to earn Frequent Flyer points when they fly with us

  @ui
  Scenario: Travellers earn points based on the distance travelled
  Normal flights earn 1 point every 2 kilometers

    Given the flying distance between Sydney and Melbourne is 878 km
    And Stacy is a standard Frequent Flyer member
    When Stacy flies from Sydney to Melbourne
    Then she should earn 439 points

  @ui
  Scenario: Travellers extra points in Business class
    Given the flying distance between Sydney and Melbourne is 878 km
    And Stacy is a standard Frequent Flyer member
    When she flies from Sydney to Melbourne in Business class
    Then she should earn 878 points

  @important
  Scenario: Travellers also earn points when they fly on on partner airlines
    Given the flying distance between Sydney and Melbourne is 878 km
    And Stacey is a standard Frequent Flyer member
    When Stacy flies from Sydney to Melbourne on a Partner Airlines flight
    Then she should earn 878 points

  Scenario Outline: Earning extra points on flights by status
    Given Fred is a <status> Frequent Flyer member
    When Fred flies on a flight that is worth <base> base points
    Then he should earn a status bonus of <bonus>
    And he should have guaranteed minimum earned points per trip of <minimum>
    And he should earn <total> points
    Examples:
      | status   | base | bonus | minimum | total | notes          |
      | Standard | 439  | 0     | 0       | 439   |                |
      | Silver   | 148  | 74    | 500     | 500   | minimum points |
      | Silver   | 439  | 220   | 500     | 659   | 50% bonus      |
      | Gold     | 439  | 329   | 1000    | 1000  | minimum points |
      | Gold     | 2041 | 1531  | 1000    | 3572  | 75% bonus      |

