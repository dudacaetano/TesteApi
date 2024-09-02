import SwiftUI

struct ContinueButton: View {
    @State private var navigateToNextView = false

    var body: some View {
        Button {
            // Ação ao clicar no botão
            navigateToNextView = true
        } label: {
            Text("CONTINUAR")
                .font(.system(size: 15))
                .fontWeight(.regular)
                .padding()
                .foregroundColor(Color.textboard)
        }
        .frame(maxWidth: .infinity, minHeight: 46)
        .background(Color.boardbutton)
        .cornerRadius(4)
        .background( // NavigationLink como fundo do botão
            NavigationLink(
                destination: LoginViewUI(),
                isActive: $navigateToNextView,
                label: { EmptyView() }
            )
        )
    }
}

struct NextView: View {
    var body: some View {
        Text("Bem-vindo à próxima tela!")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    NavigationView {
        ContinueButton()
    }
}
