# Westminster: A Haskell Repository for Clean Architecture and Domain-Driven Design

This repository serves as a practical exploration of implementing **Clean Architecture** and **Domain-Driven Design (DDD)** principles using the functional programming paradigm of **Haskell**. The primary focus is on building well-structured, maintainable, and testable applications by clearly separating concerns and modeling the domain effectively.

## Objective

The core objective of this project is to demonstrate how to apply Clean Architecture and DDD concepts within a Haskell codebase. This involves structuring applications into distinct layers (e.g., Entities, Use Cases, Interface Adapters, Frameworks & Drivers) and focusing on a rich domain model expressed through Haskell's powerful type system and functional constructs. While serving as a learning resource, the aim is to produce tangible examples of these architectural patterns in action.

## Project Ideas (Illustrative)

The following project ideas serve as potential domains for applying Clean Architecture and DDD in Haskell. They are intended to be illustrative and may evolve:

- **A Bounded Context for Inventory Management:** Implementing a system to manage product inventory, focusing on concepts like Products, Stock Levels, and Reservations, with clear boundaries and explicit domain logic.

- **A Core Domain for Order Processing:** Developing the central logic for handling customer orders, including entities like Orders, Order Items, and relevant business rules, decoupled from specific delivery mechanisms or payment gateways.

- **An Interface for User Management:** Designing the interaction layer for managing users, separating the core user domain from specific authentication or presentation frameworks.

## How to Contribute

Contributions that align with the repository's focus on Clean Architecture and DDD in Haskell are highly encouraged. You can contribute in the following ways:

- **Architectural Discussions and Improvements:** Provide feedback and suggestions on the architectural design, layer separation, and application of DDD principles. Open issues to discuss potential enhancements or alternative approaches.

- **Layer Implementations:** Contribute to the implementation of specific layers within the example projects, ensuring adherence to the architectural guidelines.

- **Domain Modeling:** Help refine and expand the domain models for the chosen project ideas, leveraging Haskell's type system to accurately represent business concepts and rules.

- **Testing Strategies:** Contribute unit, integration, and potentially property-based tests to ensure the robustness and correctness of the implemented layers and domain logic.

- **Documentation:** Enhance the README and provide more detailed documentation on the architectural choices, design decisions, and implementation details of each project.

## Getting Started

1. **Clone this repository:**
   ```bash
   git clone https://github.com/elyosemite/westminster.git
	 ```
2. Explore the project structure: Examine the directories to understand the intended separation of concerns based on Clean Architecture principles.
3. Navigate to specific project directories: Each project idea will likely reside in its own directory with a dedicated README outlining its domain, architecture, and how to run or test it.

## Acknowledgments
We extend our gratitude to the Haskell community for its wealth of resources, libraries, and insightful discussions that facilitate learning and building robust functional software. The principles of Clean Architecture and Domain-Driven Design, popularized by Robert C. Martin ("Uncle Bob") and Eric Evans respectively, serve as foundational guides for this repository.

Let's explore how the elegance and power of Haskell can be effectively combined with sound architectural principles to build maintainable and domain-centric applications!

Author: Yuri Melo yurifullstack@gmail.com

License: MIT