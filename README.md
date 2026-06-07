# Client Intake

A SwiftUI application for reviewing and managing client inquiry submissions loaded from a local JSON data source.

## Setup and Run Instructions

#### Requirements
- Xcode 26.2
- iOS 26.2 Simulator or Device

#### Running the Project
1. Clone or extract the project repository.
2. Open ClientIntake.xcodeproj in Xcode.
3. Select an iOS Simulator or connected device.
4. Build and run using: ⌘ + R or click the play icon

No additional configuration is required.

## Environment
#### Built With
- Xcode 26.2
- Swift 5
- SwiftUI

#### Deployment Target
- iOS 26.2

## Features
#### Core Features
- Load submissions from bundled JSON
- Display submissions in a searchable list
- Search by:
  - Name
  - Email address
  - Service
  - Status
- View detailed submission information
- Mark submissions as reviewed
- Persist reviewed state locally using UserDefaults
- Loading, Empty, and Error states
- Graceful handling of malformed data

## Testing

#### Included:

- SubmissionStatus normalization tests

Examples covered:

- OPEN → Open
- Open → Open
- in_review → In Review
- Invalid status → Unknown

## Assumptions

The following assumptions were made during implementation:

- Reviewed state is device-specific and stored locally using UserDefaults.
- Status values are used for display and filtering only.
- Incomplete submissions should remain visible rather than being discarded.
- Unknown or malformed values should fall back to user-friendly defaults.
- Duplicate submissions should be displayed individually.
- The provided JSON file represents a snapshot of the submission feed.

## Known Limitations

Due to the project timebox, the following were intentionally not implemented:

- Duplicate submission detection
- Advanced sorting options
- Backend synchronization
- Multi-user reviewed state tracking
- Reviewer assignment workflows
- Submission editing
- Enhanced status visualization (badges, color-coding, and prioritization)
- Additional accessibility improvements beyond SwiftUI defaults

## What I Would Improve With More Time
- Duplicate detection and highlighting
- Advanced filtering and sorting
- Improved accessibility support
- Additional automated tests
- Core Data persistence
- Shared reviewed-state synchronization
- Submission analytics and audit history

## AI Usage

ChatGPT AI tools were used for:

- Requirement analysis
- Architecture brainstorming
- Identifying potential edge cases (e.g., missing fields, malformed records, invalid statuses)
- Documentation assistance, including README drafting and grammar refinement

All generated suggestions and code were manually reviewed, adapted to project requirements, tested locally, and validated against the assignment requirements before being included in the project.

## What I Would Like The Reviewer To Focus On

Please focus on:

- Data normalization strategy
- Handling of malformed and inconsistent records
- MVVM separation of concerns
- Search experience
- Reviewed-state workflow
- Error handling and resilience
- Overall implementation decisions and trade-offs

## Sreenshots and Screen Recording
#### Screen Recording

[View Screen Recording](./Screenshots/Screen%20Recording.mov)

#### Screenshots

| Load Data                                             | View Details                                             | No Results Found                                               |
| ----------------------------------------------------- | -------------------------------------------------------- | -------------------------------------------------------------- |
| <img src="./Screenshots/Load%20Data.png" width="250"> | <img src="./Screenshots/View%20Details.png" width="250"> | <img src="./Screenshots/No%20Results%20Found.png" width="250"> |

| Missing JSON File                                               | Empty JSON File                                               | Incorrect JSON File                                               |
| --------------------------------------------------------------- | ------------------------------------------------------------- | ----------------------------------------------------------------- |
| <img src="./Screenshots/Missing%20JSON%20File.png" width="250"> | <img src="./Screenshots/Empty%20JSON%20File.png" width="250"> | <img src="./Screenshots/Incorrect%20JSON%20File.png" width="250"> |









