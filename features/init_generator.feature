Feature: Init generator

  Background:
    Given the default letter template

  Scenario: Non-existing files
    Given a data file named "data" does not exist
    When I successfully run `letter_generator init`
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
