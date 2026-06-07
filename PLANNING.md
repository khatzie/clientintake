# Feature Planning Document: Client Intake
 
## 1. Feature Overview

### Client Intake
 
### Overview
Client Intake is a SwiftUI application that allows operations reviewers to browse, search, review, and manage incoming client inquiries submitted through various versions of an intake form.

The application loads submission data from a local JSON file, presents it in a searchable list, allows users to view submission details, and supports locally marking submissions as reviewed.

Because the dataset contains records from multiple form versions, the application includes normalization and validation logic to handle inconsistent, incomplete, and malformed data safely.
 
### User / customer perspective
Operations reviewers need a fast way to review incoming project inquiries without manually inspecting raw data.

The application helps users:

- View all submissions in one place
- Quickly find a submission using search
- Review complete submission details
- Track which submissions have already been reviewed
- Work with inconsistent data without confusion
 
### Developer perspective
The application will be implemented using SwiftUI and MVVM.

A normalization layer will convert raw JSON records into UI-friendly models. This separates messy input data from presentation logic and keeps views simple.

The architecture will consist of:
- Models
- Services
- ViewModels
- Views
- Local reviewed-state storage

This approach is appropriate for the 3–4 hour timebox because it keeps the solution maintainable while avoiding unnecessary complexity.
 
### QA perspective
Potential issues include:

- Invalid or missing fields
- Multiple date formats
- Duplicate identifiers
- Unexpected status values
- Search results not matching normalized data
- Reviewed state not updating correctly

Testing should focus on:

- Data decoding and normalization
- Search and filtering behavior
- Empty and error states
- Reviewed state persistence
- Rendering malformed records without crashes
 
---
 
## 2. User Stories

#### Browse Incomming Submission

As an operations reviewer, I want to browse incoming submissions so that I can understand incoming client requests.

Acceptance Criteria:
- All valid submissions are displayed in a list
- Each row shows key submission information
- Missing values are displayed gracefully
- The application does not crash when malformed records exist

#### Search Submission
As an operations reviewer, I want to search submissions so that I can quickly locate a specific inquiry.

Acceptance Criteria:
- Search updates results dynamically
- Search supports name matching
- Search supports email matching
- Empty search results display an appropriate empty state

#### View Complete Submission
As an operations reviewer, I want to view complete submission details so that I can evaluate the inquiry.

Acceptance Criteria:
- Selecting a row opens a detail screen
- Submission information is displayed clearly
- Missing information uses fallback values
- Long messages remain readable

#### Mark a Submission as Reviewed
As an operations reviewer, I want to mark a submission as reviewed so that I can track completed reviews.

Acceptance Criteria:
- A submission can be marked as reviewed
- Reviewed state updates immediately
- Reviewed state is reflected in the list view
- Reviewed state persists between app launches
 
---
 
## 3. Requirements Review
 
### Functional requirements
- Load submissions from JSON file
- Display submissions in a list
- Search submissions
- View submission details
- Mark submissions as reviewed
- Handle malformed records safely
- Display loading, empty, and error states
 
### Non-functional requirements
Usability
- Simple and intuitive navigation
- Readable list presentation

Performance
- Fast loading for local JSON data
- Responsive search experience

Accessibility
- Dynamic Type support
- Meaningful accessibility labels for important controls

Maintainability
- Clear MVVM separation
- Centralized normalization logic

Reliability
- No crashes caused by malformed data

Security
- No sensitive data persistence beyond reviewed-state tracking
 
### Requirements I would clarify or challenge
- Should duplicate submissions be merged or displayed separately?
- What business meaning does each status represent?
- Should reviewed state be device-specific or user-specific?
- How should invalid records be reported to operations users?
- Are submissions expected to be sorted by submission date?
 
---
 
## 4. Technical Plan
 
### Technology stack
- Xcode 16+
- Swift 6
- SwiftUI
- MVVM Architecture
- UserDefaults for reviewed-state persistence
- No third-party dependencies
 
### Data model / data handling
Two primary data models will be used:

1. RawSubmission
- Mirrors JSON structure
- Handles inconsistent types

2. Submission
- Normalized UI model
- Safe for presentation

Normalization steps transforms RawSubmission into Submission which includes:
- Status normalization
- Date parsing across multiple formats
- Whitespace trimming
- Email normalization
- Fallback values for missing fields
- Generated identifiers when IDs are invalid

Unknown or malformed values will be mapped to safe defaults rather than causing failures.

SubmissionStatus is a supporting enum used to normalize status values across multiple form versions.
 
### Architecture / components / modules
```
App
│
├── Models
│   ├── RawSubmission.swift
│   ├── Submission.swift
│   ├── SubmissionStatus.swift
│   └── ViewState.swift
│
├── Services
│   └── SubmissionLoader.swift
│
├── Resources
│   └── submissions.json
│
├── ViewModels
│   └── SubmissionListViewModel.swift
│
├── Views
│   ├── StateViews.swift
│   ├── SubmissionDetailView.swift
│   ├── SubmissionListView.swift
│   └── SubmissionRowView.swift
│
└── Persistence
    └── ReviewedStore.swift
```
 
### State management / flow
States:
- Loading
- Loaded
- Empty
- Error

Flow:
1. Load JSON
2. Decode records
3. Normalize records
4. Display list
5. Search/filter results
6. Open detail view
7. Mark reviewed
8. Persist reviewed state locally
 
### Implementation steps
1. Create models
2. Implement JSON decoding
3. Build normalization layer
4. Create reviewed-state storage
5. Build list screen
6. Implement search and filtering
7. Build detail screen
8. Add loading, empty, and error states
9. Add unit tests
10. Perform manual testing
11. Complete README and screenshots
 
---
 
## 5. Testing Plan
 
Manual tests are required. Automated tests are optional.
 
| Test Case | Steps | Expected Result | Tested? |
|---|---|---|---|
|  |  |  | Yes / No |
 
---
 
## 6. Timebox Plan
 
Briefly explain how you plan to spend the 3 to 4 hours.
 
---
 
## 7. Risks, Trade-offs, and Follow-up
 
List important risks, shortcuts, or trade-offs. Also answer:
- What did you intentionally skip?
- What would you improve with more time?
- What would you ask the client before building this for production?
- If you used AI tools, how did you use them and how did you validate output?
 
---
 
## 8. Iterations
 
| Change | Reason |
|---|---|
|  |  |
 
If there were no major changes, write: N/A, no major plan changes.

