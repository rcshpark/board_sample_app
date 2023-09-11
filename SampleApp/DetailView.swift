import SwiftUI

struct DetailView: View {
    @ObservedObject var kakaoAuthVM : KakaoAuthVM
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var feedbackString = ""
    @State private var feedbackItems: [String] = []
    
    @State private var toDoString = ""
    @State private var toDoItems: [String] = []
    
    func deleteFeedbackItem(at offsets: IndexSet) {
        feedbackItems.remove(atOffsets: offsets)
    }
    func deleteTodoItem(at offsets: IndexSet) {
        toDoItems.remove(atOffsets: offsets)
    }
    var body: some View {
        VStack{
            HStack{
                Spacer()
            }
            Text("\(kakaoAuthVM.userModel.name ?? "사용자 이름") 님 환영합니다.\n오늘도 열심히 연습합시다!").padding(10)
            Spacer().frame(height: 50)
            Group{
                Text("Section 1").fontWeight(.bold).font(.system(size: 24)).frame(width: 300,height: 30,alignment: .leading)
                HStack {
                       Image(systemName: "square.and.pencil")
                       TextField("이곳에 작성해주세요", text: $feedbackString)
                       }
                       .textFieldStyle(DefaultTextFieldStyle())
                       .frame(width: 300, height: 50, alignment: .center)
                Button("추가하기",action: {
                    if !feedbackString.isEmpty{
                        feedbackItems.append(feedbackString)
                        feedbackString = ""
                    }
                    print("button active")
                }).foregroundColor(Color.red)
                List {
                    ForEach(feedbackItems, id: \.self){item in Text(item)}.onDelete(perform: deleteFeedbackItem)
                }
            }
            Group{
                Text("Section 2").fontWeight(.bold).font(.system(size: 24)).frame(width: 300,height: 30,alignment: .leading)
                HStack {
                       Image(systemName: "square.and.pencil")
                       TextField("이곳에 작성해주세요", text: $toDoString)
                       }
                       .textFieldStyle(DefaultTextFieldStyle())
                       .frame(width: 300, height: 50, alignment: .center)
                Button("추가하기",action: {
                    if !toDoString.isEmpty{
                        toDoItems.append(toDoString)
                        toDoString = ""
                    }
                }).foregroundColor(Color.red)
                List {
                    ForEach(toDoItems, id: \.self){item in Text(item)}.onDelete(perform: deleteTodoItem)
                }
            }
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

