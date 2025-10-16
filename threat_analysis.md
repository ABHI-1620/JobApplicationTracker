Threat Analysis (STRIDE)

System: Job Application Tracker (web app) - focus: data privacy & input sanitization

Threats (pick 2):
1) Tampering (T): An attacker modifies job application entries via unsafe API or direct DB access, altering statuses or notes.
2) Information Disclosure (I): Sensitive notes or PII leaked via stored XSS or improper access control.

STRIDE Table (brief):
- Spoofing: Weak authentication could allow attackers to impersonate users.
- Tampering: Unsafe update endpoints or lack of input validation enables tampering.
- Repudiation: Lack of audit logs could allow users to deny actions.
- Information Disclosure: Stored XSS, insecure backups, or logs leaking data.
- Denial of Service: Unbounded resource usage from large uploads.
- Elevation of Privilege: Improper permission checks allowing data access.

Attack Tree (Tampering with job update):
- Root: Tamper job update
  - Exploit: Send crafted POST/PUT with malicious payload
    - Cause: Lack of input validation
    - Cause: Missing CSRF protection
    - Cause: Insecure direct object references (no owner check)
  - Exploit: Compromise admin credentials
    - Cause: Weak password
    - Cause: No rate limiting

Notes: A mitigation plan includes input sanitization, enforcing CSRF, verifying object ownership, and logging.
