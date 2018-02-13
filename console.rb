require('pry-byebug')
require_relative('models/bounties')



Bounties.delete_all
bounty1 = Bounties.new({'name' =>'B1',
  'bounty_value' => '2000',
  'homeworld' => 'Earth',
  'collected_by' => 'Tommy'})
bounty2 = Bounties.new({'name' =>'B2',
  'bounty_value' => '3000',
  'homeworld' => 'Saturn',
  'collected_by' => 'Clint'})

bounty3 = Bounties.new({'name' =>'B3',
  'bounty_value' => '4000',
  'homeworld' => 'Pluto',
  'collected_by' => 'George'})

bounty1.save
bounty2.save()
bounty3.save()
binding.pry
nil
