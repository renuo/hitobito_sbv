# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.

require Rails.root.join('db', 'seeds', 'support', 'group_seeder')

seeder = GroupSeeder.new

ch = Group.roots.first
srand(42)

unless ch.address.present?
  # avoid callbacks to prevent creating default groups twice
  ch.update_columns(seeder.group_attributes)

  ch.default_children.each do |child_class|
    child_class.first.update_attributes(seeder.group_attributes)
  end
end

states = Group::Region.seed(:name, :parent_id,
  {name: 'Bernischer Kantonal-Musikverband',
   address: "Klostergasse 3",
   zip_code: "3333",
   town: "Bern",
   country: "Schweiz",
   email: "kontakt@bkmv.ch",
   parent_id: ch.id},

  {name: 'Zürcher Blasmusikverband',
   address: "Tellgasse 3",
   zip_code: "8000",
   town: "Zürich",
   country: "Schweiz",
   email: "	sekretariat@zhbv.ch",
   parent_id: ch.id },

  {name: 'Zuger Blasmusikverband',
   address: "Sonnenweg 32",
   zip_code: "6340",
   town: "Baar ZG",
   country: "Schweiz",
   email: "info@zuger-blasmusikverband.ch",
   parent_id: ch.id }
)

states.each do |s|
  seeder.seed_social_accounts(s)
  board = s.children.where(type: 'Group::RegionBoard').first
  board.update_attributes(seeder.group_attributes)
end

regions = Group::Region.seed(:name, :parent_id,
                            {name: 'Musikverband Zürcher Unterland',
                             address: "Klostergasse 3",
                             zip_code: "8000",
                             town: "Zürich",
                             country: "Svizzera",
                             email: "zu@zh.ch",
                             parent_id: Group.find_by_name("Zürcher Blasmusikverband").id},
                           {name: 'Musikverband Amt + Limmattal',
                             address: "Klostergasse 3",
                             zip_code: "8000",
                             town: "Zürich",
                             country: "Svizzera",
                             email: "zu@zh.ch",
                             parent_id: Group.find_by_name("Zürcher Blasmusikverband").id}
)
regions.each do |s|
  seeder.seed_social_accounts(s)
  board = s.children.where(type: 'Group::RegionBoard').first
  board.update_attributes(seeder.group_attributes)
end

clubs = Group::Local.seed(:name, :parent_id,
seeder.group_attributes.merge(
  {name: 'Musikgesellschaft Köniz-Wabern',
   short_name: 'Musikgesellschaft Köniz-Wabern',
   parent_id: states[0].id }),

seeder.group_attributes.merge(
  {name: 'Metallharmonie Bern',
   short_name: 'Metallharmonie Bern',
   parent_id: states[0].id }),

seeder.group_attributes.merge(
  {name: 'Musikgesellschaft Bern-Bümpliz',
   short_name: 'Musikgesellschaft Bern-Bümpliz',
   parent_id: states[0].id }),

seeder.group_attributes.merge(
  {name: 'Musikverband Zürcher Unterland',
   short_name: 'Musikverband Zürcher Unterland',
   parent_id: regions[0].id }),

seeder.group_attributes.merge(
  {name: 'Jugendmusik Bezirk Affoltern',
   short_name: 'Jugendmusik Bezirk Affoltern',
   parent_id: regions[1].id }),

seeder.group_attributes.merge(
  {name: 'Musikverein Bassersdorf',
   short_name: 'Musikverein Bassersdorf',
   parent_id: regions[0].id }),

seeder.group_attributes.merge(
  {name: 'Jugendmusik Embrach',
   short_name: 'Jugendmusik Embrach',
   parent_id: regions[0].id }),

seeder.group_attributes.merge(
  {name: 'Feldmusik Baar',
   short_name: 'Baar',
   parent_id: states[2].id })
)

clubs.each do |s|
  seeder.seed_social_accounts(s)
end

Group.rebuild!
