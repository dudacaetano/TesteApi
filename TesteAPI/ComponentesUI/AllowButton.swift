import SwiftUI

struct AllowButton: View {
    @State private var navigateToNextView = false

    var body: some View {
        Button {
            // Ação ao clicar no botão
            navigateToNextView = true
        } label: {
            Text("PERMITIR")
                .font(.system(size: 15))
                .fontWeight(.regular)
                .padding()
                .foregroundColor(Color.textboard)
        }
        .frame(maxWidth: .infinity, minHeight: 46)
        .background(Color.boardbutton)
        .cornerRadius(4)
        .background( // NavigationLink como fundo do botão
        )
    }
}

#Preview {
    NavigationView {
        AllowButton()
    }
}
