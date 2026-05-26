# Gmail Compose Email — QA Test Case Assignment

## Overview

This repository contains manual and BDD-style test cases for the **Gmail Compose Email** feature, prepared as part of a QA Engineer assignment for **Incubyte**.

---

## Feature Under Test

| Field        | Value                    |
|--------------|--------------------------|
| Application  | Gmail Web (mail.google.com) |
| Feature      | Compose & Send Email     |
| Subject Used | `Incubyte`               |
| Body Used    | `QA test for Incubyte`   |

---

## Repository Structure

```
gmail-qa-assignment/
│
├── README.md
│
├── test-cases/
│   ├── manual/
│   │   └── gmail_compose_manual_test_cases.md     # Traditional test cases (table format)
│   │
│   ├── bdd/
│   │   └── gmail_compose.feature                  # Gherkin BDD scenarios
│   │
│   └── edge-cases/
│       └── gmail_compose_edge_cases.md            # Boundary, security & edge scenarios
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

## How to Read This Repo

- **Manual Test Cases** → `test-cases/manual/` — Traditional QA table format with Test ID, steps, test data, and expected results. Suitable for Jira/TestRail import.
- **BDD Scenarios** → `test-cases/bdd/` — Gherkin `.feature` file compatible with Cucumber, Behave, or any BDD framework.
- **Edge Cases** → `test-cases/edge-cases/` — Boundary value analysis, security injection, session handling, and concurrency tests.

---

## Key Test Scenarios Covered

- ✅ Successful email send (all fields valid)
- ✅ Send with CC and BCC recipients
- ✅ Attachment upload and size limit
- ✅ Draft auto-save and manual save
- ✅ Keyboard shortcuts (Ctrl+Enter, Ctrl+D)
- ✅ Rich text formatting
- ❌ Missing recipient validation
- ❌ Invalid email format rejection
- ❌ Subject-less send confirmation dialog
- ❌ Attachment exceeding 25 MB
- ❌ XSS injection in Subject field
- ❌ SQL injection in Subject field
- ❌ Send while offline
- ⚠️ Duplicate send on rapid double-click
- ⚠️ Session timeout handling
- ⚠️ Multi-account compose isolation

---

## Author

**QA Engineer** | Senior QA | CRM/SaaS Domain  
Assignment submitted for: **Incubyte**
