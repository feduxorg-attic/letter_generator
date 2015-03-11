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
    Then a letter named "letter-hans-im-gluck" should exist

  Scenario: Template in current working directory
    Given a letter named "letter" does not exist
    And a local letter template named "letter" with:
    """
    Hello world
    """
    When I successfully run `letter_generator generate`
    Then the letter "letter-hans-im-gluck" should contain:
    """
    Hello world
    """

  Scenario: Multiple addressees
    Given a letter named "letter" does not exist
    And the data file "data" with:
    """
    from:
      name: Max Mustermann
      street: Musterstrasse 1
      city: Musterstadt
    to:
      - name: Hans im Glück
        street: Gluecksstrasse 1
        city: Glueckstadt
      - name: Maxi Mustermann
        street: Gluecksstrasse 2
        city: Glueckstadt
    subject: Subject
    """
    And a local letter template named "letter" with:
    """
    <%= to.name %>
    """
    When I successfully run `letter_generator generate`
    Then the letter "letter-hans-im-gluck" should contain:
    """
    Hans im Glück
    """
    And the letter "letter-maxi-mustermann" should contain:
    """
    Maxi Mustermann
    """
