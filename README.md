<p align="center">
<a href="https://img.shields.io/github/v/tag/rodrigosoldi/liturgydatabase"><img alt="GitHub Tag" src="https://img.shields.io/github/v/tag/rodrigosoldi/liturgydatabase"></a>
<a href="https://swift.org/package-manager/"><img src="https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat"></a>
<a href="https://github.com/rodrigosoldi/LiturgyDatabase/blob/main/LICENSE"><img alt="GitHub License" src="https://img.shields.io/github/license/rodrigosoldi/liturgydatabase?color=%23ffffff&link=https%3A%2F%2Fgithub.com%2Frodrigosoldi%2FLiturgyDatabase%2Fblob%2Fmain%2FLICENSE"></a>
<img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/rodrigosoldi/liturgydatabase">
<img alt="GitHub commit activity (branch)" src="https://img.shields.io/github/commit-activity/m/rodrigosoldi/liturgydatabase/release">
</p>

# LiturgyDatabase

- Liturgies from **_June, 2024, 1st_** to **_July, 2025, 31th_**

**This repo is updated periodically with new liturgies**
**All liturgies are in Portuguese**

A little repo with two products:
- Library: **LiturgyDatabase**
  - A tool to consume generated database
- Executable: **LiturgyMakeDatabase**
    - An executable swift spm project to create a Database with Catholic Liturgy.

## Table of Contents

