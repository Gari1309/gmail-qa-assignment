# Gmail Compose Email — QA Test Case Assignment

## Overview

This repository contains manual and BDD-style test cases for the **Gmail Compose Email** feature

## Feature Under Test

| Field        | Value                    |
|--------------|--------------------------|
| Application  | Gmail Web (mail.google.com) |
| Feature      | Compose & Send Email     |
| Subject Used | `Incubyte`               |
| Body Used    | `QA test for Incubyte`   |

```

---

## Test Case Summary

| Type                     | Count |
|--------------------------|-------|
| Manual / Traditional TCs | 20    |
| BDD Scenarios            | 12    |
| Edge / Boundary Cases    | 15    |
| **Total**                | **47**|

### By Category

| Category              | Count |
|-----------------------|-------|
| Positive / Happy Path | 10    |
| Negative / Error      | 10    |
| Edge & Boundary       | 8     |
| Security (XSS, SQLi)  | 3     |
| Session / Multi-acct  | 2     |
| BDD (overlapping)     | 12    |

### By Priority

| Priority     | Count | Meaning                              |
|--------------|-------|--------------------------------------|
| P1 – Critical| 9     | Blocks release if failed             |
| P2 – High    | 15    | Must pass before sign-off            |
| P3 – Medium  | 10    | Important, non-blocking              |
| P4 – Low     | 0     | Deferred if time-constrained         |

---

## Key Test Scenarios Covered

- ✅ Successful email send (all fields valid)
- ✅ Send with CC and BCC recipients
- ✅ Attachment upload and size limit
- ✅ Draft auto-save and manual save
- ❌ Missing recipient validation
- ❌ Invalid email format rejection
- ❌ Subject-less send confirmation dialog
- ❌ Attachment exceeding 25 MB
- ❌ Send while offline
- ⚠️ Duplicate send on rapid double-click
- ⚠️ Session timeout handling
- ⚠️ Multi-account compose isolation

---

## Author

**QA Engineer** | Senior QA | CRM/SaaS Domain  
Assignment submitted for: **Incubyte**
