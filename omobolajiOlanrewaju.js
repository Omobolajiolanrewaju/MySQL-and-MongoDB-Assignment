// use items_management_db; 

db.createCollection("category", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            title: "Item Category",
            required: ["category_name", "description"],
            properties: {
                category_name: {
                    bsonType: "string",
                    description: "'name' must be a string and is required."
                },
                description: {
                    bsonType: "string",
                    description: "'description' must be a string and is required."
                }
            }
        }
    }
})

db.createCollection("users", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            title: "User object Validator",
            required: ["name", "email", "gender", "phone_number", "password", "user_type"],
            properties: {
                name: {
                    bsonType: "string",
                    description: "'name' must be a string and is required."
                },
                email: {
                    bsonType: "string",
                    description: "'email' must be a string and is required."
                },
                gender: {
                    enum: ["male", "female"],
                    description: "gender must be either male or female."
                },
                phone_number: {
                    bsonType: "string",
                    description: "'phone number' must be string and is required."
                },
                password: {
                    bsonType: "string",
                    description: "'password' must be a string and is required."
                },
                user_type: {
                    enum: ["user", "admin"],
                    description: "user type must be either user or admin."
                }
            }
        }
    }
})

db.createCollection("items")

db.createCollection("admins")

db.createCollection("orders")

db.createCollection("order_item")

db.createCollection("admin_item")

db.createCollection("user_item")

db.createCollection("admin_order")


// Inserting data into the table

db.category.insertOne({_id: 1, category_name: "Appliances", description: "Simplify your life with our appliance collection."})

db.category.insertOne({_id: 2, category_name: "Phones & Tablets", description: "Whether you need to stay connected on the go or enjoy multimedia content, our Phone & Tablets section has you covered."})

db.category.insertOne({_id: 3, category_name: "Gaming", description: "Explore the latest video games, consoles, and accessories."})

db.users.insertOne({_id: 1, name: "Rodney Bennett", email: "rodney.bennett@gmail.com", gender: "male", phone_number: "360-770-0263", password: "2e2ee9yc", user_type: "user"})

db.users.insertOne({_id: 2, name: "Carla Lane", email: "carla.lane@gmail.com", gender: "female", phone_number: "276-622-7095", password: "idh3ife", user_type: "user"})

db.items.insertOne({_id: 1, name: "Microsoft Xbox One S/X Wireless Controller", description: "wireless controller", price: "$ 46", size: "small", colour: "white", brand: "Microsoft", category_id: "3"})

db.items.insertOne({_id: 2, name: "Playstation 4 Wireless Controller", description: "wireless controller", price: "$ 20", size: "small", colour: "Black", brand: "Sony", category_id: "3"})


// Getting data record from table

db.category.find({_id: { $in: [1, 2] }})

db.users.find({_id: 2})


// Updating data record from table

db.items.updateOne({_id: 1}, {$set: {price: "$ 35"}})

db.users.updateOne({_id: 1}, {$set: {password: "#1234567"}})

// Deleting data record from table

db.users.deleteOne({_id: 2})

db.category.deleteOne({_id: 1})

db.items.deleteOne({_id: 2})