//
//  LiturgyView.swift
//  LiturgyDatabaseExample
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import SwiftUI
import LiturgyDatabase

struct LiturgyView: View {

	var liturgy: Liturgy

    var body: some View {
		VStack {
			ScrollView {
				Text(liturgy.liturgy)
					.font(.title2)
					.multilineTextAlignment(.center)
					.padding(.horizontal, 20)
					.padding(.bottom, 20)

				Text("Primeira Leitura")
					.font(.title3)
				if let reading = liturgy.firstReadings.first {
					Text(reading.reference)
						.font(.subheadline)

					Text(reading.title ?? "")
					Text(reading.text)
						.padding(.bottom, 20)
				}

				Text("Salmo")
					.font(.title3)

				if let psalm = liturgy.psalms.first {
					Text(psalm.reference)
						.font(.subheadline)

					Text(psalm.chorus)
						.bold()

					Text(psalm.text)
						.padding(.bottom, 20)
				}


				if let reading = liturgy.secondReadings.first {
					Text("Segunda Leitura")
						.font(.title3)

					Text(reading.reference)
						.font(.subheadline)

					Text(reading.title ?? "")
					Text(reading.text)
						.padding(.bottom, 20)
				}

				Text("Evangelho")
					.font(.title3)

				if let gospel = liturgy.gospels.first {

					if let acclamation = gospel.gospelAcclamation {
						Text(acclamation.chorus)
							.bold()

						Text(acclamation.text ?? "")
							.padding(.bottom, 20)
					}

					if let reading = gospel.reading {
						Text(reading.reference)
							.font(.subheadline)

						Text(reading.title ?? "")
						Text(reading.text)
							.padding(.bottom, 20)
					}
				}
			}
			.scrollIndicators(.hidden)
			.navigationBarTitleDisplayMode(.inline)
			.navigationTitle(liturgy.date)
		}
		.padding()
    }
}

#Preview {

	let firstReading = Reading(
		id: UUID(),
		reference: "Cron 15,3-4.15-16; 16,1-2",
		title: "Leitura do Primeiro Livro das Crônicas",
		text: "Naqueles dias, 3 Davi convocou todo o Israel em Jerusalém, a fim de transportar a arca do Senhor para o lugar que lhe havia preparado. 4 Davi reuniu também os filhos de Aarão e os levitas. 15 Os filhos de Levi levaram a arca de Deus, com os varais sobre os ombros, como Moisés havia mandado, de acordo com a ordem do Senhor. 16 Davi ordenou aos chefes dos levitas que designassem seus irmãos como cantores, para entoarem cânticos festivos, acompanhados de instrumentos musicais, harpas, cítaras e címbalos. 16,1 Tendo, pois, introduzido a arca de Deus e colocado no meio da tenda que Davi tinha armado, ofereceram na presença de Deus holocaustos e sacrifícios pacíficos. 2 Depois de oferecer os holocaustos e os sacrifícios pacíficos, Davi abençoou o povo em nome do Senhor.")
	let psalm = Psalm(
		id: UUID(),
		reference: "Sl 131(132)",
		chorus: "Subi, Senhor, para o lugar de vosso pouso, subi com vossa arca poderosa!",
		texts: [
			"Nós soubemos que a arca estava em Éfrata e nos campos de Iaar a encontramos: entremos no lugar em que ele habita, ante o escabelo de seus pés o adoremos!",
			"Que se vistam de alegria os vossos santos, e os vossos sacerdotes, de justiça! Por causa de Davi, o vosso servo, não afasteis do vosso Ungido a vossa face!",
			"Pois o Senhor quis para si Jerusalém e a desejou para que fosse sua morada: \"Eis o lugar do meu repouso para sempre, eu fico aqui: este é o lugar que preferi!\""
		])
	let secondReading = Reading(
		id: UUID(),
		reference: "I Cor 15,54-57",
		title: "Leitura da Primeira Carta de São Paulo aos Coríntios",
		text: "Irmãos: 54 Quando este ser corruptível estiver vestido de incorruptibilidade e este ser mortal estiver vestido de imortalidade, então estará cumprida a palavra da Escritura: \"A morte foi tragada pela vitória. 55 Ó morte, onde está a tua vitória? Onde está o teu aguilhão?\" 56 O aguilhão da morte é o pecado, e a força do pecado é a Lei. 57 Graças sejam dadas a Deus que nos dá a vitória pelo Senhor nosso, Jesus Cristo.")
	let gospelAcclamation = GospelAcclamation(
		id: UUID(),
		chorus: "Aleluia, Aleluia, Aleluia.",
		text: "Felizes aqueles que ouvem a palavra de Deus e a guardam!")
	let gospelReading = Reading(
		id: UUID(),
		reference: "Lc 11,27-28",
		title: nil,
		text: "Naquele tempo, 27 Enquanto Jesus falava ao povo uma mulher levantou a voz no meio da multidão e lhe disse: \"Feliz o ventre que te trouxe e os seios que te amamentaram\". 28 Jesus respondeu: \"Muito mais felizes são aqueles que ouvem a palavra de Deus e a põem em prática\".")
	let gospel = Gospel(
		id: UUID(),
		gospelAcclamation: gospelAcclamation,
		reading: gospelReading)
	let liturgy = Liturgy(
		id: UUID(),
		date: "18/08/24",
		liturgy: "Assunção da Bem-aventurada Virgem Maria, Solenidade",
		liturgicalColor: .white,
		firstReadings: [firstReading, firstReading],
		psalms: [psalm, psalm],
		secondReadings: [secondReading, secondReading],
		gospels: [gospel, gospel])
	return NavigationView {
		LiturgyView(liturgy: liturgy)
	}
}
