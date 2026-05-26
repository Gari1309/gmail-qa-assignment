# Edge Cases & Boundary Test Scenarios — Gmail Compose Email

**Feature:** Gmail Compose Email  
**Subject:** `Incubyte` | **Body:** `QA test for Incubyte`  
**Total Edge Cases:** 15

---

## Categories Covered

| Category           | Cases |
|--------------------|-------|
| Boundary Value     | EC_001–EC_004 |
| Special Characters | EC_005–EC_006 |
| Security Injection | EC_007–EC_008 |
| Functional         | EC_009–EC_010 |
| Concurrency        | EC_011 |
| Session Handling   | EC_012–EC_013 |
| Multi-Account      | EC_014–EC_015 |

---

## Boundary Value Analysis

---

### EC_001 — Subject at maximum character length

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_001 |
| **Priority**       | P2 |
| **Category**       | Boundary |
| **Input / Condition** | Subject: 998-character string (Gmail's maximum ~998 characters) |
| **Test Steps**     | 1. Open Compose window <br> 2. Paste a 998-character string into Subject field <br> 3. Fill To and Body <br> 4. Click Send |
| **Expected Behaviour** | Subject is accepted without truncation. Email is sent. Recipient sees the full subject line. |
| **Risk / Notes**   | Verify whether Gmail silently truncates beyond the limit or shows a character count warning. |

---

### EC_002 — Subject with exactly 1 character

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_002 |
| **Priority**       | P3 |
| **Category**       | Boundary |
| **Input / Condition** | Subject: `I` (single character) |
| **Test Steps**     | 1. Open Compose window <br> 2. Enter a single character `I` in Subject <br> 3. Fill To and Body <br> 4. Click Send |
| **Expected Behaviour** | Email is sent successfully. Single-character subject is displayed correctly in sender's Sent folder and recipient's inbox. |
| **Risk / Notes**   | Minimum valid input test — ensures no minimum length restriction exists. |

---

### EC_003 — Email body with 25,000+ characters

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_003 |
| **Priority**       | P2 |
| **Category**       | Boundary |
| **Input / Condition** | Body: 25,000-character plain text block |
| **Test Steps**     | 1. Open Compose window <br> 2. Paste a 25,000-character block into the body <br> 3. Fill To: `qa.tester@example.com` and Subject: `Incubyte` <br> 4. Click Send |
| **Expected Behaviour** | All content is preserved during send. Recipient receives the full body without any silent truncation. |
| **Risk / Notes**   | Gmail body limit is very large. Verify no truncation occurs and rendering is stable with a very large payload. |

---

### EC_004 — Recipient field with 100 email addresses

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_004 |
| **Priority**       | P2 |
| **Category**       | Boundary |
| **Input / Condition** | To: 100 valid, comma-separated unique email addresses |
| **Test Steps**     | 1. Open Compose window <br> 2. Paste 100 valid email addresses into the To field <br> 3. Enter Subject: `Incubyte` and Body: `QA test for Incubyte` <br> 4. Click Send |
| **Expected Behaviour** | All 100 recipients receive the email. OR: Gmail displays a warning if the recipient limit is exceeded. |
| **Risk / Notes**   | Gmail's per-send limit is 500 recipients (To + CC + BCC combined). Test verifies Gmail handles bulk recipients gracefully without silent dropping. |

---

## Special Character Handling

---

### EC_005 — Unicode and emoji characters in Subject

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_005 |
| **Priority**       | P2 |
| **Category**       | Special Characters |
| **Input / Condition** | Subject: `🚀 Incubyte QA — テスト 🎯` |
| **Test Steps**     | 1. Open Compose window <br> 2. Enter Subject with emoji and Unicode characters <br> 3. Fill To and Body <br> 4. Click Send |
| **Expected Behaviour** | Emoji and Unicode characters are preserved throughout. Recipient's email client renders them correctly. No encoding artifacts (e.g., `?????`) appear. |
| **Risk / Notes**   | UTF-8 character encoding compliance check. Some older email clients may not render emoji. |

---

### EC_006 — Unicode and emoji characters in Body

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_006 |
| **Priority**       | P2 |
| **Category**       | Special Characters |
| **Input / Condition** | Body: `QA test for Incubyte ✅ — テスト完了 🎉` |
| **Test Steps**     | 1. Open Compose window <br> 2. Enter Subject: `Incubyte` <br> 3. Enter body with Unicode and emoji characters <br> 4. Fill To and click Send |
| **Expected Behaviour** | All Unicode and emoji characters are preserved in the sent email body. No corruption or garbling in recipient's inbox. |
| **Risk / Notes**   | Validates UTF-8 compliance in the email body content. |

---

## Security Injection Testing

---

### EC_007 — SQL injection string in Subject field

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_007 |
| **Priority**       | P1 |
| **Category**       | Security |
| **Input / Condition** | Subject: `'; DROP TABLE users; --Incubyte` |
| **Test Steps**     | 1. Open Compose window <br> 2. Enter SQL injection payload in Subject field <br> 3. Fill valid To and Body <br> 4. Click Send |
| **Expected Behaviour** | The string is treated as plain text. No database error, application crash, or system instability occurs. Email is sent and received with the literal subject text. |
| **Risk / Notes**   | Input sanitisation validation. Should be a no-op since Gmail processes email subjects as strings, not SQL, but must be verified. |

---

### EC_008 — HTML tags in body (plain text mode)

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_008 |
| **Priority**       | P1 |
| **Category**       | Security / Rendering |
| **Input / Condition** | Body: `<b>QA test for Incubyte</b><img src=x onerror=alert(1)>` |
| **Test Steps**     | 1. Open Compose window in plain text mode <br> 2. Enter HTML/injection payload in body <br> 3. Fill valid To and Subject <br> 4. Click Send |
| **Expected Behaviour** | HTML tags are rendered as plain text (escaped) OR handled safely. No script execution or broken rendering occurs. The `onerror` handler does NOT fire. No alert dialog appears. |
| **Risk / Notes**   | Content injection and HTML injection risk. Validates that plain text mode does not interpret arbitrary HTML. |

---

## Functional Edge Cases

---

### EC_009 — Paste content from external clipboard (rich text)

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_009 |
| **Priority**       | P3 |
| **Category**       | Functional |
| **Input / Condition** | Copy formatted text from a Word document, then paste into Gmail body |
| **Test Steps**     | 1. Open Microsoft Word or Google Docs <br> 2. Copy rich text with bold, tables, or bullets <br> 3. Open Gmail Compose window <br> 4. Paste (Ctrl+V) into the body <br> 5. Observe rendering and click Send |
| **Expected Behaviour** | Content is pasted. Formatting may be retained or stripped depending on Gmail's paste handling settings. No application crash or data corruption occurs. |
| **Risk / Notes**   | Cross-application clipboard compatibility. Gmail may strip certain formatting on paste. |

---

### EC_010 — Compose email with a zero-byte attachment

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_010 |
| **Priority**       | P3 |
| **Category**       | Boundary |
| **Input / Condition** | Attachment: `empty_file.txt` (0 bytes) |
| **Test Steps**     | 1. Open Compose window <br> 2. Fill To, Subject: `Incubyte`, Body: `QA test for Incubyte` <br> 3. Click attachment icon and select `empty_file.txt` (0 bytes) <br> 4. Click Send |
| **Expected Behaviour** | File attaches successfully (shown as 0 KB). Email is sent without error. Recipient receives the email with the zero-byte file accessible. |
| **Risk / Notes**   | Lower boundary of file size range. Ensures no minimum file size restriction exists. |

---

## Concurrency Testing

---

### EC_011 — Rapid double-click on Send button

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_011 |
| **Priority**       | P1 |
| **Category**       | Concurrency |
| **Input / Condition** | User double-clicks the Send button very quickly |
| **Test Steps**     | 1. Open Compose window <br> 2. Fill To: `qa.tester@example.com`, Subject: `Incubyte`, Body: `QA test for Incubyte` <br> 3. Double-click the **Send** button as fast as possible |
| **Expected Behaviour** | Email is sent exactly **once**. No duplicate emails arrive in the recipient's inbox. The Send button is disabled after the first click to prevent duplicate requests. |
| **Risk / Notes**   | Idempotency of the send action. Duplicate emails are a serious UX/data integrity issue. This is a common interview-highlighted test. |

---

## Session Handling

---

### EC_012 — Compose window behaviour during session timeout

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_012 |
| **Priority**       | P2 |
| **Category**       | Session |
| **Input / Condition** | Compose window is left open for longer than the Gmail session idle timeout period (60+ minutes) |
| **Test Steps**     | 1. Open Compose window <br> 2. Enter Subject: `Incubyte` and Body: `QA test for Incubyte` <br> 3. Leave the browser idle for 60+ minutes <br> 4. Attempt to click Send |
| **Expected Behaviour** | Gmail prompts re-authentication. Compose content is preserved in Drafts and NOT lost after session expiry. User can re-authenticate and continue composing. |
| **Risk / Notes**   | High data loss risk if session expiry clears unsaved compose state. |

---

### EC_013 — All-whitespace Subject field treated as empty

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_013 |
| **Priority**       | P2 |
| **Category**       | Edge |
| **Input / Condition** | Subject: `          ` (spaces only — no visible characters) |
| **Test Steps**     | 1. Open Compose window <br> 2. Enter only spaces in the Subject field (no other characters) <br> 3. Fill valid To and Body <br> 4. Click Send |
| **Expected Behaviour** | Gmail should treat the whitespace-only Subject as empty. The confirmation dialog `Send this message without a subject?` should appear — same behaviour as a completely empty Subject field. |
| **Risk / Notes**   | Whitespace-only input should be functionally equivalent to empty. Validates input trimming behaviour. |

---

## Multi-Account Testing

---

### EC_014 — Email sent to self (sender = recipient)

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_014 |
| **Priority**       | P3 |
| **Category**       | Functional |
| **Input / Condition** | To: same email address as the logged-in Gmail account |
| **Test Steps**     | 1. Open Compose window <br> 2. Enter the logged-in user's own email in **To** <br> 3. Enter Subject: `Incubyte` and Body: `QA test for Incubyte` <br> 4. Click Send |
| **Expected Behaviour** | Email is sent. The same email appears in both the **Sent** folder and the **Inbox** of the same account. No looping, bouncing, or error occurs. |
| **Risk / Notes**   | Common edge case in self-notification or testing flows. |

---

### EC_015 — Compose after switching between Gmail accounts

| Field              | Details |
|--------------------|---------|
| **Edge Case ID**   | EC_015 |
| **Priority**       | P1 |
| **Category**       | Multi-Account |
| **Input / Condition** | Two Gmail accounts (Account A and Account B) are added. User switches from A to B, then composes. |
| **Test Steps**     | 1. Log into Gmail with Account A <br> 2. Switch to Account B using the account switcher <br> 3. Open Compose window in Account B <br> 4. Fill To: `qa.tester@example.com`, Subject: `Incubyte`, Body: `QA test for Incubyte` <br> 5. Click Send |
| **Expected Behaviour** | The email is sent from **Account B's** address. Recipient sees Account B as the sender. No data or drafts from Account A are visible or leaked into Account B's compose session. |
| **Risk / Notes**   | Multi-account session isolation is critical. Cross-account data leakage is a P1 privacy defect. |

---

*Last Updated: 2026-05-26*
