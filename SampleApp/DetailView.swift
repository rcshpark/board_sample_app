import SwiftUI

struct DetailView: View {
    @ObservedObject var kakaoAuthVM : KakaoAuthVM
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack{
            HStack{
                Spacer()
            }
            Text("\(kakaoAuthVM.userModel.email ?? "사용자 이름") 님 환영합니다.").padding(10)
            Text("test").onTapGesture {
                print("Text Button active")
            }.padding(10)
            Button("Btn",action: {
                print("button active")
            }).foregroundColor(Color.red)
            Spacer()
        }.toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                  print("toolbar")
                } label: {
                    Image(systemName: "person.crop.circle")
                }
            }
            }.padding()
            .navigationBarBackButtonHidden()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(kakaoAuthVM: KakaoAuthVM())
    }
}

