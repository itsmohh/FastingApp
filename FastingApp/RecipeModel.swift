//
//  RecipeModel.swift
//  FastingApp
//
//  Created by Yinka  Facus  on 1/7/25.
//


import Foundation

enum Category: String, CaseIterable, Identifiable {
    
    var id: String { self.rawValue }
    
    case breakfast = "Breakfast"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
}

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let ingredients: String
    let directions: String
    let category: Category.RawValue
    let datePublished: String
    let url: String
}

extension Recipe {
    static let all: [Recipe] = [
        Recipe(name: "Jollof Rice",
               image: "https://img1.wsimg.com/isteam/ip/1eb26d5e-bb92-4cca-ba2b-816840f7ce50/fb_706690854047237_960x960.jpg/:/rs=w:360,h:270.6766917293233,cg:true,m/cr=w:360,h:270.6766917293233",
               description: "Jollof rice is a popular West African dish made with rice, tomatoes, and spices.",
               ingredients: "2 cups rice\n1 can diced tomatoes\n1 onion, chopped\n1 bell pepper, chopped\n2 cloves garlic, minced\n1 teaspoon curry powder\n1 teaspoon thyme\n1 teaspoon paprika\n1 teaspoon salt\n1/2 teaspoon black pepper\n2 cups chicken broth\n1 cup frozen peas",
               directions: "1. Heat oil in a large pot over medium heat. Add onions, bell peppers, and garlic. Cook until softened.\n2. Stir in rice, tomatoes, spices, and chicken broth. Bring to a boil.\n3. Reduce heat, cover, and simmer for 20-25 minutes or until rice is cooked.\n4. Stir in frozen peas and cook for an additional 5 minutes.\n5. Serve hot and enjoy!",
               category: "main",
               datePublished: "February 23, 2024",
               url: "https://example.com/jollof-rice"),
        
        Recipe(name: "Bacon, Egg, and Cheese",
               image: "https://img1.wsimg.com/isteam/stock/47047/:/rs=w:360,h:270,cg:true,m/cr=w:360,h:270",
               description: "A classic breakfast sandwich made with crispy bacon, fluffy eggs, and melted cheese.",
               ingredients: "2 slices bacon\n2 eggs\n2 slices cheddar cheese\n2 English muffins, split and toasted",
               directions: "1. Cook bacon in a skillet over medium heat until crispy. Remove and drain on paper towels.\n2. In the same skillet, cook eggs to your desired doneness (fried, scrambled, or poached).\n3. Place cheese slices on the bottom half of each English muffin.\n4. Top with cooked bacon and eggs.\n5. Cover with the top half of the English muffin.\n6. Serve hot and enjoy!",
               category: "Breakfast",
               datePublished: "February 23, 2024",
               url: "https://fantabulosity.com/wp-content/uploads/2018/04/Bacon-Egg-and-Cheese-Sandwich-11.jpg"),
        
        Recipe(name: "Pancakes and Eggs",
               image: "https://img1.wsimg.com/isteam/ip/df4c3d1c-94bf-4f52-9e53-db32702296b3/breakfast%20and%20Pancakes.jpg/:/rs=w:360,h:270,cg:true,m/cr=w:360,h:270",
               description: "A classic breakfast combo of fluffy pancakes served with scrambled eggs.",
               ingredients: "1 cup all-purpose flour\n2 tablespoons sugar\n1 tablespoon baking powder\n1/2 teaspoon salt\n1 cup milk\n2 tablespoons butter, melted\n2 eggs\nButter or oil for cooking\n4 eggs, scrambled",
               directions: "1. In a large bowl, whisk together flour, sugar, baking powder, and salt.\n2. In another bowl, mix together milk, melted butter, and eggs.\n3. Pour wet ingredients into dry ingredients and stir until just combined.\n4. Heat a skillet over medium heat and grease with butter or oil.\n5. Pour 1/4 cup of batter onto the skillet for each pancake.\n6. Cook until bubbles form on the surface, then flip and cook until golden brown.\n7. Serve pancakes with scrambled eggs.\n8. Enjoy!",
               category: "Breakfast",
               datePublished: "February 23, 2024",
               url: "https://www.thewannabechef.net/wp-content/uploads/2012/05/chickpea-flour-pancakes-over.jpg"),
        
        Recipe(name: "Pounded Yam and Efo Riro",
               image: "data:image/jpeg;base64,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",
               description: "A Nigerian delicacy consisting of pounded yam served with a flavorful spinach stew.",
               ingredients: "2 cups yam flour\n4 cups water\n2 bunches spinach, chopped\n1 onion, chopped\n2 tomatoes, chopped\n2 bell peppers, chopped\n2 scotch bonnet peppers, chopped\n1/2 cup palm oil\n1 cup stock or water\nSalt to taste",
               directions: "1. In a large pot, bring water to a boil.\n2. Gradually add yam flour, stirring constantly to prevent lumps.\n3. Once all the yam flour is added, reduce heat and continue to stir until the yam is fully cooked and smooth.\n4. In another pot, heat palm oil over medium heat. Add onions and cook until translucent.\n5. Add tomatoes, bell peppers, scotch bonnet peppers, and cook until softened.\n6. Stir in chopped spinach and stock or water. Cook until spinach is wilted.\n7. Season with salt to taste.\n8. Serve pounded yam with efo riro and enjoy!",
               category: "Main",
               datePublished: "February 23, 2024",
               url: "https://i.pinimg.com/736x/64/a0/f6/64a0f6bfe8d45fa3d1404d52b53af518.jpg"),
        
        Recipe(name: "Oxtail Stew",
               image: "https://i.pinimg.com/474x/41/8d/ef/418defed46f02fce5d658a73117540fd.jpg",
               description: "A rich and hearty stew made with tender oxtail and vegetables.",
               ingredients: "2 lbs oxtail\n2 tablespoons oil\n1 onion, chopped\n2 carrots, chopped\n2 stalks celery, chopped\n4 cloves garlic, minced\n2 tablespoons tomato paste\n4 cups beef broth\n1 bay leaf\n1 teaspoon thyme\nSalt and pepper to taste",
               directions: "1. Heat oil in a large pot over medium-high heat. Add oxtail and brown on all sides.\n2. Remove oxtail from the pot and set aside.\n3. In the same pot, add onion, carrots, celery, and garlic. Cook until softened.\n4. Stir in tomato paste and cook for 1-2 minutes.\n5. Return oxtail to the pot and add beef broth, bay leaf, thyme, salt, and pepper.\n6. Bring to a boil, then reduce heat and simmer for 2-3 hours or until oxtail is tender.\n7. Serve hot and enjoy!",
               category: "Soup",
               datePublished: "February 23, 2024",
               url: "https://organicallyaddison.com/wp-content/uploads/2023/02/2023-01-24_19-33-36_150-2023-01-25T03_50_33.275-700x1050.jpeg"),
        
        Recipe(name: "Mac and Cheese",
               image: "https://lumberyardbrewingcompany.com/wp-content/uploads/2020/12/BuffaloBlueMacweb.jpg",
               description: "Creamy and cheesy macaroni and cheese baked to perfection.",
               ingredients: "8 oz elbow macaroni\n4 tablespoons butter\n1/4 cup all-purpose flour\n2 cups milk\n2 cups shredded cheddar cheese\nSalt and pepper to taste\n1/2 cup breadcrumbs (optional)",
               directions: "1. Preheat oven to 350°F (175°C). Cook macaroni according to package instructions. Drain and set aside.\n2. In a saucepan, melt butter over medium heat. Stir in flour and cook for 1-2 minutes.\n3. Gradually whisk in milk until smooth and thickened.\n4. Stir in shredded cheddar cheese until melted and smooth.\n5. Season with salt and pepper to taste.\n6. Add cooked macaroni to the cheese sauce and mix until well combined.\n7. Transfer mixture to a greased baking dish. Sprinkle breadcrumbs on top if desired.\n8. Bake for 25-30 minutes or until bubbly and golden brown.\n9. Serve hot and enjoy!",
               category: "Side",
               datePublished: "February 23, 2024",
               url:"https://cookswithsoul.com/wp-content/uploads/2023/11/southern-mac-and-cheese-soul-food-2.jpg"),
        
        Recipe(name: "Pasta with Beef",
               image: "https://eatsimplefood.com/wp-content/uploads/2020/04/Traditional-Beef-Bolognese-Recipe-1200-EatSimpleFood.com_-360x270.jpg",
               description: "Savory pasta dish featuring tender beef in a rich tomato sauce.",
               ingredients: "8 oz pasta\n1 lb ground beef\n1 onion, chopped\n2 cloves garlic, minced\n1 can diced tomatoes\n1 tablespoon tomato paste\n1 teaspoon Italian seasoning\nSalt and pepper to taste\nGrated Parmesan cheese for serving",
               directions: "1. Cook pasta according to package instructions. Drain and set aside.\n2. In a large skillet, cook ground beef over medium heat until browned. Drain excess fat.\n3. Add onion and garlic to the skillet and cook until softened.\n4. Stir in diced tomatoes, tomato paste, and Italian seasoning. Simmer for 10-15 minutes.\n5. Season with salt and pepper to taste.\n6. Add cooked pasta to the skillet and toss until well coated.\n7. Serve hot with grated Parmesan cheese.\n8. Enjoy!",
               category: "Main",
               datePublished: "February 23, 2024",
               url: "https://example.com/pasta-with-beef"),
        
        Recipe(name: "Ice Cream",
               image: "https://hot-thai-kitchen.com/wp-content/uploads/2015/01/Thai-tea-ice-cream-tiny-360x270.png",
               description: "Smooth and creamy homemade ice cream in your favorite flavors.",
               ingredients: "2 cups heavy cream\n1 cup whole milk\n3/4 cup sugar\n1 teaspoon vanilla extract\nYour choice of flavorings (e.g., cocoa powder, fruit puree, etc.)",
               directions: "1. In a bowl, whisk together heavy cream, milk, sugar, and vanilla extract until sugar is dissolved.\n2. Pour mixture into an ice cream maker and churn according to manufacturer's instructions.\n3. Add flavorings (if using) during the last few minutes of churning.\n4. Transfer churned ice cream to a freezer-safe container and freeze for at least 4 hours or until firm.\n5. Serve scoops of homemade ice cream and enjoy!",
               category: "Dessert",
               datePublished: "February 23, 2024",
               url: "https://example.com/ice-cream")
    ]
}
