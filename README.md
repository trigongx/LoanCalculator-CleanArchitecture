# Loan Calculator with Clean Architecture

A Flutter application for calculating loan repayment based on the loan amount, term, and interest rate.

## Overview

Loan Calculator allows users to adjust loan parameters and calculate the estimated total repayment. Users can submit their loan details and receive feedback about the request status.

The project is structured around **Clean Architecture**, separating presentation, business logic, and data access responsibilities.

## Features

- Adjust the loan amount.
- Select the loan term.
- Calculate the estimated total repayment dynamically.
- Submit loan details.
- Display loading, success, and error states.
- Support light and dark themes.
- Persist application preferences and the last loan details locally.

## Tech Stack

- **Flutter** — cross-platform UI framework.
- **Dart** — programming language.
- **flutter_bloc / Cubit** — state management.
- **Dartz** — functional result handling with `Either`.
- **Dio** — HTTP networking.
- **SharedPreferences** — local key-value persistence.
- **GetIt** — dependency injection.
- **Equatable** — value equality.
- **Mockito** — mock objects for unit testing.
- **bloc_test** — testing Cubit state transitions.
- **build_runner** — code generation.

## Architecture

The project follows Clean Architecture principles, separating the application into three main layers.

```text
lib/
└── src/
    ├── core/
    │   ├── components/
    │   ├── theme/
    │   └── ...
    ├── data/
    │   ├── datasources/
    │   ├── models/
    │   └── repositories/
    ├── domain/
    │   ├── entities/
    │   ├── repositories/
    │   └── use_cases/
    └── presentation/
        ├── cubit/
        └── view/
```

## UI Design
-
<p>
  <img src="https://github.com/user-attachments/assets/b4172253-3d5c-455b-b60f-74e1ccb25f7d" width="250">
  <img src="https://github.com/user-attachments/assets/d3f3bf16-4a3e-45f1-9a51-fdf6b9c1e5f9" width="250">
  <img src="https://github.com/user-attachments/assets/294aa3d2-5985-458f-97a0-0d35787003a9" width="250">
  <img src="https://github.com/user-attachments/assets/b01867a6-a2c8-45de-9c1d-c13d608bb484" width="250">
<p/>
      
---

## Set Up
- Clone Project
```bash
git clone https://github.com/trigongx/LoanCalculator-CleanArchitecture.git
```

- ```flutter run```

---

## Contact Me
[![LinkedIn](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/daniyar-bolotbekov/)
[![YouTube](https://img.shields.io/badge/youtube-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtube.com/@danntalant/)

bolotbekovdaniar7@gmail.com



created by ea.

