/*
 url: https://www.tutorialspoint.com/design_pattern/filter_pattern.htm
 */

import Foundation

// MARK: Enumeration
enum Gender {
    case male, female
}

enum MaritalStatus {
    case single, married, widower, divorced
}

// MARK: Element to filter
struct Person {
    var name: String
    var gender: Gender
    var maritalStatus: MaritalStatus
}


// MARK: Interface For Filter Criteria
protocol FilterCriteria  {
    static func meetCriteria(_ persons: [Person]) -> [Person]
}


// MARK: Filter Criteria Implementation
struct CriteriaFemale : FilterCriteria {
    static func meetCriteria(_ persons: [Person]) -> [Person] {
        persons.filter { person in
            person.gender == .female
        }
    }
}

struct CriteriaMale : FilterCriteria {
    static func meetCriteria(_ persons: [Person]) -> [Person] {
        persons.filter { person in
            person.gender == .male
        }
    }
}

struct CriteriaMarried : FilterCriteria {
    static func meetCriteria(_ persons: [Person]) -> [Person] {
        persons.filter { person in
            person.maritalStatus == .married
        }
    }
}

struct CriteriaSingle : FilterCriteria {
    static func meetCriteria(_ persons: [Person]) -> [Person] {
        persons.filter { person in
            person.maritalStatus == .single
        }
    }
}

struct CriteriaWindower : FilterCriteria {
    static func meetCriteria(_ persons: [Person]) -> [Person] {
        persons.filter { person in
            person.maritalStatus == .widower
        }
    }
}

struct CriteriaDivorced : FilterCriteria {
    static func meetCriteria(_ persons: [Person]) -> [Person] {
        persons.filter { person in
            person.maritalStatus == .divorced
        }
    }
}

// Utils
extension Array<Person> {
    func printPersons() {
        for i in self {
            print("\tName  : \(i.name)")
            print("\tGender: \(i.gender)")
            print("\tStatus: \(i.maritalStatus)\n")
        }
    }
}


var personList: [Person] = []

personList.append(Person(name: "Alejandra", gender: .female, maritalStatus: .single))
personList.append(Person(name: "Begoña", gender: .female, maritalStatus: .widower))
personList.append(Person(name: "Carlota", gender: .female, maritalStatus: .married))
personList.append(Person(name: "David", gender: .male, maritalStatus: .divorced))
personList.append(Person(name: "Ernesto", gender: .male, maritalStatus: .married))

print("- - - - - - - - - - ")
print("Complete List\n")
personList.printPersons()
print("- - - - - - - - - - ")
print("Female List\n")
CriteriaFemale.meetCriteria(
    personList
).printPersons()
print("- - - - - - - - - - ")
print("Male Married List\n")
CriteriaMale.meetCriteria(
    CriteriaMarried.meetCriteria(personList)
).printPersons()
print("- - - - - - - - - - ")
print("Female Widower List\n")
CriteriaFemale.meetCriteria(
    CriteriaWindower.meetCriteria(personList)
).printPersons()
print("- - - - - - - - - - ")
