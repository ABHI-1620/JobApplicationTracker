Test Cases

1) Functional: Create job entry
- Steps: Login as user -> Go to 'Add Job' -> Fill company, role, date, status, notes -> Submit
- Expected: 201/redirect to list and new entry visible with correct values

2) Security: Stored XSS prevention
- Steps: Add a job with notes containing: <script>alert(1)</script>
- Expected: Notes displayed escaped in UI; no script execution in browser

3) Negative: Invalid date format
- Steps: Submit job with application_date = 'not-a-date'
- Expected: Validation error shown; 400/ form re-rendered with error
