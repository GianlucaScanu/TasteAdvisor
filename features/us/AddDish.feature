Feature: Add a Dish

<<<<<<< HEAD
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
=======
    Scenario: I want to log in as restaurant
        Given I am on the TasteAdvisor home page
        When I press "Sign in"
        And I follow "restaurat_signin"
        Then I should see "Oppure"
        When I fill in "Email" with "testcarlopizza@pizza.com"
        When I fill in "Password" with "123456"
        When I press "Log in"
        Then I should see "Sei acceduto con successo"
        Given I am on the restaurant profile page
        When I follow "Nuovo piatto"
        And I fill in "name_dish" with "Carbonara"
        And I fill in "description_dish" with "Pasta tipica romana"
        # And I select "1" from "category_dish"
        And I fill in "price_dish" with "5.00"
        And I fill in "ingredients_dish" with "Spaghetti, Guanciale, Uova e Pecorino Romano"
        Then I press "Conferma"
        And I should see "Il piatto è stato creato correttamente"
        # Then show me the page
>>>>>>> a104c22ae8317f0d4aa17a5078dcf289cdb44edc
