Feature: Generate Letter

  Background:
    Given the default letter template exist in working directory
    And the data file "data" with:
    """
    from:
      name: Max Mustermann
      street: Musterstrasse 1
      city: Musterstadt
    to:
      name: Hans im Glück
      street: Gluecksstrasse 1
      city: Glueckstadt
    subject: Subject
    """

  Scenario: Non-existing letter
    Given a letter named "letter" does not exist
    When I successfully run `letter_generator generate`
    Then a letter named "letter" should exist

  Scenario: Template in current working directory
    Given a letter named "letter" does not exist
    And a local letter template named "letter" with:
    """
    Hello world
    """
    When I successfully run `letter_generator generate`
    Then the letter "letter" should contain:
    """
    Hello world
    """
