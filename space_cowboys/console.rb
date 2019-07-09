require('pry')
require_relative('models/space_cowboys.rb')



  cowboy1 = SpaceCowboy.new({
    'name' => 'Thor',
    'species' => 'Vulcan',
    'bounty_value' => 100,
    'danger_level' => 'high',
    'last_known_location' => 'mars',
    'homewworld' => 'Jupiter',
    'favourite_weapon' => 'phaser',
    'cashed_in' => 1000,
    'collected_by' => 'Brian'
    })


    cowboy1.save()



    cowboy1.name = 'Spock'
    cowboy1.update


    cowboy1.delete($2)










binding.pry
nil
