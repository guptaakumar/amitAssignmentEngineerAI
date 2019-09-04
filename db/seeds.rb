# frozen_string_literal: true
User.create(email: "admin@yopmail.com", password: "Admin@123",
            role: User.roles[:admin])
