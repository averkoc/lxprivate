# 🐾 Animal Class Hierarchy (Mermaid UML Diagram)

This diagram illustrates a simple class hierarchy for animals using [Mermaid](https://mermaid-js.github.io/mermaid/#/) syntax. It includes a base `Animal` class and three derived classes: `Duck`, `Fish`, and `Zebra`.

## 📐 UML Class Diagram

```mermaid
classDiagram
    Animal <|-- Duck
    Animal <|-- Fish
    Animal <|-- Zebra
    Animal : +int age
    Animal : +isMammal()
    class Duck {
        +String beakColor
        +swim()
    }
    class Fish {
        +int finCount
        +swim()
    }
    class Zebra {
        +String stripePattern
        +run()
    }
