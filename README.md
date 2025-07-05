# OCamlLogicLab: Minimal Propositional Logic Verifier

## Overview

**OCamlLogicLab** is a minimal symbolic logic verifier written in **OCaml**. It evaluates propositional logic formulas over all possible truth assignments and classifies them as:

- **Tautology**: True in all cases.
- **Contradiction**: False in all cases.
- **Contingent**: True in some cases, false in others.

This project demonstrates symbolic reasoning, functional programming, and truth-table-based evaluation, making it relevant for fields like **formal verification, theorem proving, and automated reasoning**.

---

## Features

- Symbolic representation of Boolean formulas.
- Automated truth table generation for any set of variables.
- Classification into tautology, contradiction, or contingency.
- Easy to extend for additional logical operators or modal logic.

---

## Example Formulas Evaluated:

| Formula                           | Classification   |
|-----------------------------------|------------------|
| P ∨ ¬P                            | Tautology        |
| P ∧ ¬P                            | Contradiction    |
| P → Q                             | Contingent       |

---

## How to Run

### Requirements:
- OCaml (version 5.x or above recommended)
- OPAM package manager

### Steps:

```bash
# Move into project folder
cd path/to/OCamlLogicLab

# Run the program
ocaml logic.ml
```

The program will output the classification for the example formulas included.

---

## Future Directions

- Support parsing formula strings.
- Add more operators: biconditional (↔), exclusive or (⊕).
- Generate printable truth tables.
- Extend to minimal natural deduction proof checking.
- Explore connection with **SMT solvers** or **Coq/Isabelle** for formal proofs.

---

## Relevance to Research

This project reflects foundational skills in **formal logic**, **symbolic computation**, and **functional programming**—key areas in:

- Automated Theorem Proving
- SMT Solving
- Formal Verification
- Interactive Proof Assistants

It serves as an entry-level demonstration of computational logic that can be expanded for more advanced proof systems.

---
