# Manual Test Cases — Gmail Compose Email

**Feature:** Gmail Compose Email  
**Subject:** `Incubyte`  
**Body:** `QA test for Incubyte`  
**Total Cases:** 20 (10 Positive + 10 Negative)

---

## Pre-conditions (Common)

- User has a valid Gmail account
- User is logged in at [https://mail.google.com](https://mail.google.com)
- Browser: Chrome (latest), Firefox (latest)
- Internet connection is active unless stated otherwise

---

## Positive Test Cases

---

### TC_COMP_001 — Successful email composition and send

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_001 |
| **Priority**     | P1 |
| **Category**     | Positive |
| **Pre-conditions** | User is logged into a valid Gmail account. Internet connection is active. |
| **Test Steps**   | 1. Navigate to https://mail.google.com <br> 2. Click the `+ Compose` button <br> 3. Enter `qa.tester@example.com` in the **To** field <br> 4. Click the **Subject** field and enter `Incubyte` <br> 5. Click the body area and enter `QA test for Incubyte` <br> 6. Click the **Send** button |
| **Test Data**    | To: `qa.tester@example.com` \| Subject: `Incubyte` \| Body: `QA test for Incubyte` |
| **Expected Result** | Email is sent successfully. `Message sent` confirmation snackbar appears. Email is visible in the `Sent` folder. |

---

### TC_COMP_002 — Compose window opens on clicking '+ Compose'

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_002 |
| **Priority**     | P1 |
| **Category**     | Positive |
| **Pre-conditions** | User is logged into Gmail. |
| **Test Steps**   | 1. Navigate to https://mail.google.com <br> 2. Click the `+ Compose` button |
| **Test Data**    | N/A |
| **Expected Result** | Compose window (modal/overlay) opens in the bottom-right corner. Fields: To, Subject, and Body are visible and focusable. |

---

### TC_COMP_003 — Auto-suggest appears for recipient field

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_003 |
| **Priority**     | P2 |
| **Category**     | Positive |
| **Pre-conditions** | User has at least one contact in Google Contacts or has previously emailed the address. |
| **Test Steps**   | 1. Open Compose window <br> 2. Click the **To** field <br> 3. Type first 3 characters of a known contact email (e.g., `qa.`) |
| **Test Data**    | Input: `qa.` |
| **Expected Result** | Auto-suggest dropdown appears with matching contacts. Suggestions are filtered dynamically as user types. |

---

### TC_COMP_004 — Add multiple recipients (To, CC, BCC)

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_004 |
| **Priority**     | P2 |
| **Category**     | Positive |
| **Pre-conditions** | User is logged into Gmail. Compose window is open. |
| **Test Steps**   | 1. Open Compose window <br> 2. Enter `user1@example.com` in **To** field, press Enter <br> 3. Click **Cc** link → enter `user2@example.com` <br> 4. Click **Bcc** link → enter `user3@example.com` <br> 5. Enter Subject: `Incubyte` and Body: `QA test for Incubyte` <br> 6. Click **Send** |
| **Test Data**    | To: `user1@example.com` \| Cc: `user2@example.com` \| Bcc: `user3@example.com` \| Subject: `Incubyte` \| Body: `QA test for Incubyte` |
| **Expected Result** | All three recipients receive the email. BCC recipient is NOT visible to To/CC recipients. `Message sent` snackbar is displayed. |

---

### TC_COMP_005 — Compose email with file attachment

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_005 |
| **Priority**     | P2 |
| **Category**     | Positive |
| **Pre-conditions** | User is logged in. A file < 25 MB is available on the local system. |
| **Test Steps**   | 1. Open Compose window <br> 2. Fill To, Subject (`Incubyte`), Body (`QA test for Incubyte`) <br> 3. Click the **Attachment** icon (paperclip) <br> 4. Select `test_doc.pdf` (500 KB) <br> 5. Wait for upload progress to complete <br> 6. Click **Send** |
| **Test Data**    | Subject: `Incubyte` \| Body: `QA test for Incubyte` \| Attachment: `test_doc.pdf` (500 KB) |
| **Expected Result** | File uploads with a progress indicator. Attachment thumbnail/name appears in the compose window. Email is sent with the attachment. Recipient receives the email with the attached file intact. |

---

### TC_COMP_006 — Draft is auto-saved on inactivity

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_006 |
| **Priority**     | P2 |
| **Category**     | Positive |
| **Pre-conditions** | User is logged in. Compose window is open. |
| **Test Steps**   | 1. Open Compose window <br> 2. Enter Subject: `Incubyte` <br> 3. Enter partial body: `QA test for Incubyte` <br> 4. Stop interacting — wait 30 seconds |
| **Test Data**    | Subject: `Incubyte` \| Body: `QA test for Incubyte` |
| **Expected Result** | `Draft saved` indicator appears in the compose window. Email is visible in the `Drafts` folder with the typed content preserved. |

---

### TC_COMP_007 — Manual save to Drafts via keyboard shortcut

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_007 |
| **Priority**     | P3 |
| **Category**     | Positive |
| **Pre-conditions** | User is logged in. Compose window is open with content. |
| **Test Steps**   | 1. Open Compose window <br> 2. Enter Subject: `Incubyte` and Body: `QA test for Incubyte` <br> 3. Press `Ctrl+D` (Windows/Linux) or `Cmd+D` (Mac) |
| **Test Data**    | Subject: `Incubyte` \| Body: `QA test for Incubyte` |
| **Expected Result** | Compose window closes. Email is saved in `Drafts` folder. Draft count in the sidebar increments by 1. |

---

### TC_COMP_008 — Send email using Ctrl+Enter keyboard shortcut

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_008 |
| **Priority**     | P2 |
| **Category**     | Positive |
| **Pre-conditions** | User is logged in. Compose window is open with all required fields filled. |
| **Test Steps**   | 1. Open Compose window <br> 2. Enter To: `qa.tester@example.com`, Subject: `Incubyte`, Body: `QA test for Incubyte` <br> 3. Press `Ctrl+Enter` (Windows/Linux) or `Cmd+Enter` (Mac) |
| **Test Data**    | To: `qa.tester@example.com` \| Subject: `Incubyte` \| Body: `QA test for Incubyte` |
| **Expected Result** | Email is sent immediately. `Message sent` snackbar appears. Email appears in Sent folder. |

---

### TC_COMP_009 — Rich text formatting applied to email body

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_009 |
| **Priority**     | P3 |
| **Category**     | Positive |
| **Pre-conditions** | User is logged in. Compose window is open. |
| **Test Steps**   | 1. Open Compose window <br> 2. Enter body text: `QA test for Incubyte` <br> 3. Select the word `Incubyte` <br> 4. Apply **Bold**, *Italic*, and Underline from the formatting toolbar <br> 5. Fill To and Subject, then click Send |
| **Test Data**    | Body: `QA test for Incubyte` \| Formatting applied to: `Incubyte` |
| **Expected Result** | Selected text displays bold, italic, and underlined formatting inside the compose window. Recipient's email client renders the same formatting in the received email. |

---

### TC_COMP_010 — Compose window minimise and restore

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_010 |
| **Priority**     | P3 |
| **Category**     | Positive |
| **Pre-conditions** | User is logged in. Compose window is open with content typed. |
| **Test Steps**   | 1. Open Compose window <br> 2. Enter Subject: `Incubyte` and Body: `QA test for Incubyte` <br> 3. Click the minimise (`–`) icon <br> 4. Click the minimised compose bar at the bottom of the Gmail window |
| **Test Data**    | N/A |
| **Expected Result** | Compose window minimises to a taskbar at the bottom. Restoring it shows all previously entered content intact with no data loss. |

---

## Negative Test Cases

---

### TC_COMP_011 — Send email without recipient — validation error

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_011 |
| **Priority**     | P1 |
| **Category**     | Negative |
| **Pre-conditions** | User is logged in. Compose window is open. |
| **Test Steps**   | 1. Open Compose window <br> 2. Leave the **To** field empty <br> 3. Enter Subject: `Incubyte` <br> 4. Enter Body: `QA test for Incubyte` <br> 5. Click **Send** |
| **Test Data**    | To: *(empty)* \| Subject: `Incubyte` \| Body: `QA test for Incubyte` |
| **Expected Result** | Send is blocked. Error message displayed: `Please specify at least one recipient.` Compose window remains open. |

---

### TC_COMP_012 — Send email with invalid recipient email format

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_012 |
| **Priority**     | P1 |
| **Category**     | Negative |
| **Pre-conditions** | User is logged in. Compose window is open. |
| **Test Steps**   | 1. Open Compose window <br> 2. Enter `notavalidemail` in the **To** field <br> 3. Press **Tab** to confirm the entry <br> 4. Fill Subject: `Incubyte` and Body: `QA test for Incubyte` <br> 5. Click **Send** |
| **Test Data**    | To: `notavalidemail` \| Subject: `Incubyte` \| Body: `QA test for Incubyte` |
| **Expected Result** | Recipient chip is highlighted in red. Error shown: `The address 'notavalidemail' is not valid.` Email is NOT sent. Compose window remains open. |

---

### TC_COMP_013 — Send email to a non-existent domain address

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_013 |
| **Priority**     | P1 |
| **Category**     | Negative |
| **Pre-conditions** | User is logged in. Compose window is open. |
| **Test Steps**   | 1. Open Compose window <br> 2. Enter `user@thisdoesnotexist12345.xyz` in **To** <br> 3. Fill Subject: `Incubyte` and Body: `QA test for Incubyte` <br> 4. Click **Send** |
| **Test Data**    | To: `user@thisdoesnotexist12345.xyz` \| Subject: `Incubyte` \| Body: `QA test for Incubyte` |
| **Expected Result** | Email appears to send (client-side). A delivery failure bounce-back email arrives in Inbox with SMTP error: `Address not found` or `550 5.1.1 The email account does not exist.` |
| **Note**         | This is an **async** validation. The send action itself succeeds; failure is reported post-delivery by the mail server. |

---

### TC_COMP_014 — Send email with no subject — confirmation dialog

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_014 |
| **Priority**     | P2 |
| **Category**     | Negative |
| **Pre-conditions** | User is logged in. Compose window is open. |
| **Test Steps**   | 1. Open Compose window <br> 2. Enter valid recipient in **To**: `qa.tester@example.com` <br> 3. Leave **Subject** field empty <br> 4. Enter Body: `QA test for Incubyte` <br> 5. Click **Send** |
| **Test Data**    | To: `qa.tester@example.com` \| Subject: *(empty)* \| Body: `QA test for Incubyte` |
| **Expected Result** | A confirmation dialog appears: `Send this message without a subject?` User can click **Send** to proceed or **Cancel** to return and add a subject. |

---

### TC_COMP_015 — Attach file exceeding the 25 MB size limit

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_015 |
| **Priority**     | P2 |
| **Category**     | Negative |
| **Pre-conditions** | User is logged in. A file > 25 MB is available locally. |
| **Test Steps**   | 1. Open Compose window <br> 2. Click the **Attachment** icon (paperclip) <br> 3. Select `large_video.mp4` (60 MB) from local system |
| **Test Data**    | Attachment: `large_video.mp4` (60 MB) |
| **Expected Result** | Error displayed: `Attachment size exceeds the allowable limit.` File is NOT attached. Gmail may offer the option to send via Google Drive link instead. |

---

### TC_COMP_016 — Discard compose — data loss warning

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_016 |
| **Priority**     | P2 |
| **Category**     | Negative |
| **Pre-conditions** | User is logged in. Compose window has unsaved content. |
| **Test Steps**   | 1. Open Compose window <br> 2. Enter Subject: `Incubyte` and Body: `QA test for Incubyte` <br> 3. Click the **Discard draft** (trash) icon |
| **Test Data**    | Subject: `Incubyte` \| Body: `QA test for Incubyte` |
| **Expected Result** | A confirmation dialog appears: `Discard draft?` On confirming: compose window closes and draft is permanently deleted. Draft does NOT appear in Drafts folder. |

---

### TC_COMP_017 — Send email without body content

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_017 |
| **Priority**     | P3 |
| **Category**     | Negative |
| **Pre-conditions** | User is logged in. Compose window is open. |
| **Test Steps**   | 1. Open Compose window <br> 2. Enter valid recipient in **To** and Subject: `Incubyte` <br> 3. Leave the **body** area completely empty <br> 4. Click **Send** |
| **Test Data**    | To: `qa.tester@example.com` \| Subject: `Incubyte` \| Body: *(empty)* |
| **Expected Result** | Gmail does NOT block send for an empty body (expected Gmail behaviour — empty body is valid). Email is sent. Recipient receives the email with no body content. No error shown to sender. |
| **Note**         | Empty body is intentionally not blocked; this validates Gmail's design decision vs the tester's assumption. |

---

### TC_COMP_018 — XSS payload in Subject field is not executed

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_018 |
| **Priority**     | P1 |
| **Category**     | Negative |
| **Pre-conditions** | User is logged in. Compose window is open. |
| **Test Steps**   | 1. Open Compose window <br> 2. Enter `<script>alert('XSS')</script>Incubyte` in **Subject** <br> 3. Fill valid To and Body <br> 4. Click **Send** |
| **Test Data**    | Subject: `<script>alert('XSS')</script>Incubyte` \| Body: `QA test for Incubyte` |
| **Expected Result** | The script is NOT executed at any point (compose, send, or display). Subject is treated as literal plain text. No alert dialog appears in sender's or recipient's browser. |

---

### TC_COMP_019 — Compose window behaviour on browser back navigation

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_019 |
| **Priority**     | P2 |
| **Category**     | Negative |
| **Pre-conditions** | User is logged in. Compose window is open with content. |
| **Test Steps**   | 1. Open Compose window <br> 2. Enter Subject: `Incubyte` and Body: `QA test for Incubyte` <br> 3. Press the **browser Back** button |
| **Test Data**    | Subject: `Incubyte` \| Body: `QA test for Incubyte` |
| **Expected Result** | Content is auto-saved to Drafts before navigation occurs. Draft count in the sidebar reflects the saved draft. Content is NOT permanently lost. |

---

### TC_COMP_020 — Compose email while offline / no internet

| Field            | Details |
|------------------|---------|
| **Test ID**      | TC_COMP_020 |
| **Priority**     | P1 |
| **Category**     | Negative |
| **Pre-conditions** | User is logged in. Gmail offline mode is enabled. Network is disconnected before test begins. |
| **Test Steps**   | 1. Disconnect from the internet <br> 2. Open Compose window <br> 3. Enter To: `qa.tester@example.com`, Subject: `Incubyte`, Body: `QA test for Incubyte` <br> 4. Click **Send** |
| **Test Data**    | To: `qa.tester@example.com` \| Subject: `Incubyte` \| Body: `QA test for Incubyte` |
| **Expected Result** | Gmail displays an offline indicator. Email is queued in Outbox (if offline mode is active) and sends automatically when connection is restored. OR: A clear error message is shown prompting reconnection. No data is lost. |

---

*Last Updated: 2026-05-26*
