# dibasys_project


📱 Dibasys Flutter App .



A simple Flutter application demonstrating Login, Registration, and Manual Check-In with Auto Timer, using Hive for local storage and Provider for state management.

🚀 Features

Login using mobile number and 4-digit passcode

If the user is not found, there is an option to registration

Registration with name, mobile, and 4-digit password

User data stored securely using Hive

Manual Check-In screen with:

Project dropdown

Gate selection

Work type (Radio buttons: Budget / Issue)

Timer starts automatically after check-in

Working hours display with live timer

Fully responsive UI using flutter_screenutil



| Package              | Description                                |
| -------------------- | ------------------------------------------ |
| `flutter_screenutil` | Responsive sizing based on screen          |
| `provider`           | State management                           |
| `go_router`          | Declarative routing                        |
| `google_fonts`       | Clean, modern fonts                        |
| `flutter_svg`        | SVG asset rendering                        |
| `shared_preferences` | Persistent key-value storage (e.g., login) |
| `intl`               | Date/time formatting                       |
| `hive_flutter`       | Lightweight local storage                  |


🔐 Login Flow

User enters phone and passcode

On submit:

1.If user exists and passcode is correct → Navigate to Dashboard

2.If user doesn't exist → Show snackbar & option to register



📝 Registration Flow

1.Collect name, mobile, and 4-digit passcode

2.Validate all fields

3.Save user data in Hive box

4.Navigate to Dashboard

⏱ Check-in Functionality

1.User selects project, gate, and work type

2.Press "Check-In"

3.Timer starts immediately and displays on dashboard

4.Timer uses Timer.periodic() and updates every second

5.Timer stops on logout or manually calling stopTimer()