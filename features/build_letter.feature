Feature: Generate pdf Letter

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

  Scenario: Non-existing pdf
    When I successfully run `letter_generator build`
    Then a file named "build/letter-hans-im-gluck.pdf" should exist
