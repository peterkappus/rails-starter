namespace :my_fixtures do
desc "Load my custom fixtures to popluate the database. Not quite Factory Girl..."

  task clean: [:environment] do
    #remove things
    #Model.destroy_all
  end

  task warn: [:environment] do
    #puts "WARNING: This may erase/overwrite existing data. Press enter to continue."
    #STDIN.gets
  end

  task users: [:environment, :clean, :warn] do
    #admin user
    u = User.new(name: 'Suzy Admin', admin: true, email: "email0@test.com")
    u.skip_confirmation!
    u.save(validate: false)

    #some other users
    [*(1..50)].each do |i|
      u = User.new(name: %w{Cindy Ada Jane Barbara Ann Benjamin Walter Alexis Simone Marina Oscar Julia Mark Lazlo Ray Lucretia Tom Peter Sarah Ringo John}.sample + " " + %w{Smith Jones Taylor Gibran Peterson Williams Mott Eames Johnson Davies Robinson Wright Knight Thompson Evans Walker White Roberts Green Hall Wood Jackson Clarke}.sample + " " + i.to_s, email: "email#{i}@test.com")
      u.skip_confirmation!
      u.save(validate:false)
    end
  end

  task :all => [:clean, :warn, :users]

end
