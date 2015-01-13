Feature: Generate Letter

  Scenario: Non-existing letter
    Given a letter named "letter" does not exist
    When I successfully run `letter_generator generate`
    Then a letter named "letter" exist