- [LiturgyDatabase](#liturgydatabase)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
    - [Manually](#manually)
  - [Usage](#usage)
    - [LiturgyDatabase](#liturgydatabase-1)
    - [LiturgyMakeDatabase](#liturgymakedatabase)
  - [Examples](#examples)
    - [LiturgyDatabase](#liturgydatabase-2)
    - [LiturgyMakeDatabase](#liturgymakedatabase-1)
  - [Features](#features)
  - [Contributing](#contributing)
  - [License](#license)
  - [Contact](#contact)
  - [Credits](#credits)

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding LiturgyDatabase as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift` or the Package list in Xcode.

```swift
dependencies: [
    .package(url: "https://github.com/rodrigosoldi/LiturgyDatabase.git", from: "1.0.0")
]
```

Normally you'll want to depend on the `LiturgyDatabase` target:

```swift
.product(name: "LiturgyDatabase")
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can download `LiturgyDatabase` and run it manually.

```bash
git clone https://github.com/rodrigosoldi/LiturgyDatabase.git
```

## Usage

_*Make sure you have `swift` installed on your machine._

### LiturgyDatabase

Use `LiturgyDatabase` to fetch and filter all liturgies on database.

### LiturgyMakeDatabase

To execute the project run:

```swift
swift run LiturgyMakeDatabase <PATH_TO_CREATE_DATABASE.realm>
```

It will iterate all jsons in folder `Liturgies` trying to add them to the database.
To add more liturgies, create new jsons and add on `Liturgies` folder.
See [Example](#example) to create a readable json.
You can use an [Empty](./Example/empty.json) json to create a new one.

You will see the path of the database, and a little description for each liturgy added on database.

If you don't want run the project, go to [Database Folder](./Database) and use `database.realm` to develop.

## Examples

### LiturgyDatabase

```swift
let liturgyDatabaseController: LiturgyDatabaseControllable = try LiturgyDatabaseController()
let liturgies: [Liturgy] = try await liturgyDatabaseController.fetchAll()
```

### LiturgyMakeDatabase

Once you download the project you will see an [Example JSON](./Example/example.json) at folder `Examples`. Feel free to update it json and run project to see updates.
Follow its structure to create new liturgies.
I suggest creating one JSON file per liturgy day, but the structure is already prepared to receive an array of liturgies.

```json
{
    "version": 2,
    "liturgies": [
        {
            "date": "18/08/24",
            "liturgy": "Assunção da Bem-aventurada Virgem Maria, Solenidade",
            "liturgicalColor": "BRANCO",
            "obs": "",
            "readings": [
                {
                    "type": "reading",
                    "title": "1ª Leitura",
                    "obs": "",
                    "readings" : [
                        {
                            "obs": "",
                            "reference": "Cron 15,3-4.15-16; 16,1-2",
                            "title": "Leitura do Primeiro Livro das Crônicas",
                            "text": "Naqueles dias, 3 Davi convocou todo o Israel em Jerusalém, a fim de transportar a arca do Senhor para o lugar que lhe havia preparado. 4 Davi reuniu também os filhos de Aarão e os levitas. 15 Os filhos de Levi levaram a arca de Deus, com os varais sobre os ombros, como Moisés havia mandado, de acordo com a ordem do Senhor. 16 Davi ordenou aos chefes dos levitas que designassem seus irmãos como cantores, para entoarem cânticos festivos, acompanhados de instrumentos musicais, harpas, cítaras e címbalos. 16,1 Tendo, pois, introduzido a arca de Deus e colocado no meio da tenda que Davi tinha armado, ofereceram na presença de Deus holocaustos e sacrifícios pacíficos. 2 Depois de oferecer os holocaustos e os sacrifícios pacíficos, Davi abençoou o povo em nome do Senhor."
                        },
                        {
                            "obs": "",
                            "reference": "Ap 11,19a; 12,1.3-6a.10ab",
                            "title": "Leitura do Livro do Apocalipse de São João",
                            "text": "Abriu-se o Templo de Deus que está no céu e apareceu no Templo a arca da Aliança. 12,1 Então apareceu no céu um grande sinal: uma mulher vestida de sol, tendo a lua debaixo dos pés e sobre a cabeça uma coroa de doze estrelas. 3 Então apareceu outro sinal no céu: um grande Dragão, cor de fogo. Tinha sete cabeças e dez chifres e, sobre as cabeças, sete coroas. 4 Com a cauda, varria a terça parte das estrelas do céu, atirando-as sobre a terra. O Dragão parou diante da Mulher que estava para dar à luz, pronto para devorar o seu Filho, logo que nascesse. 5 E ela deu à luz um filho homem, que veio para governar todas as nações com cetro de ferro. Mas o Filho foi levado para junto de Deus e do seu trono. 6a A mulher fugiu para o deserto, onde Deus lhe tinha preparado um lugar. 10ab Ouvi então uma voz forte no céu, proclamando: \"Agora realizou-se a salvação, a força e a realeza do nosso Deus, e o poder do seu Cristo\"."
                        }
                    ]                
                },
                {
                    "type": "psalm",
                    "title": "Salmo",
                    "obs": "",
                    "readings": [                        
                        {
                            "obs": "",
                            "reference": "Sl 131(132)",
                            "chorus": "Subi, Senhor, para o lugar de vosso pouso, subi com vossa arca poderosa!",
                            "verses": [
                                "Nós soubemos que a arca estava em Éfrata e nos campos de Iaar a encontramos: entremos no lugar em que ele habita, ante o escabelo de seus pés o adoremos!",
                                "Que se vistam de alegria os vossos santos, e os vossos sacerdotes, de justiça! Por causa de Davi, o vosso servo, não afasteis do vosso Ungido a vossa face!",
                                "Pois o Senhor quis para si Jerusalém e a desejou para que fosse sua morada: \"Eis o lugar do meu repouso para sempre, eu fico aqui: este é o lugar que preferi!\""
                            ]
                        },
                        {
                            "obs": "",
                            "reference": "Sl 5Sl 44(45)",
                            "chorus": "À vossa direita se encontra a rainha, com veste esplendente de ouro de Ofir.",
                            "verses": [
                                "As filhas de reis vêm ao vosso encontro, e à vossa direita se encontra a rainha com veste esplendente de ouro de Ofir.",
                                "Escutai, minha filha, olhai, ouvi isto: \"Esquecei vosso povo e a casa paterna! Que o Rei se encante com vossa beleza! Prestai-lhe homenagem: é vosso Senhor!",
                                "Entre cantos de festa e com grande alegria, ingressam, então, no palácio real\". "
                            ]
                        }
                    ]
                },
                {
                    "type": "reading",
                    "title": "2ª Leitura",
                    "obs": "",
                    "readings" : [                        
                        {
                            "obs": "",
                            "reference": "I Cor 15,54-57",
                            "title": "Leitura da Primeira Carta de São Paulo aos Coríntios",
                            "text": "Irmãos: 54 Quando este ser corruptível estiver vestido de incorruptibilidade e este ser mortal estiver vestido de imortalidade, então estará cumprida a palavra da Escritura: \"A morte foi tragada pela vitória. 55 Ó morte, onde está a tua vitória? Onde está o teu aguilhão?\" 56 O aguilhão da morte é o pecado, e a força do pecado é a Lei. 57 Graças sejam dadas a Deus que nos dá a vitória pelo Senhor nosso, Jesus Cristo."
                        },
                        {
                            "obs": "",
                            "reference": "I Cor 15,20-27a",
                            "title": "Leitura da Primeira Carta de São Paulo aos Coríntios",
                            "text": "Irmãos: 20 Cristo ressuscitou dos mortos como primícias dos que morreram. 21 Com efeito, por um homem veio a morte e é também por um homem que vem a ressurreição dos mortos. 22 Como em Adão todos morrem, assim também em Cristo todos reviverão. 23 Porém, cada qual segundo uma ordem determinada: Em primeiro lugar, Cristo, como primícias; depois, os que pertencem a Cristo, por ocasião da sua vinda. 24 A seguir, será o fim, quando ele entregar a realeza a Deus-Pai, depois de destruir todo principado e todo poder e força. 25 Pois é preciso que ele reine até que todos os seus inimigos estejam debaixo de seus pés. 26 O último inimigo a ser destruído é a morte. 27a Com efeito, \"Deus pôs tudo debaixo de seus pés\"."
                        }
                    ]                
                },
                {
                    "type": "gospel",
                    "title": "Evangelho",
                    "obs": "",
                    "readings": [                        
                        {
                            "gospelAcclamation": {
                                "chorus": "Aleluia, Aleluia, Aleluia.",
                                "text": "Felizes aqueles que ouvem a palavra de Deus e a guardam!"
                            },
                            "reading": {
                                "obs": "",
                                "reference": "Lc 11,27-28",
                                "title": null,
                                "text": "Naquele tempo, 27 Enquanto Jesus falava ao povo uma mulher levantou a voz no meio da multidão e lhe disse: \"Feliz o ventre que te trouxe e os seios que te amamentaram\". 28 Jesus respondeu: \"Muito mais felizes são aqueles que ouvem a palavra de Deus e a põem em prática\"."
                            }
                        },
                        {
                            "gospelAcclamation": {
                                "chorus": "Aleluia, Aleluia, Aleluia.",
                                "text": "Maria é elevada ao céu, alegram-se os coros dos anjos."
                            },
                            "reading": {
                                "obs": "",
                                "reference": "Lc 1,39-56",
                                "title": "Proclamação do Evangelho de Jesus Cristo + segundo Lucas",
                                "text": "Naqueles dias, 39 Maria partiu para a região montanhosa, dirigindo-se, apressadamente, a uma cidade da Judeia. 40 Entrou na casa de Zacarias e cumprimentou Isabel. 41 Quando Isabel ouviu a saudação de Maria, a criança pulou no seu ventre e Isabel ficou cheia do Espírito Santo. 42 Com um grande grito, exclamou: \"Bendita és tu entre as mulheres e bendito é o fruto do teu ventre!\" 43 Como posso merecer que a mãe do meu Senhor me venha visitar? 44 Logo que a tua saudação chegou aos meus ouvidos, a criança pulou de alegria no meu ventre. 45 Bem-aventurada aquela que acreditou, porque será cumprido, o que o Senhor lhe prometeu\". 46 Então Maria disse: \"A minha alma engrandece o Senhor, 47 e o meu espírito se alegra em Deus, meu Salvador, 48 porque olhou para a humildade de sua serva. Doravante todas as gerações me chamarão bem-aventurada, 49 porque o Todo-poderoso fez grandes coisas em meu favor. O seu nome é santo, 50 e sua misericórdia se estende, de geração em geração, a todos os que o respeitam. 51 Ele mostrou a força de seu braço: dispersou os soberbos de coração. 52 Derrubou do trono os poderosos e elevou os humildes. 53 Encheu de bens os famintos, e despediu os ricos de mãos vazias. 54 Socorreu Israel, seu servo, lembrando-se de sua misericórdia, 55 conforme prometera aos nossos pais, em favor de Abraão e de sua descendência, para sempre\". 56 Maria ficou três meses com Isabel; depois voltou para casa."
                            }
                        }
                    ]
                }
            ]
        }
    ]
}
```

## Features

- [x] Make from JSON
- [X] SPM project consuming it database
- [ ] Get JSON from server

## Contributing

Feel free to fork the project and collaborate.

1. Fork the repository.
2. Create a new branch: `git checkout -b feature/my-new-feature`
3. Make your changes and commit them: `git commit -m 'Add some feature'`
4.	Push to the branch: `git push origin feature/my-new-feature`
5.	Submit a pull request.

## License

LiturgyDatabase is released under the MIT license. See [LICENSE](./LICENSE) for details.

## Contact

- [Mail Me](mailto:rodrigosoldi@icloud.com)

## Credits

- [Rodrigo Soldi](https://github.com/rodrigosoldi)
