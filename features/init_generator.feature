Feature: Init generator

  #Background:
  #  Given the default letter template

  Scenario: Init local directory
    Given a data file named "data" does not exist
    When I successfully run `letter_generator init`
    Then the local letter template "letter" should exist
    Then the data file "data" should contain:
    """
    from:
      name:
      street:
      city:
    to:
      name:
      street:
      city:
    subject:
    """

  Scenario: Init user directory
    Given a data file named "data" does not exist
    When I successfully run `letter_generator init --for user`
    Then the user letter template "letter" should exist

  Scenario: Init working directory (default)
    Given a data file named "data" does not exist
    When I successfully run `letter_generator init --for working-directory`
    Then the local letter template "letter" should exist

  Scenario: Init working directory (explicit)
    Given a data file named "data" does not exist
    When I successfully run `letter_generator init --for working-directory`
    Then the local letter template "letter" should exist
