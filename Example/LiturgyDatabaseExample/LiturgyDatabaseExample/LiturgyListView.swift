//
//  LiturgyListView.swift
//  LiturgyDatabaseExample
//
//  Created by Rodrigo Soldi on 26/08/24.
//

import SwiftUI
import LiturgyDatabase

struct LiturgyListView: View {

	@State private var liturgies: [Liturgy] = []
	private let liturgyDatabase: LiturgyDatabase = try! LiturgyDatabaseImpl()

    var body: some View {
		NavigationView(content: {
			List(liturgies) { liturgy in
				NavigationLink {
					LiturgyView(liturgy: liturgy)
				} label: {
					Text("\(liturgy.date) - \(liturgy.liturgy)")
				}
			}
			.navigationTitle("Liturgies")
		})
		.toolbar(.visible, for: .navigationBar)
		.navigationBarTitleDisplayMode(.large)
		.task {
			Task {
				liturgies = try await liturgyDatabase.fetchAll().sorted(by: { $0.date < $1.date })
			}
		}
    }
}

#Preview {
	LiturgyListView()
}
