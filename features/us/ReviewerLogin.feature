Feature: Login as Reviewer

    Scenario: I want login as a reviewer
    Given I am on the TasteAdvisor home page
    When I press "Sign in"

    # Presenti due link come recensore in application.html.erb,
    # resi distinti attraverso underscore finale per bottone "Sign up", RIVEDERE

    And I follow "Recensore"
    When I fill in "Email" with "testgl@testgl"
    And I fill in "Password" with "testgl"
    And I press "Log in"
    Then I am on the TasteAdvisor home page