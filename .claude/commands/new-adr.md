---
description: Create a new Architecture Decision Record (e.g., /new-adr "Use Zellij for terminal multiplexing")
---

You are creating a new Architecture Decision Record (ADR).

1. First, find the next ADR number by listing existing ADRs in `docs/adr/`:
   - Look for files like `0001-*.md`, `0002-*.md`, etc.
   - Determine the next number in sequence

2. Get the ADR title from the user's message. If not provided, ask for it.

3. Create a new ADR file using the template at `docs/adr/template.md`:
   - Filename: `docs/adr/NNNN-title-in-kebab-case.md`
   - Fill in the number, title, and today's date
   - Set status to "Accepted"
   - Leave the Context, Decision, and Consequences sections for the user to fill

4. After creating the file, let the user know the ADR has been created and where to find it.

5. Offer to help fill in the ADR sections based on their knowledge or requirements.
