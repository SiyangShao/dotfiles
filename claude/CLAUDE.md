# Planning
- Tasks involving >3 files or irreversible changes: discuss plan first, save it, then execute after confirmation
# Execution Policy
- >10 lines of code: write to a file and execute, never inline (no heredoc, no `python3 -c`, no pipe to interpreter)
# Code Review
When I leave review comments in code, I use this format:
```
    // CR: <my comment>
```
When you address a CR:
- If you agree and applied the change, mark it resolved: `// XCR: <original comment>`
- Do NOT modify or delete my original text.
- If you want to discuss, disagree, or explain a deviation, add a reply on the next line:
```
    // XCR: <original comment>
    // claude: <your response>
```
After you mark a CR as XCR:
- If I have follow-up, I will revert XCR back to CR and append my new comment below.
- If I leave the XCR untouched, it means I accept your resolution/reply — treat it as closed.

