//
//  ContentView.swift
//  CameraTest
//
//  Created by Alvin Ishimwe on 4/9/22.
//

import SwiftUI

//struct Cancer {
//    var name: String
//    var description: String
//    var symptons: [String]
//
//}

struct ContentView: View {
    
    // Initialize Cancer Object
    //let ActinicKeratosis = Cancer(name: "ActinicKeratosis", description: "")
    
    
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var imagePicked: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    
    
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Image(uiImage: image ?? UIImage(named: "defaultimage")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
                
                Button("Choose Picture") {
                    self.showSheet = true
                    
                }
                .padding()
                .actionSheet(isPresented: $showSheet)  {
                    ActionSheet(title: Text("Select Photo"),
                                message: Text("Choose"), buttons: [
                                    .default(Text("Photo Library")) {
                                        self.showImagePicker = true
                                        self.sourceType = .photoLibrary
                                        //imagePicked.toggle()
                                        
                                    },
                                    .default(Text("Camera")) {
                                        self.showImagePicker = true
                                        self.sourceType = .camera
                                        //imagePicked.toggle()
                                        
                                    },
                                    .cancel()
                                    
                                ])
                    
                }
                Spacer()
                
                //sends analyze button to another page
                if image != nil {
                    NavigationLink(destination: BasalCell()) {
                        
                        Text("Analyze")
                            .padding(15)
                        
                    }
                    .background(Color.green)
                    .cornerRadius(12)
                    
                    Spacer()
                    
                }
                
                
                
                
                
            }
            
            .navigationBarTitle("Take Skin Photo", displayMode: .inline)
            
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
            
            
        }
    }
}




//make 9 of these for each page
struct Actinic: View {
    var body: some View{
        VStack {
            
            Text("Actinic Keratosis")
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
            List {
                Text("- Rough, dry or scaly patch of skin")
                Text("- Slight bump on the top layer of skin")
                Text("- In some cases, a hard, wartlike surface")
                Text("- Color variations, including pink, red or brown")
                Text("- Itching, burning, bleeding or crusting")
                Text("- New patches or bumps on sun-exposed areas of head, neck, hands and forearms")
            }.padding()
            
        }
        
    }
    
    
}

struct BasalCell: View {
    var body: some View{
        VStack {
            
            Text("Basal Cell Carcinoma")
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
            List {
                Text("- A shiny skin-colored bump that’s translucent")
                Text("- A brown, black or blue lesion")
                Text("- A flat scaly patch with a raised edge")
                Text("- A white, waxy, scar-like lesion without a clearly defined border")
    
            }.padding()
            
        }
        
    }
    
    
}

struct Dermatofibroma: View {
    var body: some View{
        VStack {
            
            Text("Dermatofibroma")
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
            List {
                Text("- Most often found on the arms and legs of women")
                Text("- Small brown/reddish-brown firm mobile nodules")
                Text("- May be tender to touch")
                Text("- They generally do not change in size")
    
            }.padding()
            
        }
        
    }
    
    
}



struct Melanoma: View {
    var body: some View{
        VStack {
            
            Text("Melanoma")
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
            List {
                Text("- Mostly develop in areas exposed to the sun")
                Text("- More common in people with darker skin")
                Text("- A change in an existing mole")
                Text("- The development of a new pigmented or unusual looking growth on your skin")
    
            }.padding()
            
        }
        
    }
    
    
}

struct Melanocytic: View {
    var body: some View{
        VStack {
            
            Text("Melanocytic nevi")
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
            List {
                Text("- Any moles that are asymmetrical")
                Text("- Moles that might have irregular borders")
                Text("- Moles that might not be uniform in color")
                Text("- Moles that might have a diameter larger than a pencil’s eraser")
                Text("- Moles that are evolving or changing in size, shape or color")
    
            }.padding()
            
        }
        
    }
    
    
}

struct PigmentedBenign: View {
    var body: some View{
        VStack {
            
            Text("Pigmented Benign Keratosis")
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
            List {
                Text("- A round or oval-shaped waxy or rough bump, usually on the face, chest, shoulder or back")
                Text("- A flat growth or a slightly raised bump with a scaly surface")
                Text("- Varied size, from very small to more than 1 inch across")
                Text("- Varied number, ranging from single to multiple growths")
                Text("- Itchiness")
                Text("- Varied in color, ranging from light tan to brown or black")
    
            }.padding()
            
        }
        
    }
    
    
}


struct Vascular: View {
    var body: some View{
        VStack {
            
            Text("Vascular Lesion")
                .font(.title)
                .fixedSize(horizontal: false, vertical: true)
            List {
                Text("- A raised purplish area of skin that looks like a bruise")
                Text("- Lesion which grows larger over time")
                Text("- A lesion that may bleed when scratched or bumped")
                Text("- Swelling in surrounding skin")
                
    
            }.padding()
            
        }
        
    }
    
    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
