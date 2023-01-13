Feature: Add a Dish

    Scenario: I want to log in as restaurant and add dish
        Given I am on the TasteAdvisor home page
        When I press "Sign in"
        And I follow "restaurant_signin"
        And I should see "Oppure"
        And I fill in "Email" with "testcarlopizza@pizza.com"
        And I fill in "Password" with "123456"
        And I press "Log in"
        Then I should see "Sei acceduto con successo"
        Given I am on the restaurant profile page
        When I follow "Nuovo piatto"
        And I fill in "dish_name" with "Carbonara"
        And I fill in "dish_description" with "Pasta tipica romana"
        # And show me the page
        And I select "Primi" from "dish_category"
        And I fill in "dish_price" with "5.00"
        And I fill in "dish_ingredients" with "Spaghetti, Guanciale, Uova e Pecorino Romano"
        # Test foto piatto?
        Then I press "Conferma"
        And I should see "Il piatto è stato creato correttamente"
        # And show me the page
