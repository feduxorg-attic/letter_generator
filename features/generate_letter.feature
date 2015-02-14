Feature: Generate Letter

  Background:
    Given the default letter template

  Scenario: Non-existing letter
    Given a letter named "letter" does not exist
    When I successfully run `letter_generator generate`
    Then a letter named "letter" should exist
