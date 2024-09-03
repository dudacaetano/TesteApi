import SwiftUI

struct WelcomeAnimation: View {
    @State private var isAnimating = false
    @State private var showOnboarding = false
    
    var body: some View {
        ZStack {
            if showOnboarding {
                OnboardingView()
            } else {
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color(hex: 0x1e1e1e))
                            .frame(width: 758, height: 758)
                            .scaleEffect(isAnimating ? 1 : 0)
                            .animation(.easeOut(duration: 1.5), value: isAnimating)
                        
                        Circle()
                            .fill(Color(hex: 0x272727))
                            .frame(width: 632, height: 632)
                            .scaleEffect(isAnimating ? 1 : 0)
                            .animation(.easeOut(duration: 1.5), value: isAnimating)
                        
                        Circle()
                            .fill(Color(hex: 0xd9d9d9))
                            .frame(width: 456, height: 456)
                            .scaleEffect(isAnimating ? 1 : 0.8)
                            .animation(.easeOut(duration: 1.5), value: isAnimating)
                        
                        VStack {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 267)
                            
                            Text("Single Speed & Fixas")
                                .font(.headline)
                                .foregroundStyle(.black)
                                .fontWeight(.light)
                                .padding([.bottom], 15)
                            
                            Image("bikeicon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 153)
                        }
                    }
                    .onAppear() {
                        withAnimation {
                            isAnimating = true
                        }
                        
                        // Muda o estado para mostrar a tela de onboarding após a animação
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            isAnimating = false
                            showOnboarding = true
                        }
                    }
                }
            }
        }
    }
}

struct OnboardingView: View {
    @State private var isOnboardingComplete = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading, spacing: 10) {                    
                    Text("BEM-VINDO AO FLIPFLOP, ESTAMOS FELIZES\nEM VER A COMUNIDADE CRESCENDO")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .padding([.leading, .top], 5)
                    
                    Text("Single Speed & Fixas")
                        .font(.body)
                        .fontWeight(.regular)
                        .padding(EdgeInsets(top: 0, leading: 5, bottom: 80, trailing: 5))
                    // Adicione mais conteúdo de onboarding aqui
                }
                
                VStack {
                    Spacer()
                    
                        ContinueButton()
                            .frame(width: 345, height: 46)
                            .padding(.bottom, 66) // Ajuste conforme necessário

                }
            }
            .padding(.horizontal) // Padding para ajustar o conteúdo à tela
        }
    }
}

struct WelcomeAnimation_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeAnimation()
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}
