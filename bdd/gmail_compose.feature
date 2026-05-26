Feature: Gmail Compose Email
  As a logged-in Gmail user
  I want to compose and send emails
  So that I can communicate with recipients using the Gmail web interface

  Background:
    Given the user is logged into a valid Gmail account
    And the user is on the Gmail inbox at "https://mail.google.com"
    And an active internet connection is available

  # ─────────────────────────────────────────────────────────────────────────────
  # POSITIVE SCENARIOS
  # ─────────────────────────────────────────────────────────────────────────────

  @positive @P1 @smoke
  Scenario: BDD_001 - Successfully compose and send an email with all fields filled
    Given the compose window is open
    When the user enters "qa.tester@example.com" in the "To" field
    And the user enters "Incubyte" in the "Subject" field
    And the user enters "QA test for Incubyte" in the email body
    And the user clicks the "Send" button
    Then the email should be sent successfully
    And a "Message sent" confirmation snackbar should appear
    And the sent email should be visible in the "Sent" folder
    And the compose window should close automatically

  @positive @P1 @smoke
  Scenario: BDD_002 - Compose window opens when clicking the Compose button
    When the user clicks the "+ Compose" button on the Gmail sidebar
    Then a compose window should open in the bottom-right corner of the screen
    And the "To", "Subject", and body fields should be visible
    And each field should be focusable and editable

  @positive @P2
  Scenario: BDD_003 - Recipient auto-suggest appears when typing in the To field
    Given the user has an existing contact with email "qa.tester@example.com"
    And the compose window is open
    When the user clicks the "To" field
    And the user types "qa."
    Then an auto-suggest dropdown should appear
    And the dropdown should show contacts matching the typed characters
    And selecting a suggestion should populate the "To" field with the full email address

  @positive @P2
  Scenario: BDD_004 - Email is sent to CC and BCC recipients correctly
    Given the compose window is open
    When the user enters "user1@example.com" in the "To" field
    And the user clicks the "Cc" option and enters "user2@example.com"
    And the user clicks the "Bcc" option and enters "user3@example.com"
    And the user enters "Incubyte" in the "Subject" field
    And the user enters "QA test for Incubyte" in the email body
    And the user clicks the "Send" button
    Then all three recipients should receive the email
    And the BCC recipient "user3@example.com" should NOT be visible to "To" or "Cc" recipients
    And a "Message sent" snackbar should be displayed

  @positive @P2
  Scenario: BDD_005 - Email with attachment under 25 MB is sent successfully
    Given the compose window is open
    And a file "test_doc.pdf" of size 500 KB is available on the local system
    When the user enters "qa.tester@example.com" in the "To" field
    And the user enters "Incubyte" in the "Subject" field
    And the user enters "QA test for Incubyte" in the email body
    And the user clicks the attachment icon
    And the user selects "test_doc.pdf" from the local file system
    Then a file upload progress indicator should appear
    And the attachment "test_doc.pdf" should be listed in the compose window
    When the user clicks the "Send" button
    Then the email should be sent with the attachment
    And the recipient should receive the email with "test_doc.pdf" attached

  @positive @P2
  Scenario: BDD_006 - Draft is auto-saved when compose window is left idle
    Given the compose window is open
    When the user enters "Incubyte" in the "Subject" field
    And the user enters "QA test for Incubyte" in the email body
    And the user does not interact with the compose window for 30 seconds
    Then a "Draft saved" indicator should appear in the compose window
    And the draft should be visible in the "Drafts" folder
    And the Drafts count in the Gmail sidebar should increment by 1

  @positive @P2
  Scenario: BDD_007 - Email is sent using the Ctrl+Enter keyboard shortcut
    Given the compose window is open
    And the "To" field contains "qa.tester@example.com"
    And the "Subject" field contains "Incubyte"
    And the email body contains "QA test for Incubyte"
    When the user presses "Ctrl+Enter" on Windows or "Cmd+Enter" on Mac
    Then the email should be sent immediately
    And a "Message sent" snackbar should appear
    And the email should appear in the "Sent" folder

  @positive @P3
  Scenario: BDD_008 - Minimising and restoring compose window preserves content
    Given the compose window is open
    And the "Subject" field contains "Incubyte"
    And the email body contains "QA test for Incubyte"
    When the user clicks the minimise icon on the compose window
    Then the compose window should collapse to a taskbar at the bottom of the screen
    When the user clicks the minimised compose bar
    Then the compose window should restore to its previous state
    And all previously entered content should be fully preserved

  # ─────────────────────────────────────────────────────────────────────────────
  # NEGATIVE SCENARIOS
  # ─────────────────────────────────────────────────────────────────────────────

  @negative @P1 @smoke
  Scenario: BDD_009 - Send is blocked when the To field is empty
    Given the compose window is open
    And the "To" field is left empty
    When the user enters "Incubyte" in the "Subject" field
    And the user enters "QA test for Incubyte" in the email body
    And the user clicks the "Send" button
    Then the send action should be blocked
    And an error message "Please specify at least one recipient" should be displayed
    And the compose window should remain open
    But no email should appear in the "Sent" folder

  @negative @P1 @smoke
  Scenario: BDD_010 - Invalid email format in To field is rejected on send
    Given the compose window is open
    When the user enters "notavalidemail" in the "To" field
    And the user presses Tab to confirm the recipient
    And the user enters "Incubyte" in the "Subject" field
    And the user enters "QA test for Incubyte" in the email body
    And the user clicks the "Send" button
    Then the recipient chip should be highlighted in red
    And an error message "The address 'notavalidemail' is not valid" should be displayed
    And the email should NOT be sent
    And the compose window should remain open with the invalid entry visible

  @negative @P2
  Scenario: BDD_011 - Confirmation dialog appears when sending email without a subject
    Given the compose window is open
    When the user enters "qa.tester@example.com" in the "To" field
    And the "Subject" field is left empty
    And the user enters "QA test for Incubyte" in the email body
    And the user clicks the "Send" button
    Then a dialog should appear with the message "Send this message without a subject?"
    And the dialog should contain a "Send" option and a "Cancel" option
    When the user clicks "Send" in the dialog
    Then the email should be dispatched to the recipient without a subject
    When the user clicks "Cancel" in the dialog
    Then the dialog should close and the compose window should remain open

  @negative @P2
  Scenario: BDD_012 - File exceeding 25 MB size limit is rejected on attachment
    Given the compose window is open
    And a file "large_video.mp4" of size 60 MB is available on the local system
    When the user clicks the attachment icon
    And the user selects "large_video.mp4" from the file system
    Then the file should NOT be attached to the email
    And an error message "Attachment size exceeds the allowable limit" should be displayed
    And Gmail may offer to send the file via Google Drive link as an alternative

  @negative @P1 @security
  Scenario: BDD_013 - XSS payload in Subject field is sanitised and not executed
    Given the compose window is open
    When the user enters "<script>alert('XSS')</script>Incubyte" in the "Subject" field
    And the user enters "qa.tester@example.com" in the "To" field
    And the user enters "QA test for Incubyte" in the email body
    And the user clicks the "Send" button
    Then the script should NOT execute in the sender's browser
    And the script should NOT execute in the recipient's email client
    And the subject should be rendered as literal plain text
    And no JavaScript alert dialog should appear at any point

  @negative @P1
  Scenario: BDD_014 - Email is queued when sent in offline mode
    Given the user has Gmail offline mode enabled in settings
    And the user's device is disconnected from the internet
    And the compose window is open
    When the user enters "qa.tester@example.com" in the "To" field
    And the user enters "Incubyte" in the "Subject" field
    And the user enters "QA test for Incubyte" in the email body
    And the user clicks the "Send" button
    Then an offline indicator should be visible in the Gmail interface
    And the email should be queued and NOT lost
    When the device reconnects to the internet
    Then the queued email should be sent automatically
    And the email should appear in the "Sent" folder after successful delivery

  @negative @P2
  Scenario: BDD_015 - Discarding a draft permanently removes the compose content
    Given the compose window is open
    And the "Subject" field contains "Incubyte"
    And the email body contains "QA test for Incubyte"
    When the user clicks the "Discard draft" trash icon
    Then a confirmation dialog should appear: "Discard draft?"
    When the user confirms the discard action
    Then the compose window should close
    And the draft should NOT appear in the "Drafts" folder
    And the Drafts count in the sidebar should NOT increase
