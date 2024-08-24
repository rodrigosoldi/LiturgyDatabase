# LiturgyMakeRealmDatabase
An executable swift spm project to create a Realm Database with Catholic Liturgy.
This project provides a tool to automatically generate a Realm database containing Catholic liturgies using JSON”

## Table of Contents

- [LiturgyMakeRealmDatabase](#liturgymakerealmdatabase)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
    - [Manually](#manually)
  - [Usage](#usage)
  - [Features](#features)
  - [Examples](#examples)
  - [Contributing](#contributing)
  - [License](#license)
  - [Contact](#contact)
  - [Credits](#credits)

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding LiturgyMakeRealmDatabase as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift` or the Package list in Xcode.

```swift
dependencies: [
    .package(url: "https://github.com/rodrigosoldi/LiturgyMakeRealmDatabase.ig", branch: "main")
]
```

Normally you'll want to depend on the `LiturgyMakeRealmDatabase` target:

```swift
.product(name: "LiturgyMakeRealmDatabase")
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can download `LiturgyMakeRealmDatabase` and run it manually.

```bash
git clone https://github.com/rodrigosoldi/LiturgyMakeRealmDatabase.git
```

## Usage

To execute the project run:
_*Make sure you have `swift` installed on your machine._

```swift
swift run
```

It will iterate all jsons in folder `Liturgies` trying to add them to the database..
To add more liturgies, create new jsons and add on `Liturgies` folder.
See [Example](#example) to create a readable json.

You will see the path of the database, and a little description for each liturgy added on database.

## Features

- [x] Make from JSON
- [ ] Get JSON from server
- [ ] SPM project consuming it database _(in progress)_

## Examples

Once you download the project you will see an [Example JSON](./Example/example.json) at folder `Examples`. Feel free to update it json and run project to see updates.
Follow its structure to create new liturgies.
I suggested you create one json file by liturgy day, but the structure is already prepared to receive an array of liturgies.

## Contributing

Feel free to fork the project and collaborate.

1. Fork the repository.
2. Create a new branch: `git checkout -b my-new-feature`
3. Make your changes and commit them: `git commit -m 'Add some feature'`
4.	Push to the branch: `git push origin my-new-feature`
5.	Submit a pull request.

## License

LiturgyMakeRealmDatabase is released under the MIT license. See [LICENSE](./LICENSE) for details.

## Contact

- [rodrigo.soldi@gmail.com](mailto:rodrigo.soldi@gmail.com)

## Credits

- [Rodrigo Soldi](https://github.com/rodrigosoldi)