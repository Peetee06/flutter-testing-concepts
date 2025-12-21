# Create PR

Create a Pull Request with the current changes. Uses smart defaults unless the user specifies otherwise.

## Instructions

Follow these steps to create a Pull Request:

### 1. Stage changes

If the user specified files to commit, stage only those files. Otherwise, stage all changes:
```bash
git add -A
```

### 2. Verify staged changes exist

Run `git diff --staged --stat` to verify there are staged changes. If no changes are staged, inform the user and stop.

### 3. Analyze the changes

Run `git diff --staged` to understand what changes were made. Based on the changes, determine:
- **Type**: One of `feat`, `fix`, `refactor`, `test`, `ci`, `docs`, `chore`
- **Short description**: A concise summary of the changes (lowercase, no period)
- **Detailed description**: A brief explanation of what was changed and why

Use these guidelines for the type:
- `feat` - New feature or functionality
- `fix` - Bug fix
- `refactor` - Code refactoring without changing behavior
- `test` - Adding or updating tests (use `feat` if tests are part of a feature)
- `ci` - CI/CD changes, `.github` directory, config files like `.coderabbit.yaml`, `codecov.yml`
- `docs` - Documentation changes
- `chore` - Maintenance, dependency updates, SDK updates, cleanup

### 4. Check current branch and create new if needed

Run `git rev-parse --abbrev-ref HEAD | cat` to get the current branch name.

If on `main`:
- Create a new branch with the format `<type>/<short-kebab-case-description>`
- Run `git checkout -b <branch-name>`

### 5. Create the commit

Create the commit using conventional commit format:
```bash
git commit -m "<type>: <short description>"
```

### 6. Push the branch

Push the branch to origin:
```bash
git push -u origin HEAD
```

### 7. Create the Pull Request

Use the GitHub CLI to create a PR with a title matching the commit message.

For the PR body, follow the template in [.github/PULL_REQUEST_TEMPLATE.md](mdc:.github/PULL_REQUEST_TEMPLATE.md):
- Fill in the **Description** section following the guidelines below
- Mark the appropriate **Type of Change** checkbox with `[x]` based on the commit type

#### Description Guidelines

Write a high-level summary of **what** changed, not a list of files. The diff view already shows which files changed.

Good description:
- Bullet points describing logical changes or features
- Focus on the "what" and "why", not the "where"
- Group related changes together

Example:
```
- add user authentication flow
- implement login and registration screens
- add unit and widget tests for auth feature
```

Avoid:
- Listing individual files that were modified
- Repeating information visible in the diff
- Overly technical implementation details

Map the commit type to the PR type checkbox:
- `feat` → ✨ New feature
- `fix` → 🛠️ Bug fix
- `refactor` → 🧹 Code refactor
- `ci` → ✅ Build configuration change
- `docs` → 📝 Documentation
- `chore` → 🗑️ Chore
- `test` → ✨ New feature (if part of feature) or the most appropriate type

```bash
gh pr create --title "<type>: <short description>" --body "<body following PR template>"
```

### 8. Confirm completion

Provide the user with:
- The PR URL
- A summary of what was committed and pushed
