# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin_user = User.create(:email => "test@fanvoice.com",
                         :password => "password")
admin_user.admin = true
admin_user.confirm!

non_admin = User.create(:email => "test_reg_user@fanvoice.com",
                        :password => "foobar")
non_admin.admin = false
non_admin.confirm!

SourceMaterial.create(:title => "Harry Potter", genre: "Fantasy",
                      description: "Harry, hermione and ron.")
